# Changelog

## [1.1.0] — 2026-04-04

### Added
- Complete English knowledge base (`VUCA_FRAMEWORK_EN.md`) from Dawson/Lectica source material
- Lectical Levels measurement scale (levels 9-13, phases a-d)
- Empirical data: leader VUCA scores (n=2,193) and trends (n=4,296, 2008-2024)
- VUCA score targets by management level
- Complexity gap analysis section
- Assessment tools reference (LDMA, LRJA, CLAS, Lectica First, Team Fit Snapshot)
- 9 Key principles for application
- Full sources bibliography

### Changed
- Renamed `VUCA_FRAMEWORK.md` → `VUCA_FRAMEWORK_CS.md` (Czech version preserved)
- Skills and agents now use English as primary language (Czech in parentheses)
- SKILL.md routing defaults to EN knowledge base

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
