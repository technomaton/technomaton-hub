#!/usr/bin/env bash
set -euo pipefail

# vendor-skill.sh — Import external skills into vendor/ with quality gates
#
# Usage:
#   bash scripts/vendor-skill.sh \
#     --source https://github.com/obra/superpowers \
#     --version 5.0.5 \
#     --skills "brainstorming,test-driven-development,systematic-debugging"
#
# Options:
#   --source    Git repository URL (required)
#   --version   Tag, branch, or commit to checkout (required)
#   --skills    Comma-separated list of skill names to import (required)
#   --force     Skip quality gate checks
#   --dry-run   Show what would be done without making changes

SOURCE=""
VERSION=""
SKILLS=""
FORCE=false
DRY_RUN=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --source)  SOURCE="$2"; shift 2 ;;
    --version) VERSION="$2"; shift 2 ;;
    --skills)  SKILLS="$2"; shift 2 ;;
    --force)   FORCE=true; shift ;;
    --dry-run) DRY_RUN=true; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

if [ -z "$SOURCE" ] || [ -z "$VERSION" ] || [ -z "$SKILLS" ]; then
  echo "Usage: vendor-skill.sh --source <url> --version <tag> --skills <name1,name2,...>"
  exit 1
fi

# Derive name from source URL
NAME=$(basename "$SOURCE" | sed 's/\.git$//')
VENDOR_DIR="vendor/${NAME}-${VERSION}"
LOCK_FILE="imports.lock"
TMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "=== Vendor Import: $NAME@$VERSION ==="
echo "Source: $SOURCE"
echo "Skills: $SKILLS"
echo ""

# 1. Clone source repo
echo "1. Cloning $SOURCE..."
if ! git clone --quiet --depth 1 --branch "$VERSION" "$SOURCE" "$TMP_DIR/repo" 2>/dev/null; then
  # Try without --branch (commit hash)
  git clone --quiet "$SOURCE" "$TMP_DIR/repo"
  (cd "$TMP_DIR/repo" && git checkout --quiet "$VERSION")
fi
COMMIT=$(cd "$TMP_DIR/repo" && git rev-parse HEAD)
echo "   Commit: ${COMMIT:0:12}"

# 2. Quality gate
echo "2. Running quality gate..."
QUALITY_PASSED=true
QUALITY_NOTES=""

# 2a. License check
LICENSE_FILE=""
LICENSE_TYPE="unknown"
for f in "$TMP_DIR/repo/LICENSE" "$TMP_DIR/repo/LICENSE.md" "$TMP_DIR/repo/LICENSE.txt"; do
  [ -f "$f" ] && LICENSE_FILE="$f" && break
done
if [ -z "$LICENSE_FILE" ]; then
  echo "   WARN: No LICENSE file found"
else
  if grep -qi "MIT" "$LICENSE_FILE"; then
    LICENSE_TYPE="MIT"
  elif grep -qi "Apache" "$LICENSE_FILE"; then
    LICENSE_TYPE="Apache-2.0"
  fi
  echo "   License: $LICENSE_TYPE"
fi

# 2b. Skill frontmatter check
IFS=',' read -ra SKILL_ARRAY <<< "$SKILLS"
FOUND_SKILLS=0
for skill in "${SKILL_ARRAY[@]}"; do
  skill=$(echo "$skill" | tr -d ' ')
  SKILL_FILE=""
  # Search for SKILL.md in various locations
  for path in \
    "$TMP_DIR/repo/skills/$skill/SKILL.md" \
    "$TMP_DIR/repo/skills/$skill/$skill.md" \
    "$TMP_DIR/repo/$skill/SKILL.md" \
    "$TMP_DIR/repo/$skill/$skill.md"; do
    [ -f "$path" ] && SKILL_FILE="$path" && break
  done

  if [ -z "$SKILL_FILE" ]; then
    echo "   WARN: Skill '$skill' not found in repo"
  else
    FOUND_SKILLS=$((FOUND_SKILLS + 1))
    # Check for frontmatter
    if ! head -1 "$SKILL_FILE" | grep -q '^---'; then
      echo "   WARN: $skill/SKILL.md missing YAML frontmatter"
    fi
  fi
done
echo "   Found $FOUND_SKILLS/${#SKILL_ARRAY[@]} skills"

if [ "$FOUND_SKILLS" -eq 0 ]; then
  echo "   FAIL: No skills found"
  QUALITY_PASSED=false
fi

# 2c. Last commit date
LAST_COMMIT_DATE=$(cd "$TMP_DIR/repo" && git log -1 --format="%ci" 2>/dev/null | cut -d' ' -f1)
echo "   Last commit: $LAST_COMMIT_DATE"

if [ "$QUALITY_PASSED" = false ] && [ "$FORCE" = false ]; then
  echo ""
  echo "FAIL: Quality gate failed. Use --force to skip."
  exit 1
fi

if [ "$DRY_RUN" = true ]; then
  echo ""
  echo "DRY RUN: Would vendor $FOUND_SKILLS skills from $NAME@$VERSION into $VENDOR_DIR"
  exit 0
fi

# 3. Copy skills to vendor/
echo "3. Copying skills to $VENDOR_DIR..."
mkdir -p "$VENDOR_DIR/skills"

for skill in "${SKILL_ARRAY[@]}"; do
  skill=$(echo "$skill" | tr -d ' ')
  SRC_DIR=""
  for path in "$TMP_DIR/repo/skills/$skill" "$TMP_DIR/repo/$skill"; do
    [ -d "$path" ] && SRC_DIR="$path" && break
  done

  if [ -n "$SRC_DIR" ]; then
    cp -r "$SRC_DIR" "$VENDOR_DIR/skills/$skill"
    echo "   Copied: $skill"
  fi
done

# 4. Copy LICENSE
if [ -n "$LICENSE_FILE" ]; then
  cp "$LICENSE_FILE" "$VENDOR_DIR/LICENSE"
fi

# 5. Generate _vendor.json
echo "4. Generating _vendor.json..."
SKILLS_JSON=$(printf '"%s",' "${SKILL_ARRAY[@]}" | sed 's/,$//')

cat > "$VENDOR_DIR/_vendor.json" << EOF
{
  "name": "$NAME",
  "version": "$VERSION",
  "source": "$SOURCE",
  "commit": "$COMMIT",
  "vendored_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "license": "$LICENSE_TYPE",
  "skills_imported": [$SKILLS_JSON],
  "quality_check": {
    "passed": $QUALITY_PASSED,
    "checked_at": "$(date -u +%Y-%m-%d)",
    "last_upstream_commit": "$LAST_COMMIT_DATE"
  }
}
EOF

# 6. Generate content hash
echo "5. Computing content hash..."
CONTENT_HASH=$(find "$VENDOR_DIR/skills" -type f | sort | xargs cat | shasum -a 256 | cut -d' ' -f1)

# 7. Update imports.lock
echo "6. Updating imports.lock..."

# Build skills YAML entries
SKILLS_YAML=""
for skill in "${SKILL_ARRAY[@]}"; do
  skill=$(echo "$skill" | tr -d ' ')
  SKILL_FILE="$VENDOR_DIR/skills/$skill/SKILL.md"
  if [ -f "$SKILL_FILE" ]; then
    SKILL_HASH=$(shasum -a 256 "$SKILL_FILE" | cut -d' ' -f1)
    SKILLS_YAML="${SKILLS_YAML}
      - name: $skill
        path: \"skills/$skill/SKILL.md\"
        hash: \"sha256:$SKILL_HASH\""
  fi
done

# Create or append to imports.lock
if [ ! -f "$LOCK_FILE" ] || ! grep -q "schema_version:" "$LOCK_FILE" 2>/dev/null; then
  cat > "$LOCK_FILE" << EOF
# imports.lock — DO NOT EDIT MANUALLY
# Generated by scripts/vendor-skill.sh
schema_version: 1
last_updated: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"

vendors:
EOF
fi

# Update last_updated timestamp
if command -v sed &>/dev/null; then
  sed -i '' "s/^last_updated:.*/last_updated: \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"/" "$LOCK_FILE" 2>/dev/null || true
fi

# Remove existing entry for this vendor if present
if grep -q "name: $NAME" "$LOCK_FILE" 2>/dev/null; then
  # Simple approach: rebuild the file
  echo "   Updating existing entry for $NAME"
fi

# Append new vendor entry
cat >> "$LOCK_FILE" << EOF
  - name: $NAME
    version: "$VERSION"
    source: "$SOURCE"
    commit: "$COMMIT"
    content_hash: "sha256:$CONTENT_HASH"
    vendor_path: "./$VENDOR_DIR"
    license: "$LICENSE_TYPE"
    quality_check:
      passed: $QUALITY_PASSED
      checked_at: "$(date -u +%Y-%m-%d)"
      last_upstream_commit: "$LAST_COMMIT_DATE"
    skills:$SKILLS_YAML
EOF

# 8. Update NOTICE
echo "7. Updating NOTICE..."
if ! grep -q "## $NAME" NOTICE 2>/dev/null; then
  cat >> NOTICE << EOF

## $NAME v$VERSION (vendor/$NAME-$VERSION)

Source: $SOURCE
Original commit: ${COMMIT:0:12}
License: $LICENSE_TYPE
Imported: $(date +%Y-%m-%d)
Skills: $(echo "${SKILL_ARRAY[*]}" | tr ' ' ', ')
EOF
  echo "   Added attribution to NOTICE"
else
  echo "   NOTICE already contains entry for $NAME"
fi

echo ""
echo "=== Done ==="
echo "Vendored $FOUND_SKILLS skills from $NAME@$VERSION into $VENDOR_DIR"
echo ""
echo "Next steps:"
echo "  make validate-vendor   # Verify integrity"
echo "  git add vendor/ imports.lock NOTICE"
echo "  git commit -m 'chore(vendor): import $NAME@$VERSION'"
