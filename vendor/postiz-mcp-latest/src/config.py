"""Configuration loading for the Postiz Content MCP server."""

from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path

from errors import ConfigurationError


SERVER_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_CHANGE_LOG_PATH = SERVER_ROOT / "data" / "changes.jsonl"


def _parse_env_file(path: Path) -> dict[str, str]:
    if not path.exists():
        return {}
    values: dict[str, str] = {}
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("export "):
            line = line[len("export ") :].strip()
        if "=" not in line:
            continue
        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip()
        if value[:1] == value[-1:] and value[:1] in {"'", '"'}:
            value = value[1:-1]
        if key:
            values[key] = value
    return values


def _candidate_env_paths() -> list[Path]:
    paths = [SERVER_ROOT / ".env"]
    override = os.getenv("POSTIZ_CONTENT_MCP_ENV", "").strip()
    if override:
        paths.append(Path(override).expanduser())
    return paths


def _first_value(values: dict[str, str], *names: str) -> str | None:
    for name in names:
        raw = values.get(name)
        if raw is not None and raw != "":
            return raw
    return None


def _parse_expected_integration_ids(raw: str | None) -> tuple[str, ...]:
    if not raw:
        return ()
    return tuple(item.strip() for item in raw.split(",") if item.strip())


@dataclass(slots=True)
class Settings:
    postiz_api_key: str
    postiz_base_url: str
    expected_integration_ids: tuple[str, ...]
    change_log_path: Path

    @classmethod
    def load(cls) -> "Settings":
        merged: dict[str, str] = {}
        for path in _candidate_env_paths():
            merged.update(_parse_env_file(path))
        merged.update(os.environ)

        api_key = _first_value(merged, "POSTIZ_API_KEY")
        if not api_key:
            raise ConfigurationError(
                "Missing required Postiz configuration",
                details={"missing": ["POSTIZ_API_KEY"]},
            )

        base_url = (_first_value(merged, "POSTIZ_BASE_URL") or "https://api.postiz.com/public/v1").rstrip("/")
        change_log_raw = _first_value(merged, "POSTIZ_CONTENT_MCP_CHANGE_LOG_PATH")
        return cls(
            postiz_api_key=api_key,
            postiz_base_url=base_url,
            expected_integration_ids=_parse_expected_integration_ids(
                _first_value(merged, "POSTIZ_EXPECTED_INTEGRATION_IDS")
            ),
            change_log_path=Path(change_log_raw).expanduser() if change_log_raw else DEFAULT_CHANGE_LOG_PATH,
        )
