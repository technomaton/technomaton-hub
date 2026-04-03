# Changelog

## [1.1.0] — 2026-04-04

### Changed
- Integration Matrix expanded with new PMF framework cross-references (Trust Layer, AI Strategic Lens, Feasibility Checklist, 5-Question Pain Analysis, Psychological Triggers)
- All skill, agent, and command files now use English as primary language (Czech in parentheses)
- Strategy conductor references updated for expanded PMF coverage

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
