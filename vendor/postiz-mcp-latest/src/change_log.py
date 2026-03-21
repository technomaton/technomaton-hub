"""Append-only mutation logging for Postiz Content MCP."""

from __future__ import annotations

import json
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


class ChangeLogger:
    def __init__(self, path: Path) -> None:
        self.path = path

    def record(self, *, operation: str, request: dict[str, Any], response: dict[str, Any]) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        row = {
            "timestamp_utc": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z"),
            "operation": operation,
            "request": request,
            "response": response,
        }
        with self.path.open("a", encoding="utf-8") as handle:
            handle.write(json.dumps(row) + "\n")
