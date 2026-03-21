# Command Format

## Location

`packs/<pack>/commands/<category>/<command-name>.md`

## Required Frontmatter

```yaml
---
description: What the command does
allowed-tools: Read, Write
model: haiku
---
```

### Fields

| Field | Required | Description |
|-------|----------|-------------|
| `description` | Yes | One-line description |
| `allowed-tools` | Yes | Comma-separated tool list |
| `model` | Yes | Model to use (haiku, sonnet, opus) |

## Body

After the frontmatter, include:
- `# Command Title` heading
- Brief instruction for what the command should do

## Naming Convention

- Category directory groups related commands: `commands/security/`, `commands/growth/`
- Command filename is the action: `secrets.md`, `icp.md`
- User invokes as: `/category/command` or via pack prefix
