#!/usr/bin/env bash
set -euo pipefail

# Note: templates/ directory contains reference templates for skills, commands,
# agents, and packs. This script embeds content directly for simplicity.
# See templates/ for the canonical field formats when creating content manually.

echo "=== New Pack Scaffold ==="
echo ""

read -rp "Pack name (without tm- prefix): " PACK_NAME
FULL_NAME="tm-$PACK_NAME"
PACK_DIR="packs/$FULL_NAME"

if [ -d "$PACK_DIR" ]; then
  echo "ERROR: $PACK_DIR already exists"
  exit 1
fi

read -rp "Description: " DESCRIPTION
read -rp "Tier (community/commercial) [community]: " TIER
TIER=${TIER:-community}

if [ "$TIER" = "community" ]; then
  LICENSE_TYPE="MIT"
else
  LICENSE_TYPE="Proprietary"
fi

echo ""
echo "Creating $PACK_DIR..."

mkdir -p "$PACK_DIR"/{.claude-plugin,commands,agents,skills,hooks}

# plugin.json
cat > "$PACK_DIR/.claude-plugin/plugin.json" <<EOF
{
  "name": "$FULL_NAME",
  "version": "1.0.0",
  "description": "$DESCRIPTION",
  "author": { "name": "TECHNOMATON Team" },
  "license": "$LICENSE_TYPE",
  "tier": "$TIER",
  "hooks": "./hooks/hooks.json",
  "mcpServers": "./.mcp.json",
  "skills": [],
  "commands": [],
  "agents": []
}
EOF

# .mcp.json
cat > "$PACK_DIR/.mcp.json" <<'EOF'
{
  "mcpServers": {}
}
EOF

# hooks.json
cat > "$PACK_DIR/hooks/hooks.json" <<EOF
{
  "description": "Hooks for $FULL_NAME",
  "hooks": {}
}
EOF

# README.md
cat > "$PACK_DIR/README.md" <<EOF
# $FULL_NAME

**$DESCRIPTION**

See \`/help\` for commands & agents.
EOF

# CHANGELOG.md
cat > "$PACK_DIR/CHANGELOG.md" <<'EOF'
## 1.0.0
- Initial release
EOF

# LICENSE
if [ "$TIER" = "community" ]; then
  cat > "$PACK_DIR/LICENSE" <<'EOF'
MIT License

Copyright (c) 2026 TECHNOMATON Group s.r.o.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
else
  cat > "$PACK_DIR/LICENSE" <<EOF
Proprietary License

Copyright (c) 2026 TECHNOMATON Group s.r.o. All Rights Reserved.

This software is proprietary and confidential. Unauthorized copying, distribution,
or use of this software, via any medium, is strictly prohibited.

Contact: info@technomaton.com
EOF
fi

echo ""
echo "Pack created at $PACK_DIR"
echo "Next steps:"
echo "  1. Add skills, commands, or agents"
echo "  2. Update plugin.json with capability paths"
echo "  3. Add entry to .claude-plugin/marketplace.json"
echo "  4. Run: make validate"
