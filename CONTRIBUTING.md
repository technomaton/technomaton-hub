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

When importing skills from external sources:
1. Add attribution to `NOTICE`
2. Preserve original license
3. Update `metadata.source` in frontmatter
