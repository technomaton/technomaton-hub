# Skill Format

## Location

`packs/<pack>/skills/<skill-name>/SKILL.md`

## Required Frontmatter

```yaml
---
name: skill-name-kebab-case
description: What the skill does and when to use it
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

### Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Kebab-case identifier |
| `description` | Yes | Usage description |
| `license` | Yes | MIT or Proprietary |
| `compatibility` | Yes | Platform compatibility |
| `allowed-tools` | Yes | Space-separated tool list |
| `metadata.author` | Yes | Author name |
| `metadata.version` | Yes | Semver |
| `metadata.tier` | Yes | community or commercial |
| `metadata.source` | Yes | original, imported, or adapted |

### Optional Fields

| Field | Description |
|-------|-------------|
| `context` | Additional context files to load |
| `model` | Preferred model (inherit, sonnet, opus) |
| `hooks` | Hook references |
| `disable-model-invocation` | Prevent nested model calls |
| `metadata.domain` | Domain category |
| `metadata.phase` | Workflow phase |

## Body

After the frontmatter, include:
- `# Skill Title` heading
- Description of what the skill does
- Steps or instructions
- Error handling

## Export

When exported to Agent Skills format, CC-specific fields (allowed-tools, context, model, hooks, disable-model-invocation) are stripped.
