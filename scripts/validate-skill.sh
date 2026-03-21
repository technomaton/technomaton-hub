#!/usr/bin/env bash
set -euo pipefail

ERRORS=0

for skill in packs/*/skills/*/SKILL.md; do
  [ ! -f "$skill" ] && continue

  # Check required frontmatter fields
  has_name=$(head -20 "$skill" | grep -c "^name:" || true)
  has_desc=$(head -20 "$skill" | grep -c "^description:" || true)
  has_tools=$(head -20 "$skill" | grep -c "^allowed-tools:" || true)

  if [ "$has_name" -eq 0 ] || [ "$has_desc" -eq 0 ] || [ "$has_tools" -eq 0 ]; then
    echo "   FAIL: $skill missing required frontmatter (name/description/allowed-tools)"
    ERRORS=$((ERRORS + 1))
  else
    echo "   OK: $skill"
  fi
done

[ "$ERRORS" -eq 0 ] || exit 1
