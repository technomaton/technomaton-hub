#!/usr/bin/env bash
set -euo pipefail

# Test: Cross-Pack Integration
# Validates that composed-from references resolve correctly
# and that cross-pack orchestration contracts are consistent.

ERRORS=0
WARNINGS=0

echo "--- Cross-Pack Integration ---"

# 1. Validate composed-from metadata resolves to actual skills
echo "   Checking composed-from references..."
for skill_file in $(grep -rl "composed-from:" packs/*/skills/*/SKILL.md 2>/dev/null); do
  skill_name=$(basename "$(dirname "$skill_file")")
  pack_name=$(echo "$skill_file" | sed 's|packs/\([^/]*\)/.*|\1|')

  # Extract pack references: "pack: tm-vuca/vuca-assessment"
  while IFS= read -r ref_line; do
    ref=$(echo "$ref_line" | sed 's/.*pack:[[:space:]]*//' | tr -d '"' | tr -d "'" | tr -d ' ')
    [ -z "$ref" ] && continue

    ref_pack=$(echo "$ref" | cut -d/ -f1)
    ref_skill=$(echo "$ref" | cut -d/ -f2)

    if [ ! -f "packs/${ref_pack}/skills/${ref_skill}/SKILL.md" ]; then
      line_num=$(grep -nF "$ref" "$skill_file" | head -1 | cut -d: -f1)
      echo "   FAIL: $skill_file:$line_num — composed-from pack:$ref but packs/${ref_pack}/skills/${ref_skill}/SKILL.md not found"
      ERRORS=$((ERRORS + 1))
    else
      echo "   OK: $pack_name/$skill_name → $ref"
    fi
  done < <(grep "pack:" "$skill_file" | grep -v "^---" | grep -v "pack_name")
done

# 2. Validate strategy conductor references conductors from composed packs
echo "   Checking cross-pack conductor dispatch..."
STRATEGY_CONDUCTOR="packs/tm-strategy/agents/strategy-conductor.md"
if [ -f "$STRATEGY_CONDUCTOR" ]; then
  # The strategy conductor should reference all three sub-conductors
  expected_conductors=("vuca-conductor" "pmf-conductor" "wardley-conductor")

  for expected in "${expected_conductors[@]}"; do
    if ! grep -q "@$expected" "$STRATEGY_CONDUCTOR" 2>/dev/null; then
      echo "   FAIL: $STRATEGY_CONDUCTOR — missing reference to @$expected"
      ERRORS=$((ERRORS + 1))
    else
      # Verify the referenced conductor exists in its pack
      found=false
      for pack in packs/tm-*/; do
        if [ -f "$pack/agents/${expected}.md" ]; then
          found=true
          break
        fi
      done
      if [ "$found" = "false" ]; then
        echo "   FAIL: $STRATEGY_CONDUCTOR references @$expected but agent file not found in any pack"
        ERRORS=$((ERRORS + 1))
      fi
    fi
  done
fi

# 3. Verify integration matrix dimension names match actual VUCA dimensions
STRATEGY_SKILL="packs/tm-strategy/skills/strategy-integrated/SKILL.md"
VUCA_FRAMEWORK="packs/tm-vuca/skills/vuca-assessment/VUCA_FRAMEWORK_EN.md"
if [ -f "$STRATEGY_SKILL" ] && [ -f "$VUCA_FRAMEWORK" ]; then
  echo "   Checking VUCA dimension name consistency in strategy pack..."
  vuca_dims=("Collaborative Capacity" "Perspective Coordination" "Contextual Thinking" "Decision-Making Process")

  for dim in "${vuca_dims[@]}"; do
    if ! grep -q "$dim" "$STRATEGY_SKILL" 2>/dev/null; then
      echo "   FAIL: $STRATEGY_SKILL — missing VUCA dimension '$dim'"
      ERRORS=$((ERRORS + 1))
    fi
  done
fi

if [ "$ERRORS" -eq 0 ]; then
  echo "   OK: Cross-pack integration verified"
fi

echo "   Cross-pack — Errors: $ERRORS  Warnings: $WARNINGS"
exit "$( [ "$ERRORS" -eq 0 ] && echo 0 || echo 1 )"
