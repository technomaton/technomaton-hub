#!/usr/bin/env bash
set -euo pipefail
[[ -f README.md ]] || echo 'HINT: add README.md'
[[ -d docs/adr ]] || echo 'HINT: use docs/adr/'
[[ -f CHANGELOG.md ]] || echo 'HINT: maintain CHANGELOG.md'
