# Templates

Reference templates for creating new content manually. These show the canonical
frontmatter fields and structure for each content type.

| Template | Purpose |
|---|---|
| `skill/SKILL.md.tmpl` | Skill frontmatter + body |
| `command/command.md.tmpl` | Command frontmatter + body |
| `agent/agent.md.tmpl` | Agent frontmatter + structured body |
| `pack/` | Pack scaffold files (LICENSE, README, CHANGELOG) |
| `hook/hook-entry.json.tmpl` | Hook configuration entry |

The `scripts/new-pack.sh` scaffold script embeds pack content directly via
heredocs for simplicity. Use these templates as reference when adding skills,
commands, or agents to an existing pack.
