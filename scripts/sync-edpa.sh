#!/usr/bin/env bash
# Sync EDPA standalone repo content into hub's packs/tm-edpa/
# Usage: scripts/sync-edpa.sh [--dry-run] [path-to-edpa-repo]
#
# --dry-run  Verify source paths exist without copying. Exit 1 if any missing.
#
# EDPA repo structure (1.0.0-beta):
#   plugin/skills/           -> skills
#   plugin/commands/edpa/    -> commands
#   plugin/edpa/scripts/     -> scripts
#   plugin/edpa/templates/   -> config templates
#   docs/                    -> references

set -euo pipefail

DRY_RUN=false
if [ "${1:-}" = "--dry-run" ]; then
  DRY_RUN=true
  shift
fi

EDPA_REPO="${1:-../edpa}"
HUB_GOV="packs/tm-edpa"

if [ ! -d "$EDPA_REPO/plugin" ]; then
  echo "ERROR: EDPA repo not found at $EDPA_REPO (missing plugin/ directory)"
  echo "Usage: $0 [--dry-run] [path-to-edpa-repo]"
  exit 1
fi

EDPA_COMMIT=$(git -C "$EDPA_REPO" rev-parse --short HEAD 2>/dev/null || echo "unknown")
DRY_MISS=0

if $DRY_RUN; then
  echo "DRY RUN: checking source paths in $EDPA_REPO (commit $EDPA_COMMIT)..."
else
  echo "Syncing from $EDPA_REPO (commit $EDPA_COMMIT) to $HUB_GOV..."
fi

# Helper: copy or verify a file
sync_file() {
  local src="$1" dest="$2" label="$3"
  if [ -f "$src" ]; then
    if $DRY_RUN; then
      echo "  OK: $label"
    else
      mkdir -p "$(dirname "$dest")"
      cp "$src" "$dest"
      echo "  $label"
    fi
  else
    if $DRY_RUN; then
      echo "  MISS: $src ($label)"
      DRY_MISS=$((DRY_MISS + 1))
    else
      echo "  SKIP: $src not found"
    fi
  fi
}

# Sync skills (5 skills)
for skill in edpa-setup edpa-engine edpa-reports edpa-autocalib edpa-sync; do
  sync_file "$EDPA_REPO/plugin/skills/$skill/SKILL.md" \
            "$HUB_GOV/skills/$skill/SKILL.md" \
            "skill: $skill"
done

# Sync commands (5 commands)
for cmd in setup close-iteration reports calibrate sync; do
  sync_file "$EDPA_REPO/plugin/commands/edpa/$cmd.md" \
            "$HUB_GOV/commands/edpa/$cmd.md" \
            "command: $cmd"
done

# Sync references (docs -> references)
sync_file "$EDPA_REPO/docs/evidence-detection.md"  "$HUB_GOV/references/evidence-detection.md" "ref: evidence-detection"
sync_file "$EDPA_REPO/docs/dual-view.md"            "$HUB_GOV/references/dual-view.md"          "ref: dual-view"
sync_file "$EDPA_REPO/docs/audit-trail.md"           "$HUB_GOV/references/audit.md"              "ref: audit-trail -> audit"
sync_file "$EDPA_REPO/docs/auto-calibration.md"      "$HUB_GOV/references/auto-calibration.md"   "ref: auto-calibration"
sync_file "$EDPA_REPO/docs/cadence.md"               "$HUB_GOV/references/cadence.md"            "ref: cadence"
sync_file "$EDPA_REPO/docs/github-setup.md"          "$HUB_GOV/references/setup-guide.md"        "ref: github-setup -> setup-guide"

# Sync methodology (EN = default, CZ = .cs.md)
sync_file "$EDPA_REPO/docs/methodology.md"    "$HUB_GOV/references/methodology.md"    "ref: methodology (EN)"
sync_file "$EDPA_REPO/docs/methodology.cs.md" "$HUB_GOV/references/methodology.cs.md" "ref: methodology (CZ)"

# Sync config templates
sync_file "$EDPA_REPO/plugin/edpa/templates/people.yaml.tmpl"         "$HUB_GOV/config/capacity.yaml.tmpl"      "template: people -> capacity"
sync_file "$EDPA_REPO/plugin/edpa/templates/cw_heuristics.yaml.tmpl"  "$HUB_GOV/config/cw_heuristics.yaml.tmpl"  "template: cw_heuristics"
sync_file "$EDPA_REPO/plugin/edpa/templates/project.yaml.tmpl"        "$HUB_GOV/config/project.yaml.tmpl"        "template: project"

# Sync key scripts
sync_file "$EDPA_REPO/plugin/edpa/scripts/evaluate_cw.py" "$HUB_GOV/scripts/evaluate_cw.py" "script: evaluate_cw.py"

echo ""
if $DRY_RUN; then
  if [ "$DRY_MISS" -gt 0 ]; then
    echo "DRY RUN FAILED: $DRY_MISS source path(s) missing in EDPA repo."
    exit 1
  else
    echo "DRY RUN PASSED: all source paths exist (EDPA commit: $EDPA_COMMIT)."
  fi
else
  echo "Sync complete (EDPA commit: $EDPA_COMMIT, $(date -u +%Y-%m-%dT%H:%M:%SZ))."
  echo "Review changes with: git diff $HUB_GOV/"
fi
