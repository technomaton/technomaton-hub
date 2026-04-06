#!/usr/bin/env bash
set -euo pipefail

# Test: Hooks Validation
# Verifies that all scripts referenced in hooks.json files exist
# and that the hooks.json format is correct.

ERRORS=0
WARNINGS=0

echo "--- Hooks Validation ---"

for pack in packs/tm-*/; do
  pack_name=$(basename "$pack")
  hooks_file="$pack/hooks/hooks.json"

  if [ ! -f "$hooks_file" ]; then
    echo "   WARN: $pack_name — hooks.json not found"
    WARNINGS=$((WARNINGS + 1))
    continue
  fi

  # Check if hooks.json is valid JSON
  if ! python3 -c "import json; json.load(open('$hooks_file'))" 2>/dev/null; then
    echo "   FAIL: $pack_name — hooks.json is not valid JSON"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # Check if hooks object exists
  has_hooks=$(python3 -c "
import json
d = json.load(open('$hooks_file'))
hooks = d.get('hooks', {})
print(len(hooks))
" 2>/dev/null || echo "0")

  if [ "$has_hooks" = "0" ]; then
    echo "   OK: $pack_name — hooks.json (empty hooks)"
    continue
  fi

  # Extract command references and verify scripts exist
  # Using python3 for reliable JSON parsing
  script_refs=$(python3 -c "
import json
d = json.load(open('$hooks_file'))
for event_name, matchers in d.get('hooks', {}).items():
    for matcher in matchers:
        for hook in matcher.get('hooks', []):
            cmd = hook.get('command', '')
            if cmd:
                print(event_name + '\t' + matcher.get('matcher', '*') + '\t' + cmd)
" 2>/dev/null || true)

  if [ -z "$script_refs" ]; then
    echo "   OK: $pack_name — hooks.json (no commands)"
    continue
  fi

  while IFS=$'\t' read -r event matcher cmd; do
    [ -z "$cmd" ] && continue

    # Resolve ${CLAUDE_PLUGIN_ROOT} to the pack directory
    resolved_cmd=$(echo "$cmd" | sed "s|\${CLAUDE_PLUGIN_ROOT}|$pack|g")

    # Extract the script path from the command (handle "bash script.sh args")
    script_path=$(echo "$resolved_cmd" | awk '{
      for (i=1; i<=NF; i++) {
        if ($i ~ /\.sh$/ || $i ~ /\.py$/ || ($i ~ /\// && $i !~ /^-/)) {
          print $i; exit
        }
      }
    }')

    if [ -z "$script_path" ]; then
      echo "   WARN: $pack_name — $event:$matcher — cannot extract script path from: $cmd"
      WARNINGS=$((WARNINGS + 1))
      continue
    fi

    # Remove trailing arguments
    script_path=$(echo "$script_path" | awk '{print $1}')

    if [ ! -f "$script_path" ]; then
      echo "   FAIL: $pack_name — $event:$matcher — script not found: $script_path (from: $cmd)"
      ERRORS=$((ERRORS + 1))
    elif [ ! -x "$script_path" ]; then
      echo "   WARN: $pack_name — $event:$matcher — script not executable: $script_path"
      WARNINGS=$((WARNINGS + 1))
    else
      echo "   OK: $pack_name — $event:$matcher → $script_path"
    fi
  done <<< "$script_refs"

  # Check for timeout on all hooks (best practice)
  missing_timeout=$(python3 -c "
import json
d = json.load(open('$hooks_file'))
count = 0
for event_name, matchers in d.get('hooks', {}).items():
    for matcher in matchers:
        for hook in matcher.get('hooks', []):
            if 'timeout' not in hook and hook.get('type') == 'command':
                count += 1
print(count)
" 2>/dev/null || echo "0")

  if [ "$missing_timeout" -gt 0 ]; then
    echo "   WARN: $pack_name — $missing_timeout hook(s) missing timeout field"
    WARNINGS=$((WARNINGS + 1))
  fi
done

if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
  echo "   OK: All hooks validated"
fi

echo "   Hooks — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
