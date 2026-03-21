"""Structured error types for the Postiz Content MCP server."""

from __future__ import annotations

from typing import Any


class PostizContentMcpError(Exception):
    """Base error with structured payload support."""

    def __init__(
        self,
        message: str,
        *,
        code: str = "postiz_content_mcp_error",
        status_code: int | None = None,
        retryable: bool = False,
        details: Any | None = None,
    ) -> None:
        super().__init__(message)
        self.message = message
        self.code = code
        self.status_code = status_code
        self.retryable = retryable
        self.details = details

    def as_dict(self) -> dict[str, Any]:
        payload: dict[str, Any] = {
            "ok": False,
            "error": {
                "code": self.code,
                "message": self.message,
                "retryable": self.retryable,
            },
        }
        if self.status_code is not None:
            payload["error"]["status_code"] = self.status_code
        if self.details is not None:
            payload["error"]["details"] = self.details
        return payload


class ConfigurationError(PostizContentMcpError):
    """Raised when required configuration is missing or malformed."""

    def __init__(self, message: str, *, details: Any | None = None) -> None:
        super().__init__(
            message,
            code="configuration_error",
            status_code=400,
            retryable=False,
            details=details,
        )


class PostizApiError(PostizContentMcpError):
    """Structured Postiz API failure."""

    def __init__(
        self,
        message: str,
        *,
        status_code: int,
        retryable: bool,
        details: Any | None = None,
    ) -> None:
        super().__init__(
            message,
            code="postiz_api_error",
            status_code=status_code,
            retryable=retryable,
            details=details,
        )


def serialize_error(exc: Exception) -> dict[str, Any]:
    if isinstance(exc, PostizContentMcpError):
        return exc.as_dict()
    return {
        "ok": False,
        "error": {
            "code": "unexpected_error",
            "message": str(exc),
            "retryable": False,
        },
    }
