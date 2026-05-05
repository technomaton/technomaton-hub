#!/usr/bin/env bash
# update-edpa-lock.sh — bump tm-edpa entry in imports.lock after sync.
# Usage: update-edpa-lock.sh <tag> <commit-sha>
#
# Called by scripts/sync-edpa.sh. Updates version/commit/synced_at
# in-place. Refuses to write if tm-edpa entry is missing — bootstrap
# requires manual edit.

set -euo pipefail

TAG="${1:-}"
COMMIT="${2:-}"
LOCK_FILE="imports.lock"

if [ -z "$TAG" ] || [ -z "$COMMIT" ]; then
  echo "Usage: $0 <tag> <commit-sha>" >&2
  exit 1
fi

if [ ! -f "$LOCK_FILE" ]; then
  echo "ERROR: $LOCK_FILE not found" >&2
  exit 1
fi

if ! grep -q '^  - name: tm-edpa' "$LOCK_FILE"; then
  echo "ERROR: tm-edpa entry not found in $LOCK_FILE — bootstrap manually" >&2
  exit 1
fi

NOW=$(date -u +%Y-%m-%dT%H:%M:%SZ)
TMP=$(mktemp)

# Edit the tm-edpa block. We only touch lines under the tm-edpa
# entry, identified by their indentation + key prefix and the fact
# that synced_packs has a single entry today. If a second entry is
# ever added, this script must be generalised.
awk -v tag="$TAG" -v commit="$COMMIT" -v now="$NOW" '
  BEGIN { in_edpa = 0 }
  /^  - name: tm-edpa$/ { in_edpa = 1; print; next }
  /^  - name: / && in_edpa { in_edpa = 0 }
  in_edpa && /^    version:/    { printf "    version: \"%s\"\n", tag; next }
  in_edpa && /^    commit:/     { printf "    commit: \"%s\"\n", commit; next }
  in_edpa && /^    synced_at:/  { printf "    synced_at: \"%s\"\n", now; next }
  /^last_updated:/ { printf "last_updated: \"%s\"\n", now; next }
  { print }
' "$LOCK_FILE" > "$TMP"

mv "$TMP" "$LOCK_FILE"
echo "imports.lock: tm-edpa -> $TAG (${COMMIT:0:12})"
