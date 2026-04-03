# Changelog

## [1.0.1] - 2026-04-03

### Fixed
- Add `Agent` to allowed-tools in all commands (required for conductor dispatch)
- Fix plugin.json schema: directory paths for skills/commands, file paths for agents
- Remove duplicate `hooks` field from plugin.json (auto-loaded by Claude Code)
- Upgrade command model from sonnet to opus for deeper strategic analysis

## [1.0.0] - 2026-04-03

### Added
- VUCA assessment skill with complete framework knowledge base (CC-BY-4.0)
- 5 agents: conductor + 4 dimension specialists (collaboration, perspectives, context, decision)
- 3 commands: /vuca:audit, /vuca:redesign, /vuca:portfolio
