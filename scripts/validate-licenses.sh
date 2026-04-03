#!/usr/bin/env bash
set -euo pipefail

ERRORS=0

for pack in packs/tm-*/; do
  name=$(basename "$pack")
  plugin_json="$pack/.claude-plugin/plugin.json"
  license_file="$pack/LICENSE"

  [ ! -f "$plugin_json" ] && continue
  [ ! -f "$license_file" ] && continue

  # Read license from plugin.json
  license=$(grep -o '"license":\s*"[^"]*"' "$plugin_json" 2>/dev/null | head -1 | sed 's/.*"\([^"]*\)"/\1/')

  # Check if keywords contain tier info
  is_community=$(grep -c '"community"' "$plugin_json" || true)

  if [ "$license" = "MIT" ]; then
    if ! grep -qi "MIT" "$license_file"; then
      echo "   FAIL: $name declares license=MIT but LICENSE file does not contain 'MIT'"
      ERRORS=$((ERRORS + 1))
    else
      echo "   OK: $name (${is_community:+community/}MIT)"
    fi
  elif [ -n "$license" ]; then
    echo "   OK: $name ($license)"
  fi
done

[ "$ERRORS" -eq 0 ] || exit 1
