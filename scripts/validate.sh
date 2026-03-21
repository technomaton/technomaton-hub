#!/usr/bin/env bash
set -euo pipefail

ERRORS=0
WARNINGS=0

echo "=== Technomaton Hub Validation Suite ==="
echo ""

# 1. Check marketplace.json exists
echo "1. Checking marketplace.json..."
if [ ! -f .claude-plugin/marketplace.json ]; then
  echo "   FAIL: .claude-plugin/marketplace.json not found"
  ERRORS=$((ERRORS + 1))
else
  echo "   OK"
fi

# 2. Check pack manifests
echo "2. Checking pack manifests..."
for pack in packs/technomaton-*/; do
  name=$(basename "$pack")
  missing=""
  [ ! -f "$pack/.claude-plugin/plugin.json" ] && missing="$missing plugin.json"
  [ ! -f "$pack/.mcp.json" ] && missing="$missing .mcp.json"
  [ ! -f "$pack/hooks/hooks.json" ] && missing="$missing hooks.json"
  [ ! -f "$pack/README.md" ] && missing="$missing README.md"
  [ ! -f "$pack/CHANGELOG.md" ] && missing="$missing CHANGELOG.md"
  [ ! -f "$pack/LICENSE" ] && missing="$missing LICENSE"

  if [ -n "$missing" ]; then
    echo "   FAIL: $name missing:$missing"
    ERRORS=$((ERRORS + 1))
  else
    echo "   OK: $name"
  fi
done

# 3. Validate SKILL.md frontmatter
echo "3. Checking SKILL.md frontmatter..."
bash scripts/validate-skill.sh || ERRORS=$((ERRORS + 1))

# 4. Validate command frontmatter
echo "4. Checking command frontmatter..."
bash scripts/validate-command.sh || ERRORS=$((ERRORS + 1))

# 5. Validate agent frontmatter
echo "5. Checking agent frontmatter..."
bash scripts/validate-agent.sh || ERRORS=$((ERRORS + 1))

# 6. Validate license consistency
echo "6. Checking license consistency..."
bash scripts/validate-licenses.sh || ERRORS=$((ERRORS + 1))

# 7. Check plugin.json capability arrays match files on disk
echo "7. Checking plugin.json capability arrays match disk..."
for pack in packs/technomaton-*/; do
  name=$(basename "$pack")
  pj="$pack/.claude-plugin/plugin.json"
  [ ! -f "$pj" ] && continue

  # Count skills on disk vs in plugin.json
  disk_skills=0
  [ -d "$pack/skills" ] && disk_skills=$(find "$pack/skills" -name SKILL.md | wc -l | tr -d ' ')
  json_skills=$(grep -c '"skills/' "$pj" || true)
  if [ "$disk_skills" -ne "$json_skills" ]; then
    echo "   FAIL: $name has $disk_skills skills on disk but $json_skills in plugin.json"
    ERRORS=$((ERRORS + 1))
  fi

  # Count commands on disk vs in plugin.json
  disk_cmds=0
  [ -d "$pack/commands" ] && disk_cmds=$(find "$pack/commands" -name "*.md" | wc -l | tr -d ' ')
  json_cmds=$(grep -c '"commands/' "$pj" || true)
  if [ "$disk_cmds" -ne "$json_cmds" ]; then
    echo "   FAIL: $name has $disk_cmds commands on disk but $json_cmds in plugin.json"
    ERRORS=$((ERRORS + 1))
  fi

  # Count agents on disk vs in plugin.json
  disk_agents=0
  [ -d "$pack/agents" ] && disk_agents=$(find "$pack/agents" -name "*.md" | wc -l | tr -d ' ')
  json_agents=$(grep -c '"agents/' "$pj" || true)
  if [ "$disk_agents" -ne "$json_agents" ]; then
    echo "   FAIL: $name has $disk_agents agents on disk but $json_agents in plugin.json"
    ERRORS=$((ERRORS + 1))
  fi
done
echo "   OK"

# 8. Check marketplace count matches pack count
echo "8. Checking marketplace registry count..."
PACK_COUNT=$(ls -d packs/technomaton-*/ 2>/dev/null | wc -l | tr -d ' ')
REGISTRY_COUNT=$(grep -c '"source":' .claude-plugin/marketplace.json 2>/dev/null | head -1)
if [ "$PACK_COUNT" -ne "$REGISTRY_COUNT" ]; then
  echo "   FAIL: $PACK_COUNT packs on disk but $REGISTRY_COUNT entries in marketplace.json"
  ERRORS=$((ERRORS + 1))
else
  echo "   OK: $PACK_COUNT packs match registry"
fi

# 9. Test export pipeline
echo "9. Testing export pipeline..."
if [ -f scripts/export-agentskills.sh ]; then
  bash scripts/export-agentskills.sh --dry-run 2>/dev/null && echo "   OK" || echo "   WARN: export dry-run had issues"
else
  echo "   WARN: export script not found"
  WARNINGS=$((WARNINGS + 1))
fi

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"
[ "$ERRORS" -eq 0 ] && echo "PASS" || { echo "FAIL"; exit 1; }
