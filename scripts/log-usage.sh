#!/usr/bin/env bash
# Usage Logger — appends JSONL to local usage log
# Called by PostToolUse hooks in pack hooks.json
#
# Usage: log-usage.sh <event_type>
# Output: ~/.technomaton/usage/events.jsonl (local only, never committed)

EVENT_TYPE="${1:-unknown}"

# Determine pack name from script location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [[ "$SCRIPT_DIR" == */packs/tm-* ]]; then
  PACK_NAME=$(echo "$SCRIPT_DIR" | grep -oE 'tm-[a-z]+' | head -1)
else
  PACK_NAME="hub"
fi

TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
LOG_DIR="${HOME}/.technomaton/usage"
LOG_FILE="$LOG_DIR/events.jsonl"

mkdir -p "$LOG_DIR"
echo "{\"ts\":\"$TIMESTAMP\",\"pack\":\"$PACK_NAME\",\"event\":\"$EVENT_TYPE\"}" >> "$LOG_FILE"
