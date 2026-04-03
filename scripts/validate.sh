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
for pack in packs/tm-*/; do
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
for pack in packs/tm-*/; do
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
PACK_COUNT=$(ls -d packs/tm-*/ 2>/dev/null | wc -l | tr -d ' ')
REGISTRY_COUNT=$(grep -c '"source":' .claude-plugin/marketplace.json 2>/dev/null | head -1)
if [ "$PACK_COUNT" -ne "$REGISTRY_COUNT" ]; then
  echo "   FAIL: $PACK_COUNT packs on disk but $REGISTRY_COUNT entries in marketplace.json"
  ERRORS=$((ERRORS + 1))
else
  echo "   OK: $PACK_COUNT packs match registry"
fi

# 9. Validate vendor integrity
echo "9. Checking vendor integrity..."
bash scripts/validate-vendor.sh || ERRORS=$((ERRORS + 1))

# 10. Validate vendor dependencies declared in plugin.json
echo "10. Checking vendor dependencies..."
DEP_ERRORS=0
for pack in packs/tm-*/; do
  name=$(basename "$pack")
  pj="$pack/.claude-plugin/plugin.json"
  [ ! -f "$pj" ] && continue

  # Extract dependency sources (simple grep — no jq dependency)
  dep_sources=$(grep '"source"' "$pj" | sed 's/.*"source"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || true)
  for src in $dep_sources; do
    # Skip non-vendor sources (e.g. relative pack paths)
    case "$src" in vendor/*) ;; *) continue ;; esac
    if [ ! -d "$src" ]; then
      echo "   FAIL: $name declares dependency on $src but directory not found"
      DEP_ERRORS=$((DEP_ERRORS + 1))
    else
      echo "   OK: $name -> $src"
    fi
  done
done
[ "$DEP_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + DEP_ERRORS))
[ "$DEP_ERRORS" -eq 0 ] && echo "   OK"

# 11. Test export pipeline
echo "11. Testing export pipeline..."
if [ -f scripts/export-agentskills.sh ]; then
  bash scripts/export-agentskills.sh --dry-run 2>/dev/null && echo "   OK" || echo "   WARN: export dry-run had issues"
else
  echo "   WARN: export script not found"
  WARNINGS=$((WARNINGS + 1))
fi

# 12. Check lifecycle status field
echo "12. Checking lifecycle status..."
VALID_STATUSES="stable beta deprecated experimental"
for pack in packs/tm-*/; do
  name=$(basename "$pack")
  pj="$pack/.claude-plugin/plugin.json"
  [ ! -f "$pj" ] && continue
  status=$(grep '"status"' "$pj" | sed 's/.*"status"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || true)
  if [ -z "$status" ]; then
    echo "   FAIL: $name missing status field in plugin.json"
    ERRORS=$((ERRORS + 1))
  elif ! echo "$VALID_STATUSES" | grep -qw "$status"; then
    echo "   FAIL: $name has invalid status '$status' (valid: $VALID_STATUSES)"
    ERRORS=$((ERRORS + 1))
  else
    echo "   OK: $name ($status)"
  fi
done

# 13. Validate composed-from references
echo "13. Checking composed-from references..."
COMPOSE_ERRORS=0
for skill_file in $(grep -rl "composed-from:" packs/*/skills/*/SKILL.md 2>/dev/null); do
  skill_name=$(basename "$(dirname "$skill_file")")
  pack_name=$(echo "$skill_file" | sed 's|packs/\([^/]*\)/.*|\1|')

  # Extract and check vendor references: "vendor: name/skill"
  for ref in $(grep "vendor:" "$skill_file" | sed 's/.*vendor:[[:space:]]*//'); do
    vendor_name=$(echo "$ref" | cut -d/ -f1)
    ref_skill=$(echo "$ref" | cut -d/ -f2)
    found=false
    for vdir in vendor/${vendor_name}-*/skills/${ref_skill}/SKILL.md; do
      [ -f "$vdir" ] && found=true && break
    done
    if [ "$found" = "false" ]; then
      echo "   FAIL: $pack_name/$skill_name references vendor:$ref but skill not found"
      COMPOSE_ERRORS=$((COMPOSE_ERRORS + 1))
    fi
  done

  # Extract and check pack references: "pack: name/skill"
  for ref in $(grep "pack:" "$skill_file" | sed 's/.*pack:[[:space:]]*//'); do
    ref_pack=$(echo "$ref" | cut -d/ -f1)
    ref_skill=$(echo "$ref" | cut -d/ -f2)
    if [ ! -f "packs/${ref_pack}/skills/${ref_skill}/SKILL.md" ]; then
      echo "   FAIL: $pack_name/$skill_name references pack:$ref but skill not found"
      COMPOSE_ERRORS=$((COMPOSE_ERRORS + 1))
    fi
  done
done
[ "$COMPOSE_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + COMPOSE_ERRORS))
[ "$COMPOSE_ERRORS" -eq 0 ] && echo "   OK"

# 14. Check marketplace capability counts match reality
echo "14. Checking marketplace capability counts..."
MKT=".claude-plugin/marketplace.json"
MKT_ERRORS=0
for pack in packs/tm-*/; do
  name=$(basename "$pack")
  [ ! -f "$pack/.claude-plugin/plugin.json" ] && continue

  # Count actual capabilities on disk
  actual_skills=0
  [ -d "$pack/skills" ] && actual_skills=$(find "$pack/skills" -name SKILL.md | wc -l | tr -d ' ')
  actual_cmds=0
  [ -d "$pack/commands" ] && actual_cmds=$(find "$pack/commands" -name "*.md" | wc -l | tr -d ' ')
  actual_agents=0
  [ -d "$pack/agents" ] && actual_agents=$(find "$pack/agents" -name "*.md" | wc -l | tr -d ' ')

  # Extract marketplace counts (simple grep — no jq)
  # Find the block for this pack and extract skills/commands counts
  mkt_block=$(sed -n "/\"name\": \"$name\"/,/}/p" "$MKT" 2>/dev/null)
  mkt_skills=$(echo "$mkt_block" | grep '"skills"' | head -1 | sed 's/.*"skills"[[:space:]]*:[[:space:]]*\([0-9]*\).*/\1/')
  mkt_cmds=$(echo "$mkt_block" | grep '"commands"' | head -1 | sed 's/.*"commands"[[:space:]]*:[[:space:]]*\([0-9]*\).*/\1/')

  [ -z "$mkt_skills" ] && continue  # pack not in marketplace

  if [ "$actual_skills" -ne "$mkt_skills" ]; then
    echo "   FAIL: $name marketplace says $mkt_skills skills but has $actual_skills"
    MKT_ERRORS=$((MKT_ERRORS + 1))
  fi
  if [ "$actual_cmds" -ne "$mkt_cmds" ]; then
    echo "   FAIL: $name marketplace says $mkt_cmds commands but has $actual_cmds"
    MKT_ERRORS=$((MKT_ERRORS + 1))
  fi
done
[ "$MKT_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + MKT_ERRORS)) || echo "   OK"

# 15. Check internal file references in README files
echo "15. Checking README internal links..."
LINK_ERRORS=0
for pack in packs/tm-*/; do
  name=$(basename "$pack")
  readme="$pack/README.md"
  [ ! -f "$readme" ] && continue

  # Extract relative file references like `references/foo.md`, `skills/bar/SKILL.md`
  while IFS= read -r ref; do
    target="$pack/$ref"
    if [ ! -e "$target" ]; then
      echo "   FAIL: $name/README.md references $ref but file not found"
      LINK_ERRORS=$((LINK_ERRORS + 1))
    fi
  done < <(grep -oE '`(references|skills|commands|config|scripts|agents)/[^`]+`' "$readme" 2>/dev/null | tr -d '`')
done
[ "$LINK_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + LINK_ERRORS)) || echo "   OK"

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"
[ "$ERRORS" -eq 0 ] && echo "PASS" || { echo "FAIL"; exit 1; }
