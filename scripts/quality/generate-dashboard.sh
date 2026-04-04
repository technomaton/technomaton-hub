#!/usr/bin/env bash
set -euo pipefail

# Generate Quality Dashboard
# Produces reports/QUALITY_DASHBOARD.md from latest quality reports.

REPORT_DIR="reports/quality"
DASHBOARD="reports/QUALITY_DASHBOARD.md"
DATE=$(date -u +%Y-%m-%d)

# Generate fresh scores
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
bash scripts/quality-score.sh --output "$TMPDIR" > /dev/null 2>&1

cat > "$DASHBOARD" <<'HEADER'
# Quality Dashboard

> Auto-generated — do not edit manually.
> Run `make quality-dashboard` to regenerate.

HEADER

echo "**Generated:** $DATE" >> "$DASHBOARD"
echo "" >> "$DASHBOARD"

# Pack Health Summary
echo "## Pack Health Summary" >> "$DASHBOARD"
echo "" >> "$DASHBOARD"
echo "| Pack | Score | Grade | Structural | Content | Coverage | Readiness |" >> "$DASHBOARD"
echo "|------|-------|-------|-----------|---------|----------|-----------|" >> "$DASHBOARD"

for report in "$TMPDIR"/tm-*/*.yml; do
  [ -f "$report" ] || continue
  pack=$(grep '^pack:' "$report" | sed 's/pack: //')
  score=$(grep '^score:' "$report" | sed 's/score: //')
  grade=$(grep '^grade:' "$report" | sed 's/grade: //')
  struct=$(grep '  score:' "$report" | head -1 | sed 's/.*score: //')
  cc=$(grep '  score:' "$report" | sed -n '2p' | sed 's/.*score: //')
  kc=$(grep '  score:' "$report" | sed -n '3p' | sed 's/.*score: //')
  ar=$(grep '  score:' "$report" | sed -n '4p' | sed 's/.*score: //')

  echo "| $pack | **$score** | $grade | $struct | $cc | $kc | $ar |" >> "$DASHBOARD"
done

echo "" >> "$DASHBOARD"

# Scoring Methodology
cat >> "$DASHBOARD" <<'METHODOLOGY'
## Scoring Methodology

| Dimension | Weight | What it measures |
|-----------|--------|-----------------|
| Structural | 20% | File existence, frontmatter completeness, manifest validity |
| Content Consistency | 35% | Agent reference validity, scoring scale alignment, taxonomy naming |
| Knowledge Coverage | 25% | Bibliography mapping, agent knowledge file references |
| Agent Readiness | 20% | Tools declared, output format specified, usage guidance present |

**Grades:** healthy (90+), attention (70-89), warning (50-69), critical (<50)

## How to Improve

Run `make test` to see specific failures, then fix the reported issues.
Run `make quality` to recalculate scores after fixes.
METHODOLOGY

echo "Dashboard written to $DASHBOARD"
