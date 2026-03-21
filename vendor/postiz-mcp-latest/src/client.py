"""Minimal Postiz API client helpers."""

from __future__ import annotations

import json
from dataclasses import dataclass
from datetime import datetime
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

from errors import PostizApiError


def _parse_response_body(raw: str) -> dict[str, Any] | list[Any] | str:
    try:
        return json.loads(raw) if raw else {}
    except Exception:
        return raw


@dataclass(slots=True)
class PostizClient:
    api_key: str
    base_url: str

    def request(
        self,
        method: str,
        path: str,
        *,
        json_body: dict[str, Any] | None = None,
    ) -> dict[str, Any] | list[Any]:
        body = None if json_body is None else json.dumps(json_body).encode("utf-8")
        req = Request(
            f"{self.base_url.rstrip('/')}{path}",
            data=body,
            method=method,
            headers={
                "Authorization": self.api_key,
                "Content-Type": "application/json",
            },
        )
        try:
            with urlopen(req, timeout=30) as resp:
                raw = resp.read().decode("utf-8")
                payload = _parse_response_body(raw)
                if isinstance(payload, str):
                    return {"raw": payload}
                return payload
        except HTTPError as exc:
            raw = exc.read().decode("utf-8")
            payload = _parse_response_body(raw)
            raise PostizApiError(
                "Postiz API request failed",
                status_code=exc.code,
                retryable=exc.code >= 500,
                details={"path": path, "response": payload},
            ) from exc
        except URLError as exc:
            raise PostizApiError(
                "Postiz API request failed",
                status_code=0,
                retryable=True,
                details={"path": path, "error": str(exc)},
            ) from exc

    def get_integrations(self) -> list[dict[str, Any]]:
        payload = self.request("GET", "/integrations")
        return [item for item in payload if isinstance(item, dict)] if isinstance(payload, list) else []

    def list_posts(
        self,
        *,
        start_date: datetime,
        end_date: datetime,
    ) -> list[dict[str, Any]]:
        query = urlencode(
            {
                "startDate": start_date.isoformat(),
                "endDate": end_date.isoformat(),
            }
        )
        payload = self.request("GET", f"/posts?{query}")
        if isinstance(payload, dict):
            posts = payload.get("posts")
            if isinstance(posts, list):
                return [item for item in posts if isinstance(item, dict)]
        return []

    def upload_from_url(self, *, url: str) -> dict[str, Any]:
        payload = self.request("POST", "/upload-from-url", json_body={"url": url})
        return payload if isinstance(payload, dict) else {"data": payload}

    def create_post(self, *, payload: dict[str, Any]) -> dict[str, Any]:
        response = self.request("POST", "/posts", json_body=payload)
        return response if isinstance(response, dict) else {"data": response}
