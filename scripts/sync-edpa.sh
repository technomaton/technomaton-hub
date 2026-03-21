#!/usr/bin/env bash
# Sync EDPA standalone repo content into hub's packs/tm-governance/
# Usage: scripts/sync-edpa.sh [path-to-edpa-repo]

set -euo pipefail

EDPA_REPO="${1:-../edpa}"
HUB_GOV="packs/tm-governance"

if [ ! -d "$EDPA_REPO" ]; then
  echo "ERROR: EDPA repo not found at $EDPA_REPO"
  echo "Usage: $0 [path-to-edpa-repo]"
  exit 1
fi

echo "Syncing from $EDPA_REPO to $HUB_GOV..."

# Sync skills
for skill in edpa-setup edpa-engine edpa-reports edpa-autocalib; do
  cp "$EDPA_REPO/claude-code/skills/$skill/SKILL.md" "$HUB_GOV/skills/$skill/SKILL.md"
done

# Sync commands
for cmd in setup close-iteration reports calibrate; do
  cp "$EDPA_REPO/claude-code/commands/edpa/$cmd.md" "$HUB_GOV/commands/edpa/$cmd.md"
done

# Sync references (docs -> references)
for doc in evidence-detection dual-view audit-trail auto-calibration cadence; do
  src="$EDPA_REPO/docs/$doc.md"
  # Map doc names to reference names
  case "$doc" in
    audit-trail) dest="$HUB_GOV/references/audit.md" ;;
    auto-calibration) dest="$HUB_GOV/references/auto-calibration.md" ;;
    *) dest="$HUB_GOV/references/$doc.md" ;;
  esac
  if [ -f "$src" ]; then
    cp "$src" "$dest"
  fi
done

# Sync methodology (EN version)
cp "$EDPA_REPO/docs/methodology.md" "$HUB_GOV/references/methodology-en.md"

# Sync config templates
cp "$EDPA_REPO/config/capacity.yaml.tmpl" "$HUB_GOV/config/capacity.yaml.tmpl"
cp "$EDPA_REPO/config/cw_heuristics.yaml.tmpl" "$HUB_GOV/config/cw_heuristics.yaml.tmpl"
cp "$EDPA_REPO/config/project.yaml.tmpl" "$HUB_GOV/config/project.yaml.tmpl"

# Sync scripts
cp "$EDPA_REPO/scripts/evaluate_cw.py" "$HUB_GOV/scripts/evaluate_cw.py"

echo "Sync complete. Review changes with: git diff packs/tm-governance/"
