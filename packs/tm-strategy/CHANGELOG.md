# Changelog

## [1.0.1] - 2026-04-03

### Fixed
- Fix plugin.json schema: directory paths for skills/commands, file paths for agents
- Remove unsupported fields and duplicate `hooks` from plugin.json
- Upgrade command models from sonnet to opus
- Fix command slash syntax in README: `/strategy/audit` → `/strategy:audit`

## [1.0.0] - 2026-04-03

### Added
- strategy-integrated skill (VUCA + PMF orchestration with composed-from)
- strategy-conductor meta-agent (dispatches to both vuca-conductor and pmf-conductor)
- 2 commands: /strategy:audit, /strategy:compass
