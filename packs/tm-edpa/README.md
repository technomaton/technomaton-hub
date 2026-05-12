# tm-edpa

**EDPA — Evidence-Driven Proportional Allocation.** Derive hours from Git delivery evidence. Zero timesheets, Monte Carlo calibrated CW weights, bidirectional sync with GitHub Projects.

- **Upstream:** [github.com/technomaton/edpa](https://github.com/technomaton/edpa)
- **Website:** [edpa.technomaton.com](https://edpa.technomaton.com)
- **Currently pinned:** see `_vendor.json`.

## How this pack works

Unlike most hub packs, `tm-edpa` is **not** vendored as a copy in this repository. The hub's `.claude-plugin/marketplace.json` registers `tm-edpa` with a `github` source that points directly to `technomaton/edpa@plugin`. When a user runs `/plugin install tm-edpa@technomaton-hub`, Claude Code fetches the plugin payload — skills, commands, hooks, `.mcp.json`, the Python engine, schemas, templates, and GitHub Actions workflows — straight from upstream. The hub never holds a duplicate.

This avoids the lag and gap problems that plagued the old `scripts/sync-edpa.sh` model, where the vendored copy in `packs/tm-edpa/` would routinely fall behind upstream by several minor versions and silently ship without the Python engine.

## Skills (6)

- `edpa-setup` — Initialize EDPA for a project
- `edpa-engine` — Run evidence-driven calculation for an iteration
- `edpa-reports` — Generate timesheets, exports, and snapshots
- `edpa-autocalib` — Auto-calibrate CW heuristics
- `edpa-sync` — Bidirectional GitHub Projects ↔ `.edpa/backlog/` sync
- `edpa-sync-people` — Reconcile `people.yaml` against GitHub collaborators

## Slash commands (6)

`/edpa setup`, `/edpa close-iteration`, `/edpa reports`, `/edpa calibrate`, `/edpa sync`, `/edpa board`

## Bumping the pinned upstream

Edit `_vendor.json` — update `pinned.tag`, `pinned.sha`, and `pinned.pinned_at`. Update the section in `CHANGELOG.md` (once it exists for this pack). If you need to pin Claude Code's marketplace fetch to that specific ref (rather than tracking the upstream default branch), add `ref: <tag>` to the source object in `../../.claude-plugin/marketplace.json`.

## Standalone installation (without Claude Code)

```bash
curl -fsSL https://edpa.technomaton.com/install.sh | sh
```

Use this path for Cursor, Codex CLI, or any environment that doesn't speak the Claude Code plugin protocol. The installer fetches the same plugin payload that `/plugin install tm-edpa@technomaton-hub` would, just without the marketplace UX.
