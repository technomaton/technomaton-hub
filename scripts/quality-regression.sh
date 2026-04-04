#!/usr/bin/env bash
set -euo pipefail

# Quality Regression Detection
# Compares current quality scores against baseline.
# Fails if any pack drops > 5 points.
# Updates baseline when scores improve (on main branch).

BASELINE_FILE="reports/quality/baseline.json"
THRESHOLD=5

echo "=== Quality Regression Check ==="

# Generate current scores by running quality-score.sh to a temp dir
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

bash scripts/quality-score.sh --output "$TMPDIR" > /dev/null 2>&1

# If no baseline exists, create it from current scores
if [ ! -f "$BASELINE_FILE" ]; then
  echo "   No baseline found — creating from current scores"
  echo "{" > "$BASELINE_FILE"
  first=true
  for report in "$TMPDIR"/tm-*/*.yml; do
    [ -f "$report" ] || continue
    pack=$(grep '^pack:' "$report" | sed 's/pack: //')
    score=$(grep '^score:' "$report" | sed 's/score: //')
    struct=$(grep '  score:' "$report" | head -1 | sed 's/.*score: //')
    cc=$(grep '  score:' "$report" | sed -n '2p' | sed 's/.*score: //')
    kc=$(grep '  score:' "$report" | sed -n '3p' | sed 's/.*score: //')
    ar=$(grep '  score:' "$report" | sed -n '4p' | sed 's/.*score: //')

    [ "$first" = "true" ] || echo "," >> "$BASELINE_FILE"
    first=false
    printf '  "%s": {"health": %s, "structural": %s, "content": %s, "coverage": %s, "readiness": %s}' \
      "$pack" "$score" "$struct" "$cc" "$kc" "$ar" >> "$BASELINE_FILE"
  done
  echo "" >> "$BASELINE_FILE"
  echo "}" >> "$BASELINE_FILE"
  echo "   Baseline created at $BASELINE_FILE"
  echo "PASS (baseline initialized)"
  exit 0
fi

# Compare current scores against baseline
REGRESSIONS=0
IMPROVEMENTS=0

for report in "$TMPDIR"/tm-*/*.yml; do
  [ -f "$report" ] || continue
  pack=$(grep '^pack:' "$report" | sed 's/pack: //')
  current_score=$(grep '^score:' "$report" | sed 's/score: //')

  # Extract baseline score for this pack
  baseline_score=$(grep "\"$pack\"" "$BASELINE_FILE" | grep -oE '"health": [0-9]+' | grep -oE '[0-9]+' || echo "")

  if [ -z "$baseline_score" ]; then
    echo "   $pack: NEW (score $current_score, no baseline)"
    continue
  fi

  delta=$((current_score - baseline_score))

  if [ "$delta" -lt "-$THRESHOLD" ]; then
    echo "   FAIL: $pack regressed $baseline_score -> $current_score (delta: $delta, threshold: -$THRESHOLD)"
    REGRESSIONS=$((REGRESSIONS + 1))
  elif [ "$delta" -gt 0 ]; then
    echo "   OK: $pack improved $baseline_score -> $current_score (+$delta)"
    IMPROVEMENTS=$((IMPROVEMENTS + 1))
  else
    echo "   OK: $pack stable at $current_score (baseline: $baseline_score)"
  fi
done

echo ""
if [ "$REGRESSIONS" -gt 0 ]; then
  echo "FAIL: $REGRESSIONS pack(s) regressed beyond threshold"
  exit 1
else
  echo "PASS (no regressions detected)"

  # Auto-ratchet: update baseline if on main branch and scores improved
  current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
  if [ "$current_branch" = "main" ] && [ "$IMPROVEMENTS" -gt 0 ]; then
    echo "   Updating baseline with improved scores..."
    echo "{" > "$BASELINE_FILE"
    first=true
    for report in "$TMPDIR"/tm-*/*.yml; do
      [ -f "$report" ] || continue
      pack=$(grep '^pack:' "$report" | sed 's/pack: //')
      score=$(grep '^score:' "$report" | sed 's/score: //')
      struct=$(grep '  score:' "$report" | head -1 | sed 's/.*score: //')
      cc=$(grep '  score:' "$report" | sed -n '2p' | sed 's/.*score: //')
      kc=$(grep '  score:' "$report" | sed -n '3p' | sed 's/.*score: //')
      ar=$(grep '  score:' "$report" | sed -n '4p' | sed 's/.*score: //')

      [ "$first" = "true" ] || echo "," >> "$BASELINE_FILE"
      first=false
      printf '  "%s": {"health": %s, "structural": %s, "content": %s, "coverage": %s, "readiness": %s}' \
        "$pack" "$score" "$struct" "$cc" "$kc" "$ar" >> "$BASELINE_FILE"
    done
    echo "" >> "$BASELINE_FILE"
    echo "}" >> "$BASELINE_FILE"
    echo "   Baseline updated"
  fi
  exit 0
fi
