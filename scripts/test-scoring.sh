#!/usr/bin/env bash
set -euo pipefail

# Test: Scoring System Consistency
# Verifies that scoring scales in commands and agents match their
# canonical definitions in knowledge files.

ERRORS=0
WARNINGS=0

echo "--- Scoring System Consistency ---"

check_scale() {
  local rule_id="$1"
  local canonical_scale="$2"
  local canonical_total="$3"
  local source="$4"
  shift 4
  local consumers=("$@")

  if [ ! -f "$source" ]; then
    echo "   FAIL: [$rule_id] source $source not found"
    ERRORS=$((ERRORS + 1))
    return
  fi

  for consumer in "${consumers[@]}"; do
    [ -z "$consumer" ] && continue
    if [ ! -f "$consumer" ]; then
      echo "   FAIL: [$rule_id] consumer $consumer not found"
      ERRORS=$((ERRORS + 1))
      continue
    fi

    # Check for conflicting scale patterns
    if [ "$canonical_scale" = "0-5" ]; then
      if grep -qE '(each |score[d]? )1-10' "$consumer" 2>/dev/null; then
        line=$(grep -nE '(each |score[d]? )1-10' "$consumer" | head -1 | cut -d: -f1)
        echo "   FAIL: [$rule_id] $consumer:$line uses 1-10 scale, canonical is 0-5 (source: $source)"
        ERRORS=$((ERRORS + 1))
      fi
    elif [ "$canonical_scale" = "1-10" ]; then
      if grep -qE 'Score \(0-5\)' "$consumer" 2>/dev/null; then
        line=$(grep -nE 'Score \(0-5\)' "$consumer" | head -1 | cut -d: -f1)
        echo "   FAIL: [$rule_id] $consumer:$line uses 0-5 scale, canonical is 1-10 (source: $source)"
        ERRORS=$((ERRORS + 1))
      fi
    fi
  done
}

# --- tm-pmf: Pain x Frequency x AI Advantage ---
check_scale "tm-pmf/pain-freq-ai" "1-10" "X/30" \
  "packs/tm-pmf/skills/pmf-assessment/AI_PMF_CORE.md" \
  "packs/tm-pmf/commands/pmf/score.md" \
  "packs/tm-pmf/agents/pmf-opportunity.md"

# --- tm-pmf: Moat scoring ---
check_scale "tm-pmf/moat" "0-5" "X/25" \
  "packs/tm-pmf/skills/pmf-assessment/AI_PMF_MOATS.md" \
  "packs/tm-pmf/commands/pmf/moat.md" \
  "packs/tm-pmf/agents/pmf-moat.md"

# --- tm-vuca: Dimension scoring ---
check_scale "tm-vuca/dimensions" "0-5" "X/20" \
  "packs/tm-vuca/skills/vuca-assessment/VUCA_FRAMEWORK_EN.md" \
  "packs/tm-vuca/agents/vuca-conductor.md"

# --- tm-wardley: Doctrine scoring ---
check_scale "tm-wardley/doctrine" "0-4" "X/160" \
  "packs/tm-wardley/skills/wardley-assessment/WARDLEY_DOCTRINE.md" \
  "packs/tm-wardley/commands/wardley/doctrine.md" \
  "packs/tm-wardley/agents/wardley-doctrine.md"

# --- Special check: score.md zone boundaries vs AI_PMF_CORE.md ---
SCORE_CMD="packs/tm-pmf/commands/pmf/score.md"
CORE_FILE="packs/tm-pmf/skills/pmf-assessment/AI_PMF_CORE.md"
if [ -f "$SCORE_CMD" ] && [ -f "$CORE_FILE" ]; then
  # score.md uses zone boundaries >= 500, 200-499 etc (multiplicative)
  # but AI_PMF_CORE.md defines additive 3-30 scale
  if grep -qE '[≥>]=?\s*[0-9]{3}' "$SCORE_CMD" 2>/dev/null; then
    if grep -q "Total score range: 3-30" "$CORE_FILE" 2>/dev/null; then
      line=$(grep -nE '[≥>]=?\s*[0-9]{3}' "$SCORE_CMD" | head -1 | cut -d: -f1)
      echo "   FAIL: [tm-pmf/score-zones] $SCORE_CMD:$line uses 3-digit zone boundaries (multiplicative) but $CORE_FILE defines additive 3-30 scale"
      ERRORS=$((ERRORS + 1))
    fi
  fi
fi

# --- Special check: moat taxonomy naming ---
MOAT_CMD="packs/tm-pmf/commands/pmf/moat.md"
MOAT_AGENT="packs/tm-pmf/agents/pmf-moat.md"
if [ -f "$MOAT_CMD" ] && [ -f "$MOAT_AGENT" ]; then
  cmd_taxonomy=$(grep -oE '(Three|Five|Four)-Moat Taxonomy' "$MOAT_CMD" 2>/dev/null | head -1 || true)
  agent_taxonomy=$(grep -oE '(Three|Five|Four)-Moat Taxonomy' "$MOAT_AGENT" 2>/dev/null | head -1 || true)
  if [ -n "$cmd_taxonomy" ] && [ -n "$agent_taxonomy" ] && [ "$cmd_taxonomy" != "$agent_taxonomy" ]; then
    line=$(grep -nE '(Three|Five|Four)-Moat Taxonomy' "$MOAT_CMD" | head -1 | cut -d: -f1)
    echo "   FAIL: [tm-pmf/moat-taxonomy] $MOAT_CMD:$line says '$cmd_taxonomy' but $MOAT_AGENT says '$agent_taxonomy'"
    ERRORS=$((ERRORS + 1))
  fi
fi

if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
  echo "   OK: All scoring systems consistent"
fi

echo "   Scoring — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
