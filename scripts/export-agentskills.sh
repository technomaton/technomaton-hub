#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false
[ "${1:-}" = "--dry-run" ] && DRY_RUN=true

DIST="dist/agentskills"
CC_FIELDS="allowed-tools|context|model|hooks|disable-model-invocation"

echo "=== Agent Skills Export ==="

if [ "$DRY_RUN" = false ]; then
  rm -rf "$DIST"
fi

for skill in packs/*/skills/*/SKILL.md; do
  [ ! -f "$skill" ] && continue

  # Extract pack and skill name from path
  pack=$(echo "$skill" | cut -d/ -f2)
  skill_name=$(echo "$skill" | cut -d/ -f4)
  out_dir="$DIST/$pack/$skill_name"

  if [ "$DRY_RUN" = true ]; then
    echo "   Would export: $skill -> $out_dir/SKILL.md"
    continue
  fi

  mkdir -p "$out_dir"

  # Process: strip CC-specific fields from frontmatter, keep everything else
  # Handles multiline YAML values (block scalars with | or >, and continuation lines)
  awk -v cc_fields="$CC_FIELDS" '
    BEGIN { in_frontmatter=0; fm_count=0; skipping_multiline=0 }
    /^---$/ {
      fm_count++
      skipping_multiline=0
      if (fm_count == 1) { in_frontmatter=1; print; next }
      if (fm_count == 2) { in_frontmatter=0; print; next }
    }
    in_frontmatter {
      # If line starts with whitespace, it is a continuation of the previous field
      if (/^[[:space:]]/ && skipping_multiline) { next }
      # New field line (starts with non-space) — reset multiline state
      skipping_multiline=0
      skip=0
      split(cc_fields, fields, "|")
      for (i in fields) {
        if ($0 ~ "^" fields[i] ":") { skip=1; break }
      }
      if (skip) { skipping_multiline=1; next }
      print
      next
    }
    { print }
  ' "$skill" > "$out_dir/SKILL.md"

  echo "   Exported: $skill -> $out_dir/SKILL.md"
done

if [ "$DRY_RUN" = false ]; then
  count=$(find "$DIST" -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')
  echo "=== Exported $count skills to $DIST ==="
fi
