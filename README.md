# Technomaton Hub

Centralized mono-repo marketplace for Claude Code capabilities: skills, agents, commands, and hooks.

## Quick Start

```bash
# Install marketplace
/plugin marketplace add ./technomaton-hub

# Enable packs
/plugin install technomaton-dx@technomaton-hub
/plugin install technomaton-docs@technomaton-hub
/plugin install technomaton-secure@technomaton-hub
/plugin install technomaton-infra@technomaton-hub
/plugin install technomaton-github@technomaton-hub
```

See [TOGGLING.md](TOGGLING.md) for team defaults and fine-grained control.

## Packs

| Pack | Description | Tier | Skills | Commands | Agents |
|------|-------------|------|--------|----------|--------|
| technomaton-dx | DX core: PR/release, docs sync, guardrails | community | 2 | 4 | 0 |
| technomaton-docs | Documentation: ADR, changelog, readme | community | 1 | 3 | 0 |
| technomaton-secure | Security & compliance | community | 2 | 3 | 4 |
| technomaton-infra | Infrastructure (Azure/TF) | community | 2 | 3 | 1 |
| technomaton-github | GitHub MCP utilities | community | 1 | 4 | 0 |
| technomaton-growth | Growth/Sales/Marketing | community | 0 | 4 | 1 |
| technomaton-eaa | Accessibility (EAA/kiosks) | community | 0 | 3 | 1 |
| technomaton-ops | Observability & Ops | community | 0 | 3 | 0 |
| technomaton-data | Data & Analytics | community | 0 | 1 | 4 |
| technomaton-ml | ML & AI | community | 0 | 2 | 1 |
| technomaton-servicedesk | Service Desk (Jira/SNow) | commercial | 0 | 2 | 0 |
| technomaton-public | Public Sector | commercial | 0 | 1 | 0 |
| technomaton-business | Finance & Legal | commercial | 0 | 2 | 0 |
| technomaton-governance | EDPA governance | community | 4 | 4 | 0 |
| technomaton-agents | General-purpose agents | community | 0 | 0 | 6 |

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
