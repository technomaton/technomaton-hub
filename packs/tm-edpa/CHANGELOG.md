# Changelog

## 1.4.0-beta — 2026-05-06

Synced from standalone `technomaton/edpa` @ 4e1cc45 (release v1.4.0-beta). Bundles 1.3.1, 1.3.2 and 1.4 upstream changes.

### Changed (BREAKING for fresh installs only)
- **Default cadence flipped to AI-native**: 1-week iterations, 5-week PI (4 delivery + 1 IP). IP iteration absorbs leftover work, debt, prioritization, and PI planning itself — compressible to a single day with AI ceremonies. Classic SAFe (2w / 10w) still fully supported; opt out with `cadence.iteration_weeks: 2`, `cadence.pi_weeks: 10` in `people.yaml`.
- **Default `capacity_per_iteration` halved** in `capacity.yaml.tmpl`: `0.5 FTE Arch → 20h`, `1.0 FTE Dev → 40h` (was 40h / 80h on 2-week iteration). Template comments show the math both ways.
- Existing `.edpa/` projects keep their explicit cadence — no migration needed.

### Added (upstream highlights)
- `sync add-iteration <ID>` subcommand — append a new iteration option to the GitHub Project Iteration field, drop the TBD placeholder when the first real iteration is added. Idempotent. Reflected in `edpa-sync` skill flow.
- `tests/test_mcp_integration.py`: 16 live JSON-RPC stdio tests; `mcp_server.load_yaml` mtime-keyed LRU cache (50× speedup on repeated `tools/call`). MCP layer not shipped in hub pack — install standalone for the MCP surface.

### Fixed (hardening backport from v1.3 MCP)
- `evaluate_cw.py` (synced): `load_yaml` / `load_json` helpers return `None` with stderr WARNING instead of letting exceptions bubble up. Specific exceptions only; `KeyboardInterrupt` / `SystemExit` propagate.
- Upstream-only: same hardening pass applied to `engine.py`, `sync.py`, `pi_close.py`; two `except Exception` blocks in `engine.py` narrowed.

### Synced into hub
- `edpa-reports` + `edpa-setup` SKILL refresh (cadence-related copy + first-5-minutes walkthrough).
- `capacity.yaml.tmpl` (halved capacity defaults), `project.yaml.tmpl` (cadence default).
- `evaluate_cw.py` (load_yaml hardening).
- `methodology-en.md` upstream version-string bump.
- `imports.lock` pin: `tm-edpa -> v1.4.0-beta (4e1cc45f8ca8)`.

## 1.3.0-beta — 2026-05-05

Synced from standalone `technomaton/edpa` @ e55caf1 (release v1.3.0-beta).

### Upstream highlights (MCP-focused, not shipped in hub pack)
- Production-quality MCP server: portable plugin path via `${CLAUDE_PLUGIN_ROOT}`, stderr logging (`EDPA_LOG_LEVEL`/`EDPA_LOG_FILE`), versioned `serverInfo`, `item_id` regex validation, crash-safe handler dispatch, `${GITHUB_PERSONAL_ACCESS_TOKEN}` env-driven token. See upstream `docs/mcp.md`.
- Test count: 84 → **139 passing** (+43 unlocked by `jsonschema`+`mcp` dev deps, +12 new MCP hardening tests).
- **Note:** the MCP server itself lives under `plugin/edpa/scripts/mcp_server.py` upstream and is not synced into this hub pack today; users wanting the MCP surface should install the standalone via `curl -fsSL https://edpa.technomaton.com/install.sh | sh`.

### Synced into hub
- `edpa-reports` SKILL refresh.
- `edpa-setup` SKILL refresh.
- `project.yaml.tmpl` and `methodology-en.md` upstream version-string bump.
- `imports.lock` pin: `tm-edpa -> v1.3.0-beta (e55caf125768)`.

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
