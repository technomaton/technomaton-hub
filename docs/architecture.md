# Architecture

## Mono-repo Structure

Technomaton Hub is a centralized marketplace for Claude Code capabilities organized as packs.

```
technomaton-hub/
├── .claude-plugin/marketplace.json   # Central registry of all packs
├── packs/tm-<name>/                  # Self-contained capability packs
│   ├── .claude-plugin/plugin.json    # Pack manifest with capabilities
│   ├── .mcp.json                     # MCP server configuration
│   ├── skills/                       # SKILL.md files in subdirectories
│   ├── commands/                     # Command .md files in category subdirs
│   ├── agents/                       # Agent .md files
│   ├── hooks/hooks.json              # Hook definitions
│   ├── README.md / CHANGELOG.md / LICENSE
├── vendor/                           # Vendored external skills (committed)
│   ├── <name>-<version>/             # Snapshot of external source
│   │   ├── _vendor.json              # Import metadata
│   │   ├── LICENSE                   # Copy of upstream license
│   │   └── skills/                   # Vendored skill files
├── scripts/                          # Validation, export, scaffolding
├── templates/                        # Templates for new content
├── docs/                             # Reference documentation
└── dist/                             # Generated exports (gitignored)
```

## Pack Types

- **Domain packs** (dx, docs, secure, infra, etc.) — focused on a domain with skills + commands + agents
- **Integration packs** (github, atlassian, servicenow) — third-party platform connectors via MCP
- **Agent packs** (agents) — consolidated general-purpose agents
- **Governance packs** (governance) — EDPA evidence-driven allocation
- **Meta packs** (meta) — workflow orchestration combining skills from multiple packs and vendors
- **Commercial packs** (servicenow, public, business) — proprietary, licensed per arrangement

## Capability Types

| Type | Location | Format | Purpose |
|------|----------|--------|---------|
| Skill | `skills/<name>/SKILL.md` | YAML frontmatter + markdown | Composable domain knowledge |
| Command | `commands/<cat>/<name>.md` | YAML frontmatter + markdown | User-invocable actions |
| Agent | `agents/<name>.md` | YAML frontmatter + markdown | Specialized AI agents |
| Hook | `hooks/hooks.json` | JSON | Automated guardrails |

## License Tiers

- **Community (MIT)** — open source, free to use
- **Commercial (Proprietary)** — licensed per arrangement

## Export Pipeline

Skills can be exported to universal Agent Skills format by stripping Claude Code-specific fields (allowed-tools, model, hooks, etc.). Output goes to `dist/agentskills/`.

## Vendor System

External skills are vendored into `vendor/` as pinned snapshots. `imports.lock` tracks versions and content hashes. `NOTICE` has attribution for every vendored source. See [vendor-guide.md](vendor-guide.md).
