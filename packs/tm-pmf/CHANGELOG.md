# Changelog

## [1.0.1] - 2026-04-03

### Fixed
- Fix plugin.json schema: directory paths for skills/commands, file paths for agents
- Remove unsupported `tier`/`status` fields and duplicate `hooks` from plugin.json
- Upgrade strategic command models from sonnet to opus (score/validate stay haiku)
- Fix command slash syntax in README: `/pmf/score` → `/pmf:score`

## [1.0.0] - 2026-04-03

### Added
- PMF assessment skill with 5 knowledge base files (Core, Product, Moats, Metrics, Launch)
- PMF opportunity scoring skill with 10 case studies
- PMF product design skill (4D Method guided workflow)
- PMF moat analysis skill
- 5 agents: conductor + 4 specialists (opportunity, product, moat, metrics)
- 6 commands: /pmf:score, /pmf:audit, /pmf:moat, /pmf:launch-check, /pmf:invisible-pain, /pmf:validate
- CC-BY-4.0 NOTICE for Miqdad Jaffer attribution
