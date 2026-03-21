#!/usr/bin/env bash
set -euo pipefail
CHANGED="$(git diff --name-only HEAD || true)"; [[ -z "$CHANGED" ]] && exit 0;
command -v prettier >/dev/null && echo "$CHANGED" | xargs -r prettier --write || true
command -v black >/dev/null && echo "$CHANGED" | xargs -r black || true
