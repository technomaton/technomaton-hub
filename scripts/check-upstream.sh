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
done < <(awk 'BEGIN{p=0} /^vendors:/{p=1; next} /^synced_packs:/{p=0} p' "$LOCK_FILE")

# ------------------------------------------------------------
# Synced packs (release-tag tracked, e.g. tm-edpa).
# Different shape than vendors: we compare GitHub release tags via
# the gh CLI rather than git ls-remote HEAD commits, because these
# packs are pinned to releases, not arbitrary HEAD.
# ------------------------------------------------------------
if grep -q '^synced_packs:' "$LOCK_FILE"; then
  echo "=== Synced Pack Check ==="
  pack_name=""
  pack_version=""
  pack_source=""

  while IFS= read -r line; do
    if echo "$line" | grep -q '^  - name:'; then
      pack_name=$(echo "$line" | sed 's/.*name: //' | tr -d ' ')
      pack_version=""
      pack_source=""
    elif echo "$line" | grep -q '^    version:'; then
      pack_version=$(echo "$line" | sed 's/.*version: "//' | sed 's/".*//')
    elif echo "$line" | grep -q '^    source:'; then
      pack_source=$(echo "$line" | sed 's/.*source: "//' | sed 's/".*//')

      if [ -n "$CHECK_NAME" ] && [ "$pack_name" != "$CHECK_NAME" ]; then
        continue
      fi

      echo "Checking $pack_name (synced: $pack_version)..."

      # Extract owner/repo from GitHub URL
      repo=$(echo "$pack_source" | sed -E 's|https://github.com/([^/]+/[^/]+).*|\1|')
      if ! command -v gh >/dev/null 2>&1; then
        echo "  WARN: gh CLI not available — cannot check release tags"
        continue
      fi

      latest=$(gh release list --repo "$repo" --limit 1 \
        --json tagName --jq '.[0].tagName' 2>/dev/null || echo "")
      if [ -z "$latest" ]; then
        echo "  WARN: could not query releases for $repo"
        continue
      fi

      if [ "$latest" = "$pack_version" ]; then
        echo "  Up to date ($pack_version)"
      else
        echo "  UPDATE AVAILABLE"
        echo "  Synced: $pack_version"
        echo "  Latest: $latest"
        case "$pack_name" in
          tm-edpa) echo "  → Run: bash scripts/sync-edpa.sh --tag $latest" ;;
          *)       echo "  → No sync command registered for $pack_name" ;;
        esac
        UPDATES_FOUND=$((UPDATES_FOUND + 1))
      fi
      echo ""
    fi
  done < <(awk 'BEGIN{p=0} /^synced_packs:/{p=1; next} p' "$LOCK_FILE")
fi

echo "=== Summary ==="
if [ "$UPDATES_FOUND" -eq 0 ]; then
  echo "All vendors and synced packs are up to date."
else
  echo "$UPDATES_FOUND item(s) have updates or warnings."
  echo "Run 'make update-vendor name=<name> version=<version>' for vendors,"
  echo "or the listed sync command for synced packs."
  exit 1
fi
