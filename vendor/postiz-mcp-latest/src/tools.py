"""Tool definitions for Postiz Content MCP."""

from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime, timedelta, timezone
from typing import Any, Callable

from mcp.types import Tool

from errors import ConfigurationError


def _parse_iso_datetime(value: str, *, field_name: str) -> datetime:
    text = value.strip()
    if text.endswith("Z"):
        text = text[:-1] + "+00:00"
    try:
        parsed = datetime.fromisoformat(text)
    except ValueError as exc:
        raise ConfigurationError(
            f"{field_name} must be an ISO 8601 datetime",
            details={"field": field_name, "value": value},
        ) from exc
    if parsed.tzinfo is None:
        parsed = parsed.replace(tzinfo=timezone.utc)
    return parsed.astimezone(timezone.utc)


def _integration_health(integrations: list[dict[str, Any]], expected_ids: tuple[str, ...]) -> dict[str, Any]:
    active = [item for item in integrations if not bool(item.get("disabled", False))]
    active_channels = sorted({str(item.get("identifier", "")).strip().lower() or "unknown" for item in active})
    active_ids = {str(item.get("id") or "").strip() for item in active if str(item.get("id") or "").strip()}
    missing_expected = sorted(item for item in expected_ids if item not in active_ids)
    if not active:
        status = "issues"
        summary = "No active Postiz integrations are connected."
    elif missing_expected:
        status = "partial"
        summary = "Some configured Postiz integrations are not active."
    else:
        status = "ok"
        summary = "Postiz integrations are healthy."
    return {
        "status": status,
        "summary": summary,
        "active_channels": active_channels,
        "active_integrations_total": len(active),
        "missing_expected_integrations": missing_expected,
    }


@dataclass(slots=True)
class ToolDefinition:
    name: str
    description: str
    schema: dict[str, Any]
    handler: Callable[[Any, dict[str, Any]], dict[str, Any]]

    def to_mcp_tool(self) -> Tool:
        return Tool(
            name=self.name,
            description=self.description,
            inputSchema=self.schema,
        )


def get_postiz_integrations(runtime: Any, arguments: dict[str, Any]) -> dict[str, Any]:
    del arguments
    integrations = runtime.client.get_integrations()
    return {
        "ok": True,
        "integrations": integrations,
        "count": len(integrations),
    }


def get_postiz_channel_health(runtime: Any, arguments: dict[str, Any]) -> dict[str, Any]:
    integrations = runtime.client.get_integrations()
    expected = runtime.settings.expected_integration_ids
    if "expected_integration_ids" in arguments and isinstance(arguments["expected_integration_ids"], list):
        expected = tuple(str(item).strip() for item in arguments["expected_integration_ids"] if str(item).strip())
    return {
        "ok": True,
        "integrations_total": len(integrations),
        **_integration_health(integrations, expected),
    }


def list_postiz_posts(runtime: Any, arguments: dict[str, Any]) -> dict[str, Any]:
    start_raw = str(arguments.get("start_date") or "").strip()
    end_raw = str(arguments.get("end_date") or "").strip()
    if start_raw:
        start_date = _parse_iso_datetime(start_raw, field_name="start_date")
    else:
        start_date = datetime.now(timezone.utc) - timedelta(days=7)
    if end_raw:
        end_date = _parse_iso_datetime(end_raw, field_name="end_date")
    else:
        end_date = datetime.now(timezone.utc)
    posts = runtime.client.list_posts(start_date=start_date, end_date=end_date)
    return {
        "ok": True,
        "posts": posts,
        "count": len(posts),
        "start_date": start_date.isoformat().replace("+00:00", "Z"),
        "end_date": end_date.isoformat().replace("+00:00", "Z"),
    }


def upload_postiz_media_from_url(runtime: Any, arguments: dict[str, Any]) -> dict[str, Any]:
    media_url = str(arguments.get("url") or "").strip()
    if not media_url:
        raise ConfigurationError("Missing media URL", details={"field": "url"})
    response = runtime.client.upload_from_url(url=media_url)
    runtime.change_logger.record(
        operation="upload_postiz_media_from_url",
        request={"url": media_url},
        response=response,
    )
    return {
        "ok": True,
        "response": response,
    }


def create_postiz_post(runtime: Any, arguments: dict[str, Any]) -> dict[str, Any]:
    payload = arguments.get("payload")
    if not isinstance(payload, dict):
        raise ConfigurationError("payload must be an object", details={"field": "payload"})
    response = runtime.client.create_post(payload=payload)
    runtime.change_logger.record(
        operation="create_postiz_post",
        request={"payload": payload},
        response=response,
    )
    return {
        "ok": True,
        "response": response,
    }


ALL_TOOLS = [
    ToolDefinition(
        name="get_postiz_integrations",
        description="List connected Postiz integrations.",
        schema={"type": "object", "properties": {}, "additionalProperties": False},
        handler=get_postiz_integrations,
    ),
    ToolDefinition(
        name="get_postiz_channel_health",
        description="Evaluate Postiz channel readiness against active and optional expected integrations.",
        schema={
            "type": "object",
            "properties": {
                "expected_integration_ids": {
                    "type": "array",
                    "items": {"type": "string"},
                }
            },
            "additionalProperties": False,
        },
        handler=get_postiz_channel_health,
    ),
    ToolDefinition(
        name="list_postiz_posts",
        description="List Postiz posts for a time window.",
        schema={
            "type": "object",
            "properties": {
                "start_date": {"type": "string"},
                "end_date": {"type": "string"},
            },
            "additionalProperties": False,
        },
        handler=list_postiz_posts,
    ),
    ToolDefinition(
        name="upload_postiz_media_from_url",
        description="Upload remote media into Postiz from a public URL.",
        schema={
            "type": "object",
            "properties": {"url": {"type": "string"}},
            "required": ["url"],
            "additionalProperties": False,
        },
        handler=upload_postiz_media_from_url,
    ),
    ToolDefinition(
        name="create_postiz_post",
        description="Create a Postiz post or draft from the generic /posts payload.",
        schema={
            "type": "object",
            "properties": {"payload": {"type": "object"}},
            "required": ["payload"],
            "additionalProperties": False,
        },
        handler=create_postiz_post,
    ),
]
