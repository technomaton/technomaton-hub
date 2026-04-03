# Technomaton Hub

Centralized mono-repo marketplace for Claude Code capabilities: skills, agents, commands, and hooks.

## Quick Start

### Option A: Git Submodule (recommended for teams)

```bash
git submodule add https://github.com/technomaton/technomaton-hub
```

Create `.claude/settings.json` in your project:

```json
{
  "extraKnownMarketplaces": {
    "technomaton-hub": {
      "source": {
        "source": "path",
        "path": "./technomaton-hub/.claude-plugin/marketplace.json"
      }
    }
  },
  "enabledPlugins": {
    "tm-dx@technomaton-hub": "enabled",
    "tm-docs@technomaton-hub": "enabled",
    "tm-secure@technomaton-hub": "enabled"
  }
}
```

```bash
git add .claude/settings.json && git commit -m "chore: enable technomaton-hub packs"
```

### Option B: Local Path (solo/testing)

```bash
/plugin marketplace add /path/to/technomaton-hub
/plugin install tm-dx@technomaton-hub
```

### Option C: Remote URL

```bash
/plugin marketplace add https://github.com/technomaton/technomaton-hub
```

Open Claude Code — packs load automatically.

### Option D: Copilot / Cursor / Codex (via APM)

If you use GitHub Copilot, Cursor, or Codex CLI, install via [Microsoft APM](https://github.com/microsoft/apm):

```bash
apm install technomaton-hub
```

This compiles Hub skills into `AGENTS.md` (Copilot/Cursor) and `.cursor/rules/` (Cursor) automatically. Hub governance (validation, content hashing, license enforcement) is applied at source — APM handles distribution only.

See [TOGGLING.md](TOGGLING.md) for team defaults, role profiles, and fine-grained control.

## Packs

| Pack | Description | Tier | Skills | Commands | Agents |
|------|-------------|------|--------|----------|--------|
| tm-dx | DX core: PR/release, guardrails | community | 2 | 2 | 0 |
| tm-docs | Documentation: ADR, changelog, readme | community | 1 | 3 | 0 |
| tm-secure | Security & compliance | community | 2 | 3 | 4 |
| tm-infra | Infrastructure (Azure/TF) | community | 2 | 3 | 1 |
| tm-github | GitHub MCP utilities | community | 1 | 4 | 0 |
| tm-growth | Growth/Sales/Marketing | community | 0 | 4 | 1 |
| tm-eaa | Accessibility (EAA/kiosks) | community | 0 | 3 | 1 |
| tm-ops | Observability & Ops | community | 0 | 3 | 0 |
| tm-data | Data & Analytics | community | 0 | 1 | 3 |
| tm-ml | ML & AI | community | 0 | 2 | 1 |
| tm-atlassian | Atlassian (Jira/Confluence) | community | 0 | 1 | 0 |
| tm-servicenow | ServiceNow (ITSM) | commercial | 0 | 1 | 0 |
| tm-public | Public Sector | commercial | 0 | 1 | 0 |
| tm-business | Finance & Legal | commercial | 0 | 2 | 0 |
| tm-governance | EDPA governance | community | 4 | 4 | 0 |
| tm-agents | General-purpose agents | community | 0 | 0 | 6 |
| tm-meta | Meta-workflows (orchestration) | community | 3 | 0 | 0 |

## How It Works

```
1. git submodule add technomaton-hub    (or /plugin marketplace add)
2. .claude/settings.json committed      (team-wide defaults)
3. User opens Claude Code               (packs load automatically)
4. /pr/review                           (command)
5. @security-reviewer                   (agent)
6. Claude invokes skills on its own     (skills + meta-skills)
7. Hooks run automatically              (format, tests, scanning)
```

See [docs/how-it-works.md](docs/how-it-works.md) for the full guide.

## Development

```bash
make validate    # Run full validation suite (10 checks)
make export      # Generate Agent Skills to dist/
make new-pack    # Scaffold a new pack
make clean       # Remove dist/
```

## Vendor Management

```bash
make vendor-skill source=<url> version=<tag> skills="skill1,skill2"
make update-vendor name=<vendor> version=<new-tag>
make check-upstream       # Check for upstream changes
make validate-vendor      # Verify integrity
```

See [docs/vendor-guide.md](docs/vendor-guide.md) for details.

## License

Dual license — community packs are MIT, commercial packs are proprietary.
See [LICENSE](LICENSE) and individual pack LICENSE files.
