#!/usr/bin/env bash
set -euo pipefail

# Auto-create GitHub issues for quality findings
# Called by quality.yml workflow on weekly schedule.
# Requires GH_TOKEN or gh CLI to be authenticated.

echo "=== Quality Issue Creator ==="

# Check if gh is available
if ! command -v gh &>/dev/null; then
  echo "   SKIP: gh CLI not available"
  exit 0
fi

# Run E2E tests and capture failures
FAILURES=$(bash scripts/test-e2e.sh 2>&1 | grep "FAIL:" || true)

if [ -z "$FAILURES" ]; then
  echo "   No failures found — no issues to create"
  exit 0
fi

CREATED=0
SKIPPED=0

while IFS= read -r failure; do
  [ -z "$failure" ] && continue

  # Extract pack name from the failure line
  pack=""
  if echo "$failure" | grep -q "tm-pmf"; then
    pack="tm-pmf"
  elif echo "$failure" | grep -q "tm-vuca"; then
    pack="tm-vuca"
  elif echo "$failure" | grep -q "tm-wardley"; then
    pack="tm-wardley"
  elif echo "$failure" | grep -q "tm-strategy"; then
    pack="tm-strategy"
  fi

  # Clean up the failure message for the issue title
  detail=$(echo "$failure" | sed 's/^[[:space:]]*FAIL:[[:space:]]*//')
  title="quality($pack): $detail"

  # Truncate title to 100 chars
  title=$(echo "$title" | cut -c1-100)

  # Check if an open issue with this title already exists
  existing=$(gh issue list --state open --label quality --search "$title" --json number --jq 'length' 2>/dev/null || echo "0")

  if [ "$existing" -gt 0 ]; then
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  # Create the issue
  labels="quality"
  [ -n "$pack" ] && labels="quality,pack:$pack"

  gh issue create \
    --title "$title" \
    --label "$labels" \
    --body "Automated quality finding from weekly CI run.

**Failure:**
\`\`\`
$failure
\`\`\`

**How to reproduce:**
\`\`\`bash
make test
\`\`\`

**Fix:** Review the referenced file and line number. Ensure consistency with the canonical source." \
    2>/dev/null && CREATED=$((CREATED + 1)) || echo "   WARN: Failed to create issue for: $title"

done <<< "$FAILURES"

echo "   Issues created: $CREATED"
echo "   Issues skipped (already exist): $SKIPPED"
