#!/usr/bin/env bash
set -euo pipefail

ERRORS=0

for pack in packs/technomaton-*/; do
  name=$(basename "$pack")
  plugin_json="$pack/.claude-plugin/plugin.json"
  license_file="$pack/LICENSE"

  [ ! -f "$plugin_json" ] && continue
  [ ! -f "$license_file" ] && continue

  tier=$(grep -o '"tier":\s*"[^"]*"' "$plugin_json" 2>/dev/null | head -1 | sed 's/.*"\([^"]*\)"/\1/')

  if [ "$tier" = "community" ]; then
    if ! grep -qi "MIT" "$license_file"; then
      echo "   FAIL: $name is tier=community but LICENSE does not contain 'MIT'"
      ERRORS=$((ERRORS + 1))
    else
      echo "   OK: $name (community/MIT)"
    fi
  elif [ "$tier" = "commercial" ]; then
    if ! grep -qi "Proprietary\|All Rights Reserved\|Commercial" "$license_file"; then
      echo "   FAIL: $name is tier=commercial but LICENSE does not contain proprietary terms"
      ERRORS=$((ERRORS + 1))
    else
      echo "   OK: $name (commercial/Proprietary)"
    fi
  fi
done

[ "$ERRORS" -eq 0 ] || exit 1
