# TECHNOMATON Hub — Project Conventions

## Structure

```
technomaton-hub/
├── packs/tm-<name>/     # Each pack is a self-contained plugin
│   ├── .claude-plugin/plugin.json
│   ├── .mcp.json
│   ├── skills/                   # SKILL.md files in subdirectories
│   ├── commands/                 # Command .md files in category subdirs
│   ├── agents/                   # Agent .md files
│   ├── hooks/hooks.json
│   ├── README.md
│   ├── CHANGELOG.md
│   └── LICENSE
├── .claude-plugin/marketplace.json  # Central registry
├── vendor/                       # Vendored external skills (committed)
├── scripts/                      # Validation, export, scaffold
├── templates/                    # Templates for new content
└── docs/                         # Reference documentation
```

## SKILL.md Format

Every skill must have YAML frontmatter with: name, description, license, compatibility, allowed-tools, metadata (author, version, tier, source).

## Dual License Rules

- Community packs (`tier: community`): MIT License
- Commercial packs (`tier: commercial`): Proprietary License
- License file in each pack must match its tier
- NOTICE file tracks imported content attribution

## Validation

```bash
make validate          # Full suite
make export            # Generate Agent Skills
```

## Adding New Content

- New pack: `make new-pack`
- New skill: create `skills/<name>/SKILL.md` in target pack
- New command: create `commands/<category>/<name>.md` in target pack
- New agent: create `agents/<name>.md` in target pack
- Update pack's plugin.json with new capability paths
- Update .claude-plugin/marketplace.json capabilities count

## Vendor Management

External skills are vendored into `vendor/` for stability and offline use.

```bash
make vendor-skill source=<url> version=<tag> skills="skill1,skill2"
make update-vendor name=<vendor> version=<new-tag>
make check-upstream       # Check for upstream changes
make validate-vendor      # Verify integrity
```

- `imports.lock` tracks pinned versions and content hashes
- `vendor/<name>-<version>/_vendor.json` has import metadata
- `NOTICE` must have attribution for every vendored source
- vendor/ IS committed to git (not gitignored)

## Git Conventions

- Conventional Commits: `feat(pack):`, `fix(pack):`, `docs:`, `chore:`
- One logical change per commit
- PR titles follow same convention
