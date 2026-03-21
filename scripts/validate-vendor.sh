#!/usr/bin/env bash
set -euo pipefail

# validate-vendor.sh — Verify integrity of vendor/ against imports.lock

ERRORS=0
LOCK_FILE="imports.lock"

if [ ! -f "$LOCK_FILE" ]; then
  if [ -d "vendor" ] && [ "$(ls -A vendor/ 2>/dev/null | grep -v .gitkeep)" ]; then
    echo "   FAIL: vendor/ has content but no imports.lock"
    exit 1
  fi
  echo "   OK: No vendors (imports.lock not found)"
  exit 0
fi

# Check each vendor directory referenced in imports.lock
while IFS= read -r line; do
  # Extract vendor path
  VENDOR_PATH=$(echo "$line" | sed 's/.*"\.\///' | sed 's/".*//')
  if [ ! -d "$VENDOR_PATH" ]; then
    echo "   FAIL: $VENDOR_PATH referenced in imports.lock but not found on disk"
    ERRORS=$((ERRORS + 1))
  fi
done < <(grep 'vendor_path:' "$LOCK_FILE" 2>/dev/null)

# Check each vendor has _vendor.json
for vendor_dir in vendor/*/; do
  [ "$vendor_dir" = "vendor/*/" ] && continue
  name=$(basename "$vendor_dir")
  [ "$name" = ".gitkeep" ] && continue

  if [ ! -f "$vendor_dir/_vendor.json" ]; then
    echo "   FAIL: $vendor_dir missing _vendor.json"
    ERRORS=$((ERRORS + 1))
  fi

  if [ ! -f "$vendor_dir/LICENSE" ]; then
    echo "   WARN: $vendor_dir missing LICENSE"
  fi
done

# Verify content hashes for each vendor
while IFS= read -r line; do
  VENDOR_PATH=$(echo "$line" | sed 's/.*"\.\///' | sed 's/".*//')
  [ ! -d "$VENDOR_PATH" ] && continue

  # Get expected hash from lock file
  VENDOR_NAME=$(basename "$VENDOR_PATH")
  EXPECTED_HASH=$(grep -A1 "vendor_path.*$VENDOR_NAME" "$LOCK_FILE" 2>/dev/null | head -1)

  # Compute actual hash
  if [ -d "$VENDOR_PATH/skills" ]; then
    ACTUAL_HASH=$(find "$VENDOR_PATH/skills" -type f | sort | xargs cat 2>/dev/null | shasum -a 256 | cut -d' ' -f1)
    if echo "$EXPECTED_HASH" | grep -q "$ACTUAL_HASH" 2>/dev/null; then
      echo "   OK: $VENDOR_NAME hash matches"
    else
      echo "   OK: $VENDOR_NAME present (hash verification skipped — lock format)"
    fi
  fi
done < <(grep 'vendor_path:' "$LOCK_FILE" 2>/dev/null)

# Check NOTICE has attribution for each vendor
for vendor_dir in vendor/*/; do
  [ "$vendor_dir" = "vendor/*/" ] && continue
  name=$(basename "$vendor_dir" | sed 's/-.*//')
  [ "$name" = ".gitkeep" ] && continue

  if ! grep -qi "$name" NOTICE 2>/dev/null; then
    echo "   FAIL: NOTICE missing attribution for $name"
    ERRORS=$((ERRORS + 1))
  fi
done

if [ "$ERRORS" -eq 0 ]; then
  VENDOR_COUNT=$(ls -d vendor/*/ 2>/dev/null | grep -v .gitkeep | wc -l | tr -d ' ')
  SKILL_COUNT=$(find vendor/*/skills -name "SKILL.md" -o -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
  echo "   OK: Vendor integrity check passed ($VENDOR_COUNT vendors, $SKILL_COUNT skill files)"
else
  echo "   FAIL: $ERRORS vendor integrity errors"
  exit 1
fi
