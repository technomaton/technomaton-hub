#!/usr/bin/env bash
# Sync EDPA standalone repo content into hub's packs/tm-governance/
# Usage: scripts/sync-edpa.sh [path-to-edpa-repo]
#
# EDPA repo structure (1.0.0-beta):
#   plugin/skills/           -> skills
#   plugin/commands/edpa/    -> commands
#   plugin/edpa/scripts/     -> scripts
#   plugin/edpa/templates/   -> config templates
#   docs/                    -> references

set -euo pipefail

EDPA_REPO="${1:-../edpa}"
HUB_GOV="packs/tm-governance"

if [ ! -d "$EDPA_REPO/plugin" ]; then
  echo "ERROR: EDPA repo not found at $EDPA_REPO (missing plugin/ directory)"
  echo "Usage: $0 [path-to-edpa-repo]"
  exit 1
fi

echo "Syncing from $EDPA_REPO to $HUB_GOV..."

# Sync skills (5 skills)
for skill in edpa-setup edpa-engine edpa-reports edpa-autocalib edpa-sync; do
  src="$EDPA_REPO/plugin/skills/$skill/SKILL.md"
  dest="$HUB_GOV/skills/$skill/SKILL.md"
  if [ -f "$src" ]; then
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "  skill: $skill"
  else
    echo "  SKIP: $src not found"
  fi
done

# Sync commands (5 commands)
for cmd in setup close-iteration reports calibrate sync; do
  src="$EDPA_REPO/plugin/commands/edpa/$cmd.md"
  dest="$HUB_GOV/commands/edpa/$cmd.md"
  if [ -f "$src" ]; then
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "  command: $cmd"
  else
    echo "  SKIP: $src not found"
  fi
done

# Sync references (docs -> references)
sync_ref() {
  local doc="$1" ref="$2"
  local src="$EDPA_REPO/docs/$doc.md"
  local dest="$HUB_GOV/references/$ref.md"
  if [ -f "$src" ]; then
    cp "$src" "$dest"
    echo "  reference: $doc -> $ref"
  fi
}
sync_ref "evidence-detection" "evidence-detection"
sync_ref "dual-view" "dual-view"
sync_ref "audit-trail" "audit"
sync_ref "auto-calibration" "auto-calibration"
sync_ref "cadence" "cadence"
sync_ref "github-setup" "setup-guide"

# Sync methodology (EN version)
if [ -f "$EDPA_REPO/docs/methodology.md" ]; then
  cp "$EDPA_REPO/docs/methodology.md" "$HUB_GOV/references/methodology-en.md"
  echo "  reference: methodology (EN)"
fi

# Sync config templates
for tmpl in people.yaml.tmpl cw_heuristics.yaml.tmpl project.yaml.tmpl; do
  src="$EDPA_REPO/plugin/edpa/templates/$tmpl"
  # Map new template names to hub config names
  case "$tmpl" in
    people.yaml.tmpl) dest="$HUB_GOV/config/capacity.yaml.tmpl" ;;
    cw_heuristics.yaml.tmpl) dest="$HUB_GOV/config/cw_heuristics.yaml.tmpl" ;;
    *) dest="$HUB_GOV/config/$tmpl" ;;
  esac
  if [ -f "$src" ]; then
    cp "$src" "$dest"
    echo "  template: $tmpl"
  fi
done

# Sync key scripts
for script in evaluate_cw.py; do
  src="$EDPA_REPO/plugin/edpa/scripts/$script"
  if [ -f "$src" ]; then
    cp "$src" "$HUB_GOV/scripts/$script"
    echo "  script: $script"
  fi
done

echo ""
echo "Sync complete. Review changes with: git diff $HUB_GOV/"
