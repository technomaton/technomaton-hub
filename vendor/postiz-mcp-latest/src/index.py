#!/usr/bin/env python3
# ruff: noqa: E402
"""stdio MCP entrypoint for Postiz content operations."""

from __future__ import annotations

import json
import sys
from dataclasses import dataclass
from pathlib import Path

CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from change_log import ChangeLogger
from client import PostizClient
from config import Settings
from errors import serialize_error
from tools import ALL_TOOLS

try:
    from mcp.server import Server
    from mcp.server.stdio import stdio_server
    from mcp.types import TextContent
except ImportError:
    print(
        "Error: MCP SDK not installed. Install dependencies from postiz-content-mcp/pyproject.toml.",
        file=sys.stderr,
    )
    sys.exit(1)


@dataclass(slots=True)
class Runtime:
    settings: Settings
    client: PostizClient
    change_logger: ChangeLogger


SERVER_NAME = "postiz-content-mcp"
server = Server(SERVER_NAME)
tool_map = {tool.name: tool for tool in ALL_TOOLS}
_runtime: Runtime | None = None


def get_runtime() -> Runtime:
    global _runtime
    if _runtime is None:
        settings = Settings.load()
        _runtime = Runtime(
            settings=settings,
            client=PostizClient(
                api_key=settings.postiz_api_key,
                base_url=settings.postiz_base_url,
            ),
            change_logger=ChangeLogger(settings.change_log_path),
        )
    return _runtime


def _to_text(payload: dict) -> list[TextContent]:
    return [TextContent(type="text", text=json.dumps(payload, indent=2, default=str))]


def _finalize_payload(payload: dict, *, completion_state: str) -> dict:
    payload.setdefault("completion_state", completion_state)
    payload.setdefault("should_continue", True)
    return payload


@server.list_tools()
async def list_tools():
    return [tool.to_mcp_tool() for tool in ALL_TOOLS]


@server.call_tool()
async def call_tool(name: str, arguments: dict | None):
    definition = tool_map.get(name)
    if definition is None:
        return _to_text(
            _finalize_payload(
                {
                    "ok": False,
                    "error": {
                        "code": "unknown_tool",
                        "message": f"Unknown tool: {name}",
                        "retryable": False,
                    },
                },
                completion_state="failed",
            )
        )
    try:
        payload = definition.handler(get_runtime(), arguments or {})
        return _to_text(_finalize_payload(payload, completion_state="completed"))
    except Exception as exc:
        return _to_text(_finalize_payload(serialize_error(exc), completion_state="failed"))


async def main() -> None:
    async with stdio_server() as (read_stream, write_stream):
        await server.run(read_stream, write_stream, server.create_initialization_options())


def cli_main() -> None:
    import asyncio

    asyncio.run(main())


if __name__ == "__main__":
    cli_main()
