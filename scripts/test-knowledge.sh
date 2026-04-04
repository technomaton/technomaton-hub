#!/usr/bin/env bash
set -euo pipefail

# Test: Knowledge File Integrity
# Validates bibliography mapping, cross-file references,
# and knowledge file completeness.

ERRORS=0
WARNINGS=0

echo "--- Knowledge File Integrity ---"

# 1. File-to-source mapping: every knowledge file should appear in bibliography
echo "   Checking bibliography file-to-source mappings..."

check_bibliography() {
  local pack_name="$1"
  local biblio="$2"
  local prefix="$3"

  [ -f "$biblio" ] || { echo "   WARN: $biblio not found"; WARNINGS=$((WARNINGS + 1)); return; }

  for skill_dir in "packs/$pack_name"/skills/*/; do
    [ -d "$skill_dir" ] || continue
    for kf in "$skill_dir"${prefix}*.md; do
      [ -f "$kf" ] || continue
      kf_basename=$(basename "$kf")
      [[ "$kf_basename" == *BIBLIOGRAPHY* ]] && continue

      if ! grep -q "$kf_basename" "$biblio" 2>/dev/null; then
        echo "   FAIL: [$pack_name] $kf_basename not found in $(basename "$biblio") file-to-source mapping"
        ERRORS=$((ERRORS + 1))
      fi
    done
  done
}

check_bibliography "tm-pmf" "packs/tm-pmf/skills/pmf-assessment/AI_PMF_BIBLIOGRAPHY.md" "AI_PMF_"
check_bibliography "tm-vuca" "packs/tm-vuca/skills/vuca-assessment/VUCA_BIBLIOGRAPHY.md" "VUCA_"
check_bibliography "tm-wardley" "packs/tm-wardley/skills/wardley-assessment/WARDLEY_BIBLIOGRAPHY.md" "WARDLEY_"

# Also check CASE_STUDIES.md in pmf-opportunity
case_studies="packs/tm-pmf/skills/pmf-opportunity/CASE_STUDIES.md"
if [ -f "$case_studies" ]; then
  biblio="packs/tm-pmf/skills/pmf-assessment/AI_PMF_BIBLIOGRAPHY.md"
  if [ -f "$biblio" ] && ! grep -q "CASE_STUDIES.md" "$biblio" 2>/dev/null; then
    echo "   WARN: [tm-pmf] CASE_STUDIES.md not referenced in bibliography (may be expected — separate skill)"
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# 2. Agent knowledge base references: verify agents can find their knowledge files
echo "   Checking agent knowledge base references..."
for pack in packs/tm-pmf packs/tm-vuca packs/tm-wardley; do
  pack_name=$(basename "$pack")
  agents_dir="$pack/agents"
  [ -d "$agents_dir" ] || continue

  for agent in "$agents_dir"/*.md; do
    [ -f "$agent" ] || continue

    while IFS= read -r ref; do
      [ -z "$ref" ] && continue
      ref_clean=$(echo "$ref" | tr -d '`')
      if [ ! -f "$pack/$ref_clean" ]; then
        line=$(grep -nF "$ref_clean" "$agent" | head -1 | cut -d: -f1)
        echo "   FAIL: [$pack_name] $(basename "$agent"):$line — knowledge ref $ref_clean not found"
        ERRORS=$((ERRORS + 1))
      fi
    done < <(grep -oE '`skills/[^`]+`' "$agent" 2>/dev/null | tr -d '`' || true)
  done
done

# 3. Knowledge file cross-references (within skill directory)
echo "   Checking knowledge cross-file references..."
for pack in packs/tm-pmf packs/tm-vuca packs/tm-wardley; do
  pack_name=$(basename "$pack")
  for skill_dir in "$pack"/skills/*/; do
    [ -d "$skill_dir" ] || continue
    for kf in "$skill_dir"*.md; do
      [ -f "$kf" ] || continue
      kf_basename=$(basename "$kf")

      # Look for references to other .md files in backticks
      while IFS= read -r ref; do
        [ -z "$ref" ] && continue
        ref_clean=$(echo "$ref" | tr -d '`')
        [[ "$ref_clean" == *.md ]] || continue
        # Skip self-references
        [ "$ref_clean" = "$kf_basename" ] && continue
        # Check if target exists in same directory
        if [ ! -f "$skill_dir/$ref_clean" ]; then
          # Only report if it looks like a local file reference (CAPS or starts with pack prefix)
          if [[ "$ref_clean" =~ ^[A-Z] ]]; then
            line=$(grep -nF "$ref_clean" "$kf" | head -1 | cut -d: -f1)
            echo "   WARN: [$pack_name] $kf_basename:$line references $ref_clean — not found in $(basename "$skill_dir")/"
            WARNINGS=$((WARNINGS + 1))
          fi
        fi
      done < <(grep -oE '`[A-Z][A-Z_]*\.md`' "$kf" 2>/dev/null | tr -d '`' || true)
    done
  done
done

# 4. SKILL.md context file references
echo "   Checking SKILL.md context references..."
for skill_md in packs/tm-*/skills/*/SKILL.md; do
  [ -f "$skill_md" ] || continue
  skill_dir=$(dirname "$skill_md")
  pack_dir=$(echo "$skill_md" | sed 's|/skills/.*||')
  pack_name=$(basename "$pack_dir")

  # Extract context file references from frontmatter
  in_context=false
  while IFS= read -r line; do
    if [[ "$line" =~ ^context: ]]; then
      in_context=true
      continue
    fi
    if [ "$in_context" = "true" ]; then
      # Stop when hitting another top-level key
      if [[ "$line" =~ ^[a-z] ]] && [[ ! "$line" =~ ^[[:space:]] ]]; then
        break
      fi
      if [[ "$line" =~ ^[[:space:]]*-[[:space:]] ]]; then
        ctx_ref=$(echo "$line" | sed 's/^[[:space:]]*-[[:space:]]*//' | tr -d '"' | tr -d "'")
        [ -z "$ctx_ref" ] && continue
        [[ "$ctx_ref" == *.md ]] || continue
        if [ ! -f "$skill_dir/$ctx_ref" ]; then
          echo "   FAIL: [$pack_name] $skill_md — context ref $ctx_ref not found in $skill_dir/"
          ERRORS=$((ERRORS + 1))
        fi
      fi
    fi
  done < "$skill_md"
done

if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
  echo "   OK: All knowledge files verified"
fi

echo "   Knowledge — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
