#!/usr/bin/env bash
set -euo pipefail

# Quality Scoring System
# Computes a composite health score (0-100) per pack across 4 dimensions:
#   Structural (0.20) + Content Consistency (0.35) + Knowledge Coverage (0.25) + Agent Readiness (0.20)
#
# Usage:
#   bash scripts/quality-score.sh                  # Print to stdout
#   bash scripts/quality-score.sh --output DIR     # Also write YAML reports to DIR

OUTPUT_DIR=""
if [ "${1:-}" = "--output" ] && [ -n "${2:-}" ]; then
  OUTPUT_DIR="$2"
  mkdir -p "$OUTPUT_DIR"
fi

DATE=$(date -u +%Y-%m-%d)
PACKS_TO_SCORE="tm-pmf tm-vuca tm-wardley tm-strategy"

echo "=== Quality Score Report — $DATE ==="
echo ""

# Collect scores per pack
overall_pass=0
overall_total=0

for pack_name in $PACKS_TO_SCORE; do
  pack_dir="packs/$pack_name"
  [ -d "$pack_dir" ] || continue

  echo "--- $pack_name ---"

  # --- Dimension 1: Structural Integrity (0-100) ---
  struct_score=100
  struct_checks=0
  struct_fails=0

  # Check required files
  for req in ".claude-plugin/plugin.json" ".mcp.json" "hooks/hooks.json" "README.md" "CHANGELOG.md" "LICENSE"; do
    struct_checks=$((struct_checks + 1))
    [ -f "$pack_dir/$req" ] || struct_fails=$((struct_fails + 1))
  done

  # Check SKILL.md frontmatter
  for skill_md in "$pack_dir"/skills/*/SKILL.md; do
    [ -f "$skill_md" ] || continue
    struct_checks=$((struct_checks + 1))
    has_name=$(grep -c '^name:' "$skill_md" 2>/dev/null || echo 0)
    has_desc=$(grep -c '^description:' "$skill_md" 2>/dev/null || echo 0)
    has_tools=$(grep -c '^allowed-tools:' "$skill_md" 2>/dev/null || echo 0)
    [ "$has_name" -gt 0 ] && [ "$has_desc" -gt 0 ] && [ "$has_tools" -gt 0 ] || struct_fails=$((struct_fails + 1))
  done

  # Check agent frontmatter
  for agent_md in "$pack_dir"/agents/*.md; do
    [ -f "$agent_md" ] || continue
    [[ "$(basename "$agent_md")" == ".gitkeep" ]] && continue
    struct_checks=$((struct_checks + 1))
    has_name=$(grep -c '^name:' "$agent_md" 2>/dev/null || echo 0)
    has_desc=$(grep -c '^description:' "$agent_md" 2>/dev/null || echo 0)
    [ "$has_name" -gt 0 ] && [ "$has_desc" -gt 0 ] || struct_fails=$((struct_fails + 1))
  done

  # Check command frontmatter
  for cmd_md in "$pack_dir"/commands/**/*.md; do
    [ -f "$cmd_md" ] || continue
    struct_checks=$((struct_checks + 1))
    has_desc=$(grep -c '^description:' "$cmd_md" 2>/dev/null || echo 0)
    [ "$has_desc" -gt 0 ] || struct_fails=$((struct_fails + 1))
  done

  if [ "$struct_checks" -gt 0 ]; then
    struct_score=$(( (struct_checks - struct_fails) * 100 / struct_checks ))
  fi

  # --- Dimension 2: Content Consistency (0-100) ---
  cc_checks=0
  cc_fails=0

  # Agent reference validity
  for search_dir in "$pack_dir/commands" "$pack_dir/agents"; do
    [ -d "$search_dir" ] || continue
    while IFS= read -r ref; do
      [ -z "$ref" ] && continue
      ref_name="${ref#@}"
      cc_checks=$((cc_checks + 1))
      # Check in same pack
      if [ ! -f "$pack_dir/agents/${ref_name}.md" ]; then
        # Cross-pack check for strategy
        if [ "$pack_name" = "tm-strategy" ]; then
          found=false
          for op in packs/tm-*/; do
            [ -f "$op/agents/${ref_name}.md" ] && found=true && break
          done
          [ "$found" = "false" ] && cc_fails=$((cc_fails + 1))
        else
          cc_fails=$((cc_fails + 1))
        fi
      fi
    done < <(grep -rohE '@[a-z]+-[a-z][-a-z]*' "$search_dir" 2>/dev/null | sort -u || true)
  done

  # Taxonomy/naming consistency (for pmf)
  if [ "$pack_name" = "tm-pmf" ]; then
    moat_cmd="$pack_dir/commands/pmf/moat.md"
    moat_agent="$pack_dir/agents/pmf-moat.md"
    if [ -f "$moat_cmd" ] && [ -f "$moat_agent" ]; then
      cc_checks=$((cc_checks + 1))
      cmd_tax=$(grep -oE '(Three|Five|Four)-Moat' "$moat_cmd" 2>/dev/null | head -1 || true)
      agent_tax=$(grep -oE '(Three|Five|Four)-Moat' "$moat_agent" 2>/dev/null | head -1 || true)
      [ -n "$cmd_tax" ] && [ -n "$agent_tax" ] && [ "$cmd_tax" != "$agent_tax" ] && cc_fails=$((cc_fails + 1))
    fi
  fi

  cc_score=100
  if [ "$cc_checks" -gt 0 ]; then
    cc_score=$(( (cc_checks - cc_fails) * 100 / cc_checks ))
  fi

  # --- Dimension 3: Knowledge Coverage (0-100) ---
  kc_checks=0
  kc_fails=0

  # Bibliography file coverage
  case "$pack_name" in
    tm-pmf)
      biblio="$pack_dir/skills/pmf-assessment/AI_PMF_BIBLIOGRAPHY.md"
      prefix="AI_PMF_"
      ;;
    tm-vuca)
      biblio="$pack_dir/skills/vuca-assessment/VUCA_BIBLIOGRAPHY.md"
      prefix="VUCA_"
      ;;
    tm-wardley)
      biblio="$pack_dir/skills/wardley-assessment/WARDLEY_BIBLIOGRAPHY.md"
      prefix="WARDLEY_"
      ;;
    *) biblio="" ; prefix="" ;;
  esac

  if [ -n "$biblio" ] && [ -f "$biblio" ]; then
    for skill_dir in "$pack_dir"/skills/*/; do
      [ -d "$skill_dir" ] || continue
      for kf in "$skill_dir"${prefix}*.md; do
        [ -f "$kf" ] || continue
        kf_basename=$(basename "$kf")
        [[ "$kf_basename" == *BIBLIOGRAPHY* ]] && continue
        kc_checks=$((kc_checks + 1))
        grep -q "$kf_basename" "$biblio" 2>/dev/null || kc_fails=$((kc_fails + 1))
      done
    done
  fi

  # Agent knowledge base file existence
  if [ -d "$pack_dir/agents" ]; then
    for agent in "$pack_dir"/agents/*.md; do
      [ -f "$agent" ] || continue
      while IFS= read -r ref; do
        [ -z "$ref" ] && continue
        ref_clean=$(echo "$ref" | tr -d '`')
        kc_checks=$((kc_checks + 1))
        [ -f "$pack_dir/$ref_clean" ] || kc_fails=$((kc_fails + 1))
      done < <(grep -oE '`skills/[^`]+`' "$agent" 2>/dev/null | tr -d '`' || true)
    done
  fi

  kc_score=100
  if [ "$kc_checks" -gt 0 ]; then
    kc_score=$(( (kc_checks - kc_fails) * 100 / kc_checks ))
  fi

  # --- Dimension 4: Agent Readiness (0-100) ---
  ar_checks=0
  ar_fails=0

  if [ -d "$pack_dir/agents" ]; then
    for agent in "$pack_dir"/agents/*.md; do
      [ -f "$agent" ] || continue
      [[ "$(basename "$agent")" == ".gitkeep" ]] && continue

      # Tools declared
      ar_checks=$((ar_checks + 1))
      grep -q '^tools:' "$agent" 2>/dev/null || ar_fails=$((ar_fails + 1))

      # Output format section
      ar_checks=$((ar_checks + 1))
      grep -qi '## Output' "$agent" 2>/dev/null || ar_fails=$((ar_fails + 1))

      # When to use section
      ar_checks=$((ar_checks + 1))
      grep -qi '## When to Use' "$agent" 2>/dev/null || ar_fails=$((ar_fails + 1))
    done
  fi

  ar_score=100
  if [ "$ar_checks" -gt 0 ]; then
    ar_score=$(( (ar_checks - ar_fails) * 100 / ar_checks ))
  fi

  # --- Composite Score ---
  # Structural (0.20) + Content Consistency (0.35) + Knowledge Coverage (0.25) + Agent Readiness (0.20)
  composite=$(( (struct_score * 20 + cc_score * 35 + kc_score * 25 + ar_score * 20) / 100 ))

  # Grade
  grade="critical"
  [ "$composite" -ge 50 ] && grade="warning"
  [ "$composite" -ge 70 ] && grade="attention"
  [ "$composite" -ge 90 ] && grade="healthy"

  # Get version from plugin.json
  version="unknown"
  pj="$pack_dir/.claude-plugin/plugin.json"
  if [ -f "$pj" ]; then
    version=$(grep '"version"' "$pj" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || echo "unknown")
  fi

  echo "   Structural:          $struct_score/100 ($struct_checks checks, $struct_fails failures)"
  echo "   Content Consistency: $cc_score/100 ($cc_checks checks, $cc_fails failures)"
  echo "   Knowledge Coverage:  $kc_score/100 ($kc_checks checks, $kc_fails failures)"
  echo "   Agent Readiness:     $ar_score/100 ($ar_checks checks, $ar_fails failures)"
  echo "   ──────────────────────────────"
  echo "   HEALTH SCORE:        $composite/100 [$grade]"
  echo ""

  overall_total=$((overall_total + 1))
  [ "$composite" -ge 70 ] && overall_pass=$((overall_pass + 1))

  # Write YAML report if output dir specified
  if [ -n "$OUTPUT_DIR" ]; then
    pack_report_dir="$OUTPUT_DIR/$pack_name"
    mkdir -p "$pack_report_dir"
    cat > "$pack_report_dir/$DATE.yml" <<REPORT
pack: $pack_name
date: "$DATE"
version: "$version"
score: $composite
grade: $grade
dimensions:
  structural:
    score: $struct_score
    checks: $struct_checks
    failures: $struct_fails
  content_consistency:
    score: $cc_score
    checks: $cc_checks
    failures: $cc_fails
  knowledge_coverage:
    score: $kc_score
    checks: $kc_checks
    failures: $kc_fails
  agent_readiness:
    score: $ar_score
    checks: $ar_checks
    failures: $ar_fails
REPORT
    echo "   Report: $pack_report_dir/$DATE.yml"
    echo ""
  fi
done

echo "=== Summary ==="
echo "Packs scored: $overall_total"
echo "Packs healthy (>=70): $overall_pass"
[ "$overall_pass" -eq "$overall_total" ] && echo "ALL PACKS HEALTHY" || echo "ATTENTION NEEDED"
