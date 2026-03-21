# Contributing to Technomaton Hub

## Dual License

This repository uses a dual license model:

- **Community packs** (MIT) — open contributions welcome
- **Commercial packs** (Proprietary) — contributions by arrangement only

By contributing to a community pack, you agree your contribution is licensed under MIT.

## Adding Content

### New pack

```bash
make new-pack
```

Follow the interactive scaffold. Every pack requires:
- `.claude-plugin/plugin.json`
- `.mcp.json`
- `hooks/hooks.json`
- `README.md`
- `CHANGELOG.md`
- `LICENSE`

### New skill

Create `packs/<pack>/skills/<skill-name>/SKILL.md` with required frontmatter:

```yaml
---
name: skill-name
description: What the skill does
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
---
```

### New command

Create `packs/<pack>/commands/<category>/<command>.md` with frontmatter:

```yaml
---
description: What the command does
allowed-tools: Read, Write
model: haiku
---
```

### New agent

Create `packs/<pack>/agents/<agent-name>.md` with frontmatter.

## Quality Standards

- Prefer read-only skills and dry-run guides (no exec by default)
- Keep packs focused — split if a pack grows beyond its domain
- Run `make validate` before submitting PRs
- Use Conventional Commits for commit messages

## Importing External Skills

### Vendoring (recommended)

Use the vendor script to import skills with quality gates:

```bash
make vendor-skill \
  source=https://github.com/org/repo \
  version=v1.0.0 \
  skills="skill1,skill2"
```

This automatically handles: quality checks, copying, hashing, NOTICE attribution, and imports.lock.

See `docs/vendor-guide.md` for full documentation.

### Manual import

When importing skills manually from external sources:
1. Add attribution to `NOTICE`
2. Preserve original license
3. Update `metadata.source` in frontmatter to `imported` or `adapted`
