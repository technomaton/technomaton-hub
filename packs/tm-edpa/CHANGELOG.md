# Changelog

## 1.2.1-beta — 2026-05-05

Synced from standalone `technomaton/edpa` @ 326651f.

### Changed
- Mirror standalone version 1.2.1-beta. Standalone hot-fix targets `install.sh` (not shipped in hub pack), so for the hub this is the 1.1.0-beta payload plus the small post-1.1.0 refinements below.
- `edpa-sync` SKILL + `sync` command: conflict detector now uses per-side cutoffs (was `max()` of both sides), and the GitHub Iteration field is always created — local values preserved when remote is missing.
- `edpa-reports` SKILL refreshed.
- `project.yaml.tmpl` and `methodology-en.md` updated to match upstream version-centralization changes.

## 1.1.0-beta — 2026-05-05

Synced from standalone `technomaton/edpa` @ 1616e85.

### Added
- `/edpa board` command — generate visual HTML Kanban snapshot from `.edpa/backlog/`.
- `sync setup-refresh` subcommand referenced by `edpa-sync` skill — re-discovers GitHub Project field IDs, option IDs, and issue map.

### Changed
- **Gates mode is now the default** for the engine and `project.yaml.tmpl` (`calculation_mode: gates`). Existing `.edpa/config/edpa.yaml` files keep their explicit setting; only freshly initialized projects pick up the new default. Switch back via `governance.calculation_mode: simple`.
- Updated config templates (`capacity.yaml.tmpl`, `cw_heuristics.yaml.tmpl`, `project.yaml.tmpl`) and `evaluate_cw.py` from upstream.
- Refreshed skills (`edpa-engine`, `edpa-setup`, `edpa-sync`, `edpa-reports`, `edpa-autocalib`) and references (`methodology-en.md`, `methodology.cs.md`, `setup-guide.md`).
- Validated against `technomaton/edpa-simulation-gates` (8 iterations, 6-person team, 156 transitions, 30 Monte Carlo runs): avg MAD 7.8 % vs ground truth.

### Fixed
- `sync push` now works against real GitHub Projects (proper field typing, parent/child linking via `addSubIssue`, status mirroring to `gh issue close`).
- `sync pull` reads per-level typed status fields (Initiative/Epic/Feature/Story Status) instead of GitHub's default `Status` field.

### Sync tooling
- `scripts/sync-edpa.sh`: added `board` command, fixed CZ methodology source name (`methodology-cs.md`), corrected EN methodology target (`methodology-en.md`).

## 1.0.0-beta

Initial public beta as part of TECHNOMATON Hub.
- Imported from `edpa-governance-template`.
- Skills: `edpa-setup`, `edpa-engine`, `edpa-reports`, `edpa-autocalib`, `edpa-sync`.
- Commands: `setup`, `close-iteration`, `reports`, `calibrate`, `sync`.
- References: methodology (EN/CZ), evidence-detection, dual-view, audit, auto-calibration, cadence, setup-guide.
