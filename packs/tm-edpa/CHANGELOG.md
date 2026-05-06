# Changelog

## 1.8.1-beta — 2026-05-06

Synced from standalone `technomaton/edpa` @ 6bcce3f (release v1.8.1-beta). Bundles 1.8.0 + 1.8.1 upstream changes (no v1.7.0-beta release was published).

### Changed (BREAKING — one-shot migration provided)
- **Contributors schema rename in `.edpa/backlog/**/*.yaml`:**
  - `contributors[].role` → `contributors[].as`
  - `contributors[].weight` → `contributors[].cw`
- The old keys collided with `people[].role` (job role: Dev/Arch/QA/PM) and forced readers to domain-switch. New keys have **no alias** — legacy YAMLs hard-fail on `validate_syntax.py` and are skipped by `engine.py load_backlog_items` with a migration breadcrumb.
- One-shot migration: `python3 .claude/edpa/scripts/migrate_contributors.py` (also translates job-role labels — architect / developer / QA / PM / product_owner — to nearest evidence role: key / owner / reviewer / consulted).

### Fixed (upstream — closes 18 E2E findings + N1/N2 from v1.8.0 re-validation)
- `engine.py` validates contributor schema, warns per-item when `contributors[].as` is not in the evidence enum (`owner|key|reviewer|consulted`) or `cw` is missing, and prints a summary `WARN: 0 evidence pairs derived from N contributor entries` when nothing produced evidence. Top-level `body` and `assignees` preserved on the way to evidence detection.
- `project_setup.py` is idempotent: reuses existing project on exact title match (gh project create silently lets duplicate titles through), reuses existing issues by title on rerun.
- `sync.cmd_conflicts` referenced a non-existent `parse_remote_items()` helper introduced in F10; real name is `map_gh_items_to_edpa(gh_data, fields_mapping)`. Same-field conflict detection now flags conflicts cleanly. (E2E v180 N1)

### Added (upstream — auto-commit + ergonomic gap closures)
- **Auto-commit of EDPA-managed setup state** via new `plugin/edpa/scripts/_auto_commit.py`. Used by `project_setup.py` STEP 9b (commits `.edpa/config/edpa.yaml`, `.edpa/config/issue_map.yaml`, `.edpa/iterations/` once project IDs / field IDs / option IDs are persisted), `sync push` (commits `issue_map.yaml` updates), and `sync setup-refresh` (commits recovered state). Each command takes `--no-commit` to opt out. Helper uses targeted `git add <paths>` + `git commit -- <paths>` so unrelated WIP stays uncommitted; silently skips when not in a git repo, no `user.name`/`user.email`, or paths match HEAD. (E2E v180 N2 — closes the silent loss of project IDs after `git pull --ff-only`.)
- Snapshot revisioning, `--until` parser parity, per-iteration YAML bootstrap, GraphQL extension of the Iteration field on rerun, snapshot.frozen_at field, README contributors-schema example.

### Synced into hub
- `evaluate_cw.py` — substantial change for new `contributors[].as` / `cw` schema validation.
- `capacity.yaml.tmpl` — additional content (~34 lines).
- `edpa-setup` + `edpa-reports` SKILL refresh.
- `project.yaml.tmpl` + `methodology-en.md` upstream version-string bump.
- `imports.lock` pin: `tm-edpa -> v1.8.1-beta (6bcce3f6b5fa)`.

The `migrate_contributors.py` script and `_auto_commit.py` helper are upstream-only — install standalone for those.

## 1.6.4-beta — 2026-05-06

Synced from standalone `technomaton/edpa` @ b694777 (release v1.6.4-beta). Bundles 1.6.0 → 1.6.4 upstream changes.

### Added
- **New skill `edpa-sync-people`** — reconciles `.edpa/config/people.yaml` against the repo's GitHub collaborator list (uses `gh` + python3, no hub-side dependencies). Sync script extended to pull this 6th skill.
- `edpa-setup` SKILL: `people.yaml` template now includes the `github` field with explicit "ASK user, never invent" guidance, and `/edpa:setup` explicitly forbids flat issue lists — `gh issue create` and hand-written `.edpa/backlog/**/*.yaml` are called out as forbidden bypasses; the wizard must use `backlog.py add --parent` per item then a single `sync push` at the end.

### Upstream highlights (not in hub pack surface today)
- **GitHub-aware people pipeline** across the standalone toolchain: new `_people_loader.py` with `display_handle()`/`avatar_url()`/`validate_people()`, MCP `edpa_validate` merges iteration + people diagnostics, MCP `edpa_people` returns the `github` field, `backlog.py` renders `@github_login`, `board.py` uses GitHub avatars, `edpa_commit_info.resolve_person()` matches GitHub noreply email and `git user.name` literal handle.
- **Collaborator → people.yaml sync** (the engine behind the new `edpa-sync-people` skill): `sync_collaborators.py`, `.github/workflows/collaborators-sync.yml` (member-add/remove/edit + workflow_dispatch + `COLLAB_SYNC_TOKEN` PAT fallback for org-level access), MCP tool `edpa_sync_people` (read-only diff). Asymmetric strategy: removed collaborators auto-flip to `availability: unavailable`; new collaborators open a PR with auto-filled stub. `ruamel.yaml` round-trip preserves comments, blank lines, key order.
- **`_sub_issue_linker.py`** — shared GraphQL `addSubIssue` helper used by `project_setup.py` STEP 8 and `sync.py push`. Idempotent ("already a sub-issue" = success).
- **Optional auto-create of GitHub Project views** — new STEP 10 in `project_setup.py` prompts the maintainer; non-fatal on failure; `--non-interactive` flag for CI.

### Synced into hub
- `edpa-sync-people/SKILL.md` (new).
- `edpa-setup` + `edpa-reports` SKILL refresh.
- `project.yaml.tmpl` + `methodology-en.md` upstream version-string bump.
- `imports.lock` pin: `tm-edpa -> v1.6.4-beta (b694777d206c)`.

### Hub metadata
- Capability counts: `5 / 6 / 0` → `6 / 6 / 0` (skills / commands / agents).
- `scripts/sync-edpa.sh` skill list extended to include `edpa-sync-people`.
- Pack README, hub README table, `hub-dashboard.html`, `FRAMEWORKS_OVERVIEW.md` updated.

## 1.5.0-beta — 2026-05-06

Synced from standalone `technomaton/edpa` @ 375c93b (release v1.5.0-beta). Bundles 1.4.1 + 1.5 upstream changes.

### Changed (BREAKING — no migration shim)
- **PI/iteration schema moved out of `edpa.yaml`.** The canonical source is now `.edpa/iterations/`:
  - `PI-{year}-{n}.yaml` carries PI-level metadata (status, `iteration_weeks`, `pi_iterations`, `start_date`, `end_date`).
  - `PI-{year}-{n}.{m}.yaml` carries per-iteration plan and delivery using ISO `start_date`/`end_date` plus an explicit `weeks` override.
- **Legacy fields removed:** `config['pis'][*]`, `config['pi']` singular fallback, the Czech `dates: "D.M.–D.M.YYYY"` string, and the `cadence: "2/10"` shorthand. `weeks` is reconciled against the date range — declared/derived mismatch is now an error.
- **MCP responses changed shape:** `edpa_iterations` returns `{iterations: [...], warnings?: [...]}` (was a bare list); `edpa_status` replaces `active_iteration_dates` with separate ISO `active_iteration_start`/`_end` fields and adds a top-level `warnings` array on schema drift.
- **No migration shim:** pre-1.5 `.edpa/` projects with `pis[]` must manually move iteration data into `iterations/*.yaml` before upgrading.

### Added (upstream — not in hub pack surface)
- `derive_pis()` runtime loader (`plugin/edpa/scripts/_pi_loader.py`) — reconstructs PI list, validates continuity (no date gaps/overlaps, weekend bridging tolerated), reconciles declared vs derived weeks. 30 unit tests.
- `edpa_validate` MCP tool + `validate_iterations.py` CLI for hooks/CI/assistant diagnostics.
- PostToolUse hook (`validate_on_save.sh`) now runs the iteration validator on `.edpa/iterations/*.yaml` changes (non-blocking, stderr).
- `project_setup.py` bootstraps a stub `iterations/PI-{year}-1.yaml` (1-week × 5 default cadence, status `planning`) on empty `iterations/`.

### Fixed
- `project_setup.py` setup-refresh: `gh project field-list` retries once after 2 s on 5xx instead of crashing with `TypeError: ... NoneType` from `json.loads(None)`.

### Synced into hub
- `edpa-engine` + `edpa-reports` + `edpa-setup` SKILL refresh (iteration-loader copy, validation hooks, new bootstrap behaviour).
- `project.yaml.tmpl` + `methodology-en.md` upstream version bump.
- `imports.lock` pin: `tm-edpa -> v1.5.0-beta (375c93b2baf6)`.

The new `_pi_loader.py`, `validate_iterations.py`, `edpa_validate` MCP tool and updated `validate_on_save.sh` hook are upstream-only — install standalone for the validator surface.

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
