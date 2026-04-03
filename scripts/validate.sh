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

# 7. Check plugin.json capability paths are valid
echo "7. Checking plugin.json capability paths..."
CAP_ERRORS=0
for pack in packs/tm-*/; do
  name=$(basename "$pack")
  pj="$pack/.claude-plugin/plugin.json"
  [ ! -f "$pj" ] && continue

  # Check skills path (directory string or array of directories)
  skills_val=$(grep '"skills"' "$pj" | head -1 | sed 's/.*"skills"[[:space:]]*:[[:space:]]*//' | tr -d '", ' || true)
  if [ -n "$skills_val" ] && [ "$skills_val" != "[]" ]; then
    skills_dir="$pack/$skills_val"
    if [ -d "$skills_dir" ]; then
      skill_count=$(find "$skills_dir" -name SKILL.md | wc -l | tr -d ' ')
      echo "   OK: $name skills ($skill_count SKILL.md in $skills_val)"
    elif [ "$skills_val" = "./skills/" ] && [ ! -d "$pack/skills" ]; then
      echo "   WARN: $name declares skills path but no skills/ directory"
      WARNINGS=$((WARNINGS + 1))
    fi
  fi

  # Check agents (array of file paths)
  agent_files=$(grep '"./agents/' "$pj" | sed 's/.*"\(\.\/agents\/[^"]*\)".*/\1/' || true)
  for af in $agent_files; do
    if [ ! -f "$pack/$af" ]; then
      echo "   FAIL: $name references $af but file not found"
      CAP_ERRORS=$((CAP_ERRORS + 1))
    fi
  done
done
[ "$CAP_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + CAP_ERRORS)) || echo "   OK"

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

# 12. Validate plugin.json with Claude Code validator
echo "12. Checking plugin.json with claude plugin validate..."
PV_ERRORS=0
if command -v claude &>/dev/null; then
  for pack in packs/tm-*/; do
    name=$(basename "$pack")
    pj="$pack/.claude-plugin/plugin.json"
    [ ! -f "$pj" ] && continue
    if claude plugin validate "$pj" &>/dev/null; then
      echo "   OK: $name"
    else
      echo "   FAIL: $name — run 'claude plugin validate $pj' for details"
      PV_ERRORS=$((PV_ERRORS + 1))
    fi
  done
  [ "$PV_ERRORS" -gt 0 ] && ERRORS=$((ERRORS + PV_ERRORS))
else
  echo "   SKIP: claude CLI not available"
fi

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

# 14. Validate marketplace.json with Claude Code validator
echo "14. Checking marketplace.json with claude plugin validate..."
if command -v claude &>/dev/null; then
  if claude plugin validate .claude-plugin/marketplace.json &>/dev/null; then
    echo "   OK"
  else
    echo "   FAIL: marketplace.json validation failed — run 'claude plugin validate .claude-plugin/marketplace.json' for details"
    ERRORS=$((ERRORS + 1))
  fi
else
  echo "   SKIP: claude CLI not available"
fi

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
