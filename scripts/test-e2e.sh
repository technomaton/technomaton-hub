#!/usr/bin/env bash
set -euo pipefail

# Technomaton Hub — End-to-End Test Suite
# Validates functional correctness of packs beyond structural checks.
# Complements scripts/validate.sh (structural) with behavioral tests.

TOTAL_ERRORS=0
TOTAL_WARNINGS=0
TOTAL_PASS=0
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Technomaton Hub E2E Test Suite ==="
echo ""

run_test() {
  local name="$1"
  local script="$2"

  echo "[$name]"
  if bash "$script" 2>&1; then
    TOTAL_PASS=$((TOTAL_PASS + 1))
  else
    TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
  fi
  echo ""
}

# Phase 1: Agent Reference Validation
run_test "1. Agent References" "$SCRIPT_DIR/test-agent-refs.sh"

# Phase 2: Scoring System Consistency
run_test "2. Scoring Consistency" "$SCRIPT_DIR/test-scoring.sh"

# Phase 3: Orchestration Contract Validation
run_test "3. Orchestration Contracts" "$SCRIPT_DIR/test-orchestration.sh"

# Phase 4: Knowledge File Integrity
run_test "4. Knowledge Integrity" "$SCRIPT_DIR/test-knowledge.sh"

# Phase 5: Cross-Pack Integration
run_test "5. Cross-Pack Integration" "$SCRIPT_DIR/test-cross-pack.sh"

echo "=== E2E Results ==="
echo "Test suites passed: $TOTAL_PASS"
echo "Test suites failed: $TOTAL_ERRORS"
echo ""

if [ "$TOTAL_ERRORS" -eq 0 ]; then
  echo "PASS"
  exit 0
else
  echo "FAIL ($TOTAL_ERRORS suite(s) had errors)"
  exit 1
fi
