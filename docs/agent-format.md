# Agent Format

## Location

`packs/<pack>/agents/<agent-name>.md`

## Required Frontmatter

```yaml
---
name: agent-name-kebab-case
description: Full description of when to use this agent
tools: Read, Write, Grep, Glob
model: inherit
license: MIT
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  domain: category
---
```

### Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Kebab-case identifier |
| `description` | Yes | When to use this agent |
| `tools` | Yes | Comma-separated tool list |
| `model` | Yes | Model to use (inherit, sonnet, opus, haiku) |
| `license` | Yes | MIT or Proprietary |
| `metadata.author` | Yes | Author name |
| `metadata.version` | Yes | Semver |
| `metadata.tier` | Yes | community or commercial |
| `metadata.domain` | Yes | Domain category |

## Body Structure

```markdown
# Agent Name (Title Case)

## Role
Brief role description.

## Capabilities
- Bullet list of what this agent can do

## When to Use
When to invoke this agent.

## Output Format
Expected output format and conventions.
```
