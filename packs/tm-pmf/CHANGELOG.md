# Changelog

## [1.1.0] — 2026-04-04

### Added
- `AI_PMF_STRATEGY.md` — 5-Question Pain Point Analysis, AI Positioning Template, AI Strategic Lens, 9 Shifts in AI PM, AI Product Feasibility Checklist
- `AI_PMF_TRUST.md` — Trust Layer (5 components), 10 Psychological Triggers for AI Adoption, Key Quotes Index
- 7 AI Launch Plays and Three-Layer Launch Framework in `AI_PMF_LAUNCH.md`
- Distribution Moat and Trust Moat full detail in `AI_PMF_MOATS.md`
- Feature-first vs. pain-first distinction in Moats knowledge

### Changed
- SKILL.md routing updated for all 7 knowledge base files and framework mappings
- Moat taxonomy expanded from 3 core to 5 core moat types
- Agent scopes updated for new framework coverage

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
