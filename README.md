# Technomaton Hub

Centralized mono-repo marketplace for Claude Code capabilities: skills, agents, commands, and hooks.

## Quick Start

```bash
# Install marketplace
/plugin marketplace add ./technomaton-hub

# Enable packs
/plugin install tm-dx@technomaton-hub
/plugin install tm-docs@technomaton-hub
/plugin install tm-secure@technomaton-hub
/plugin install tm-infra@technomaton-hub
/plugin install tm-github@technomaton-hub
```

See [TOGGLING.md](TOGGLING.md) for team defaults and fine-grained control.

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

## Development

```bash
make validate    # Run full validation suite
make export      # Generate Agent Skills to dist/
make new-pack    # Scaffold a new pack
make clean       # Remove dist/
```

## License

Dual license — community packs are MIT, commercial packs are proprietary.
See [LICENSE](LICENSE) and individual pack LICENSE files.
