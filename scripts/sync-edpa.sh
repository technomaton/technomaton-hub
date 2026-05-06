#!/usr/bin/env bash
# Sync EDPA standalone repo content into hub's packs/tm-edpa/
#
# Defaults to fetching the requested release tag from
# github.com/technomaton/edpa via `gh release download` (or git
# archive for the curl path), so the canonical source is always the
# published release — not a local checkout.
#
# Usage:
#   scripts/sync-edpa.sh                       # latest pre-release from GitHub
#   scripts/sync-edpa.sh --tag v1.2.1-beta     # specific GitHub tag
#   scripts/sync-edpa.sh --local ../edpa       # sync from local working copy
#   scripts/sync-edpa.sh --dry-run             # verify source paths only
#
# Combine flags freely: `--dry-run --tag v1.2.1-beta`, `--dry-run --local ../edpa`.
#
# After a non-dry-run sync, imports.lock is updated with the synced
# tag + commit. Pass --no-lock to skip.

set -euo pipefail

DRY_RUN=false
LOCAL_PATH=""
TAG=""
UPDATE_LOCK=true

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --local)   LOCAL_PATH="${2:-}"; shift 2 ;;
    --tag)     TAG="${2:-}"; shift 2 ;;
    --no-lock) UPDATE_LOCK=false; shift ;;
    -h|--help)
      sed -n '2,18p' "$0"
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

HUB_GOV="packs/tm-edpa"
WORK_DIR=""
SRC_LABEL=""
SRC_COMMIT=""
SRC_TAG=""

cleanup() { [ -n "$WORK_DIR" ] && [ -d "$WORK_DIR" ] && rm -rf "$WORK_DIR" || true; }
trap cleanup EXIT

# ------------------------------------------------------------
# Resolve source: --local PATH wins; otherwise fetch from GitHub.
# ------------------------------------------------------------
if [ -n "$LOCAL_PATH" ]; then
  if [ ! -d "$LOCAL_PATH/plugin" ]; then
    echo "ERROR: --local path $LOCAL_PATH has no plugin/ directory"
    exit 1
  fi
  SRC_ROOT="$LOCAL_PATH"
  SRC_COMMIT=$(git -C "$LOCAL_PATH" rev-parse --short HEAD 2>/dev/null || echo "unknown")
  SRC_TAG=$(git -C "$LOCAL_PATH" describe --tags --exact-match 2>/dev/null || echo "")
  SRC_LABEL="local: $LOCAL_PATH @ ${SRC_TAG:-$SRC_COMMIT}"
else
  if ! command -v gh >/dev/null 2>&1; then
    echo "ERROR: gh CLI not found. Install gh or pass --local PATH."
    exit 1
  fi

  if [ -z "$TAG" ]; then
    TAG=$(gh release list --repo technomaton/edpa --limit 1 \
      --json tagName --jq '.[0].tagName' 2>/dev/null || echo "")
    if [ -z "$TAG" ]; then
      echo "ERROR: failed to resolve latest edpa release. Pass --tag explicitly."
      exit 1
    fi
    echo "Resolved latest release tag: $TAG"
  fi

  WORK_DIR=$(mktemp -d -t edpa-sync.XXXXXX)
  echo "Fetching tarball for $TAG from technomaton/edpa..."
  gh release download "$TAG" --repo technomaton/edpa \
    --archive=tar.gz --output "$WORK_DIR/edpa.tar.gz" 2>/dev/null \
    || gh api "repos/technomaton/edpa/tarball/$TAG" > "$WORK_DIR/edpa.tar.gz"

  tar -xzf "$WORK_DIR/edpa.tar.gz" -C "$WORK_DIR"
  SRC_ROOT=$(find "$WORK_DIR" -maxdepth 1 -mindepth 1 -type d | head -1)
  if [ ! -d "$SRC_ROOT/plugin" ]; then
    echo "ERROR: extracted tarball has no plugin/ directory at $SRC_ROOT"
    exit 1
  fi

  SRC_COMMIT=$(gh api "repos/technomaton/edpa/git/refs/tags/$TAG" \
    --jq '.object.sha' 2>/dev/null || echo "unknown")
  # Annotated tag → dereference to commit
  if [ "$SRC_COMMIT" != "unknown" ]; then
    OBJ_TYPE=$(gh api "repos/technomaton/edpa/git/refs/tags/$TAG" \
      --jq '.object.type' 2>/dev/null || echo "")
    if [ "$OBJ_TYPE" = "tag" ]; then
      SRC_COMMIT=$(gh api "repos/technomaton/edpa/git/tags/$SRC_COMMIT" \
        --jq '.object.sha' 2>/dev/null || echo "$SRC_COMMIT")
    fi
  fi
  SRC_TAG="$TAG"
  SRC_LABEL="github: technomaton/edpa @ $TAG (${SRC_COMMIT:0:12})"
fi

# ------------------------------------------------------------
# Sync logic — same mapping for local and remote sources.
# EDPA layout (1.2.x):
#   plugin/skills/           -> skills
#   plugin/commands/edpa/    -> commands
#   plugin/edpa/scripts/     -> scripts
#   plugin/edpa/templates/   -> config templates
#   docs/                    -> references
# ------------------------------------------------------------
DRY_MISS=0

if $DRY_RUN; then
  echo "DRY RUN: checking source paths in $SRC_LABEL..."
else
  echo "Syncing from $SRC_LABEL to $HUB_GOV..."
fi

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

for skill in edpa-setup edpa-engine edpa-reports edpa-autocalib edpa-sync edpa-sync-people; do
  sync_file "$SRC_ROOT/plugin/skills/$skill/SKILL.md" \
            "$HUB_GOV/skills/$skill/SKILL.md" \
            "skill: $skill"
done

for cmd in setup close-iteration reports calibrate sync board; do
  sync_file "$SRC_ROOT/plugin/commands/edpa/$cmd.md" \
            "$HUB_GOV/commands/edpa/$cmd.md" \
            "command: $cmd"
done

sync_file "$SRC_ROOT/docs/evidence-detection.md"  "$HUB_GOV/references/evidence-detection.md" "ref: evidence-detection"
sync_file "$SRC_ROOT/docs/dual-view.md"           "$HUB_GOV/references/dual-view.md"          "ref: dual-view"
sync_file "$SRC_ROOT/docs/audit-trail.md"         "$HUB_GOV/references/audit.md"              "ref: audit-trail -> audit"
sync_file "$SRC_ROOT/docs/auto-calibration.md"    "$HUB_GOV/references/auto-calibration.md"   "ref: auto-calibration"
sync_file "$SRC_ROOT/docs/cadence.md"             "$HUB_GOV/references/cadence.md"            "ref: cadence"
sync_file "$SRC_ROOT/docs/github-setup.md"        "$HUB_GOV/references/setup-guide.md"        "ref: github-setup -> setup-guide"

sync_file "$SRC_ROOT/docs/methodology.md"    "$HUB_GOV/references/methodology-en.md" "ref: methodology -> methodology-en"
sync_file "$SRC_ROOT/docs/methodology-cs.md" "$HUB_GOV/references/methodology.cs.md"  "ref: methodology-cs -> methodology.cs"

sync_file "$SRC_ROOT/plugin/edpa/templates/people.yaml.tmpl"        "$HUB_GOV/config/capacity.yaml.tmpl"      "template: people -> capacity"
sync_file "$SRC_ROOT/plugin/edpa/templates/cw_heuristics.yaml.tmpl" "$HUB_GOV/config/cw_heuristics.yaml.tmpl" "template: cw_heuristics"
sync_file "$SRC_ROOT/plugin/edpa/templates/project.yaml.tmpl"       "$HUB_GOV/config/project.yaml.tmpl"       "template: project"

sync_file "$SRC_ROOT/plugin/edpa/scripts/evaluate_cw.py" "$HUB_GOV/scripts/evaluate_cw.py" "script: evaluate_cw.py"

echo ""
if $DRY_RUN; then
  if [ "$DRY_MISS" -gt 0 ]; then
    echo "DRY RUN FAILED: $DRY_MISS source path(s) missing."
    exit 1
  fi
  echo "DRY RUN PASSED ($SRC_LABEL)."
  exit 0
fi

echo "Sync complete ($SRC_LABEL, $(date -u +%Y-%m-%dT%H:%M:%SZ))."

# ------------------------------------------------------------
# Update imports.lock — only when we actually pulled from GitHub
# with a real tag, and only if the user didn't opt out.
# ------------------------------------------------------------
if $UPDATE_LOCK && [ -n "$SRC_TAG" ] && [ "$SRC_COMMIT" != "unknown" ]; then
  if [ -x scripts/update-edpa-lock.sh ]; then
    bash scripts/update-edpa-lock.sh "$SRC_TAG" "$SRC_COMMIT"
  else
    echo "(scripts/update-edpa-lock.sh not present — skipping imports.lock update)"
  fi
fi

echo "Review changes with: git diff $HUB_GOV/"
