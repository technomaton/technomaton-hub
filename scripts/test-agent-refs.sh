#!/usr/bin/env bash
set -euo pipefail

# Test: Agent Reference Validation
# Verifies that all @agent-name references in commands and agents resolve
# to actual agent files in the same pack.

ERRORS=0
WARNINGS=0

echo "--- Agent Reference Validation ---"

# Build a flat list of all known agents: "pack_name/agent_name"
KNOWN_AGENTS=""
for pack in packs/tm-*/; do
  pack_name=$(basename "$pack")
  agents_dir="$pack/agents"
  [ -d "$agents_dir" ] || continue
  for agent_file in "$agents_dir"/*.md; do
    [ -f "$agent_file" ] || continue
    agent_basename=$(basename "$agent_file" .md)
    KNOWN_AGENTS="$KNOWN_AGENTS $pack_name/$agent_basename"
  done
done

agent_exists_in_pack() {
  local pack="$1"
  local name="$2"
  echo "$KNOWN_AGENTS" | grep -qw "$pack/$name"
}

agent_exists_anywhere() {
  local name="$1"
  echo "$KNOWN_AGENTS" | grep -qE "[^/]+/$name( |$)"
}

for pack in packs/tm-*/; do
  pack_name=$(basename "$pack")

  for search_dir in "$pack/commands" "$pack/agents"; do
    [ -d "$search_dir" ] || continue

    while IFS= read -r match; do
      [ -z "$match" ] && continue
      file=$(echo "$match" | cut -d: -f1)
      line_num=$(echo "$match" | cut -d: -f2)
      ref_raw=$(echo "$match" | grep -oE '@[a-z]+-[a-z][-a-z]*' | head -1)
      ref_name="${ref_raw#@}"

      [ -z "$ref_name" ] && continue

      if agent_exists_in_pack "$pack_name" "$ref_name"; then
        continue
      fi

      # For strategy pack (or any pack with composed-from), check cross-pack
      if [ "$pack_name" = "tm-strategy" ]; then
        if ! agent_exists_anywhere "$ref_name"; then
          echo "   FAIL: $file:$line_num — @$ref_name not found in any pack"
          ERRORS=$((ERRORS + 1))
        fi
      else
        echo "   FAIL: $file:$line_num — @$ref_name not found in $pack/agents/"
        ERRORS=$((ERRORS + 1))
      fi
    done < <(grep -rnE '@[a-z]+-[a-z][-a-z]*' "$search_dir" 2>/dev/null || true)
  done
done

if [ "$ERRORS" -eq 0 ]; then
  echo "   OK: All agent references resolve"
fi

echo "   Agent refs — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
