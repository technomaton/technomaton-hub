#!/usr/bin/env bash
set -euo pipefail

# check-upstream.sh — Check for upstream changes in vendored skills
#
# Usage:
#   bash scripts/check-upstream.sh           # Check all vendors
#   bash scripts/check-upstream.sh --name X  # Check specific vendor

LOCK_FILE="imports.lock"
CHECK_NAME=""
UPDATES_FOUND=0

while [[ $# -gt 0 ]]; do
  case $1 in
    --name) CHECK_NAME="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

if [ ! -f "$LOCK_FILE" ]; then
  echo "No imports.lock found — nothing to check"
  exit 0
fi

echo "=== Upstream Change Check ==="
echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo ""

# Parse vendors from imports.lock
current_name=""
current_version=""
current_source=""
current_commit=""

while IFS= read -r line; do
  # Detect vendor entry start
  if echo "$line" | grep -q '^\s*- name:'; then
    current_name=$(echo "$line" | sed 's/.*name: //' | tr -d ' ')
  elif echo "$line" | grep -q '^\s*version:'; then
    current_version=$(echo "$line" | sed 's/.*version: "//' | sed 's/".*//')
  elif echo "$line" | grep -q '^\s*source:'; then
    current_source=$(echo "$line" | sed 's/.*source: "//' | sed 's/".*//')
  elif echo "$line" | grep -q '^\s*commit:'; then
    current_commit=$(echo "$line" | sed 's/.*commit: "//' | sed 's/".*//')

    # We have all fields — check this vendor
    if [ -n "$CHECK_NAME" ] && [ "$current_name" != "$CHECK_NAME" ]; then
      continue
    fi

    echo "Checking $current_name (vendored: $current_version)..."

    # Check if repo is accessible
    if ! git ls-remote --quiet "$current_source" HEAD >/dev/null 2>&1; then
      echo "  WARNING: $current_source is not accessible!"
      echo "  → Vendored copy in vendor/${current_name}-${current_version}/ is your safety net"
      UPDATES_FOUND=$((UPDATES_FOUND + 1))
      continue
    fi

    # Get latest commit on default branch
    REMOTE_HEAD=$(git ls-remote "$current_source" HEAD 2>/dev/null | head -1 | cut -f1)

    if [ "$REMOTE_HEAD" = "$current_commit" ]; then
      echo "  Up to date (${current_commit:0:12})"
    else
      echo "  UPDATE AVAILABLE"
      echo "  Vendored commit: ${current_commit:0:12}"
      echo "  Upstream HEAD:   ${REMOTE_HEAD:0:12}"
      echo "  → Run: make update-vendor name=$current_name"
      UPDATES_FOUND=$((UPDATES_FOUND + 1))
    fi

    # Check for newer tags
    LATEST_TAG=$(git ls-remote --tags --sort=-v:refname "$current_source" 2>/dev/null | head -1 | sed 's/.*refs\/tags\///' | sed 's/\^{}//')
    if [ -n "$LATEST_TAG" ] && [ "$LATEST_TAG" != "$current_version" ] && [ "$LATEST_TAG" != "v$current_version" ]; then
      echo "  Latest tag: $LATEST_TAG (vendored: $current_version)"
    fi

    echo ""
  fi
done < "$LOCK_FILE"

echo "=== Summary ==="
if [ "$UPDATES_FOUND" -eq 0 ]; then
  echo "All vendors are up to date."
else
  echo "$UPDATES_FOUND vendor(s) have updates or warnings."
  echo "Run 'make update-vendor name=<name> version=<version>' to update."
fi
