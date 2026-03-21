#!/usr/bin/env bash
set -euo pipefail

ERRORS=0
PLACEHOLDERS=0

for cmd in packs/*/commands/**/*.md; do
  [ ! -f "$cmd" ] && continue

  has_desc=$(head -10 "$cmd" | grep -c "^description:" || true)

  if [ "$has_desc" -eq 0 ]; then
    echo "   FAIL: $cmd missing required frontmatter (description)"
    ERRORS=$((ERRORS + 1))
  else
    echo "   OK: $cmd"
  fi

  is_placeholder=$(head -10 "$cmd" | grep -c "^status: placeholder" || true)
  if [ "$is_placeholder" -gt 0 ]; then
    echo "   INFO: $cmd is a placeholder"
    PLACEHOLDERS=$((PLACEHOLDERS + 1))
  fi
done

echo ""
echo "   Placeholders: $PLACEHOLDERS"

[ "$ERRORS" -eq 0 ] || exit 1
