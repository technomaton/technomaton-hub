#!/usr/bin/env bash
set -euo pipefail

# Test: Orchestration Contract Validation
# Verifies that conductor agents' dispatch lists match actual agent files
# and that commands referencing conductors use valid specialist names.

ERRORS=0
WARNINGS=0

echo "--- Orchestration Contract Validation ---"

# Build flat list of all known agents
KNOWN_AGENTS=""
for pack in packs/tm-*/; do
  pack_name=$(basename "$pack")
  if [ -d "$pack/agents" ]; then
    for af in "$pack/agents"/*.md; do
      [ -f "$af" ] || continue
      KNOWN_AGENTS="$KNOWN_AGENTS $pack_name/$(basename "$af" .md)"
    done
  fi
done

for pack in packs/tm-*/; do
  pack_name=$(basename "$pack")
  agents_dir="$pack/agents"
  [ -d "$agents_dir" ] || continue

  for conductor in "$agents_dir"/*-conductor.md; do
    [ -f "$conductor" ] || continue
    conductor_name=$(basename "$conductor" .md)

    # Extract @agent references (excluding self)
    specialists=""
    specialist_count=0
    while IFS= read -r ref; do
      ref_name="${ref#@}"
      [ "$ref_name" = "$conductor_name" ] && continue
      # Deduplicate
      echo "$specialists" | grep -qw "$ref_name" && continue
      specialists="$specialists $ref_name"
      specialist_count=$((specialist_count + 1))
    done < <(grep -oE '@[a-z]+-[a-z][-a-z]*' "$conductor" 2>/dev/null | sort -u || true)

    # Verify each specialist exists
    for spec in $specialists; do
      [ -z "$spec" ] && continue
      if [ -f "$agents_dir/${spec}.md" ]; then
        continue
      fi
      # Cross-pack check for strategy conductor
      if [ "$pack_name" = "tm-strategy" ]; then
        found=false
        for other_pack in packs/tm-*/; do
          if [ -f "$other_pack/agents/${spec}.md" ]; then
            found=true
            break
          fi
        done
        if [ "$found" = "false" ]; then
          echo "   FAIL: $conductor — specialist @$spec not found in any pack"
          ERRORS=$((ERRORS + 1))
        fi
      else
        echo "   FAIL: $conductor — specialist @$spec not found in $agents_dir/"
        ERRORS=$((ERRORS + 1))
      fi
    done

    # Check claimed specialist count vs actual
    claimed_count=""
    while IFS= read -r match; do
      # Extract only the content after line number to avoid matching line numbers
      content=$(echo "$match" | sed 's/^[0-9]*://')
      word=$(echo "$content" | grep -oiE '\b(two|three|four|five|six|[0-9]+)\b' | head -1 | tr '[:upper:]' '[:lower:]')
      case "$word" in
        two|2) claimed_count=2 ;;
        three|3) claimed_count=3 ;;
        four|4) claimed_count=4 ;;
        five|5) claimed_count=5 ;;
        six|6) claimed_count=6 ;;
        *) claimed_count="$word" ;;
      esac
    done < <(grep -niE '\b(two|three|four|five|six) specialist' "$conductor" 2>/dev/null | head -1 || true)

    if [ -n "$claimed_count" ] && [ "$claimed_count" != "$specialist_count" ]; then
      echo "   WARN: $conductor — claims $claimed_count specialists but references $specialist_count unique agents"
      WARNINGS=$((WARNINGS + 1))
    fi

    echo "   OK: $conductor_name — $specialist_count specialists verified"

    # Verify commands that invoke this conductor
    for cmd_file in "$pack"/commands/**/*.md; do
      [ -f "$cmd_file" ] || continue

      if grep -q "@$conductor_name" "$cmd_file" 2>/dev/null; then
        # Extract agent refs from the command (excluding conductor itself)
        cmd_refs=""
        while IFS= read -r ref; do
          ref_name="${ref#@}"
          [ "$ref_name" = "$conductor_name" ] && continue
          echo "$cmd_refs" | grep -qw "$ref_name" && continue
          cmd_refs="$cmd_refs $ref_name"
        done < <(grep -oE '@[a-z]+-[a-z][-a-z]*' "$cmd_file" 2>/dev/null | sort -u || true)

        # Check command's specialist refs are subset of conductor's
        for cmd_ref in $cmd_refs; do
          [ -z "$cmd_ref" ] && continue
          if ! echo "$specialists" | grep -qw "$cmd_ref"; then
            line=$(grep -nE "@$cmd_ref" "$cmd_file" | head -1 | cut -d: -f1)
            echo "   FAIL: $cmd_file:$line — references @$cmd_ref but conductor $conductor_name does not dispatch to it"
            ERRORS=$((ERRORS + 1))
          fi
        done
      fi
    done
  done
done

echo "   Orchestration — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
