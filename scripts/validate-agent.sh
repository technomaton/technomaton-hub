#!/usr/bin/env bash
set -euo pipefail

ERRORS=0

for agent in packs/*/agents/*.md; do
  [ ! -f "$agent" ] && continue

  has_name=$(head -20 "$agent" | grep -c "^name:" || true)
  has_desc=$(head -20 "$agent" | grep -c "^description:" || true)

  if [ "$has_name" -eq 0 ] || [ "$has_desc" -eq 0 ]; then
    echo "   FAIL: $agent missing required frontmatter (name/description)"
    ERRORS=$((ERRORS + 1))
  else
    echo "   OK: $agent"
  fi
done

[ "$ERRORS" -eq 0 ] || exit 1
