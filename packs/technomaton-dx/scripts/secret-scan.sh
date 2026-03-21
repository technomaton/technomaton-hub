#!/usr/bin/env bash
set -euo pipefail
( git ls-files || true ) | while read -r f; do grep -nE "BEGIN( RSA| OPENSSH| EC )? PRIVATE KEY|AKIA[0-9A-Z]{16}|(?i)(token|secret|apikey|api_key|password)\s*[:=]\s*['\"][^'\"][\"']+" "$f" 2>/dev/null || true; done | sed 's/^/[secret]/' || true
