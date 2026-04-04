#!/usr/bin/env bash
set -euo pipefail

# Usage Report Generator
# Reads ~/.technomaton/usage/events.jsonl and produces a summary.

LOG_FILE="${HOME}/.technomaton/usage/events.jsonl"

echo "=== Usage Report ==="
echo ""

if [ ! -f "$LOG_FILE" ]; then
  echo "No usage data found at $LOG_FILE"
  echo "Usage tracking is enabled via pack hooks (PostToolUse on Agent tool)."
  exit 0
fi

TOTAL=$(wc -l < "$LOG_FILE" | tr -d ' ')
echo "Total events: $TOTAL"
echo ""

if [ "$TOTAL" -eq 0 ]; then
  echo "No events recorded yet."
  exit 0
fi

# Events by pack
echo "--- By Pack ---"
grep -oE '"pack":"[^"]*"' "$LOG_FILE" | sort | uniq -c | sort -rn | while read -r count pack; do
  pack_name=$(echo "$pack" | sed 's/"pack":"//;s/"//')
  echo "   $pack_name: $count"
done

echo ""

# Events by type
echo "--- By Event Type ---"
grep -oE '"event":"[^"]*"' "$LOG_FILE" | sort | uniq -c | sort -rn | while read -r count event; do
  event_name=$(echo "$event" | sed 's/"event":"//;s/"//')
  echo "   $event_name: $count"
done

echo ""

# Last 7 days
echo "--- Last 7 Days ---"
WEEK_AGO=$(date -u -v-7d +%Y-%m-%d 2>/dev/null || date -u -d '7 days ago' +%Y-%m-%d 2>/dev/null || echo "")
if [ -n "$WEEK_AGO" ]; then
  week_count=$(grep -c "\"ts\":\"${WEEK_AGO}" "$LOG_FILE" 2>/dev/null || echo 0)
  # Rough count: events from dates >= WEEK_AGO
  recent=$(awk -v cutoff="$WEEK_AGO" '
    match($0, /"ts":"([^"]+)"/, arr) {
      if (substr(arr[1],1,10) >= cutoff) count++
    }
    END { print count+0 }
  ' "$LOG_FILE")
  echo "   Events in last 7 days: $recent"
else
  echo "   (date calculation not supported on this platform)"
fi

echo ""
echo "Log file: $LOG_FILE"
