# tm-governance

**EDPA — Evidence-Driven Proportional Allocation v1.0.0-beta**

Derive hours from Git delivery evidence. Zero timesheets, mathematical guarantee, Monte Carlo calibrated CW weights.

> **Standalone version:** [github.com/technomaton/edpa](https://github.com/technomaton/edpa)
> **Website:** [edpa.technomaton.com](https://edpa.technomaton.com)
>
> This hub pack syncs content from the standalone EDPA repository, which includes a Python CLI engine, GitHub Actions, MCP server, worked examples, tests, and full documentation.

## Skills

- `edpa-setup` — Initialize EDPA governance for a project
- `edpa-engine` — Run evidence-driven calculation for an iteration
- `edpa-reports` — Generate timesheets, exports, and snapshots
- `edpa-autocalib` — Auto-calibrate CW heuristics
- `edpa-sync` — Bidirectional GitHub Projects <-> .edpa/backlog/ sync

## Commands

- `/edpa setup` — Initialize governance
- `/edpa close-iteration` — Close iteration (engine + reports)
- `/edpa reports` — Generate reports
- `/edpa calibrate` — Auto-calibrate heuristics
- `/edpa sync` — Sync GitHub Projects with local backlog

## Installation (standalone)

```bash
curl -fsSL https://edpa.technomaton.com/install.sh | sh
```

## Sync with upstream

This pack is synced from [technomaton/edpa](https://github.com/technomaton/edpa). To update:

```bash
# From hub root
scripts/sync-edpa.sh
```

## Documentation

- [Methodology](https://edpa.technomaton.com/methodology) | [GitHub](https://github.com/technomaton/edpa/blob/main/docs/methodology.md)
- [Quick Start](https://github.com/technomaton/edpa/blob/main/docs/quick-start.md)
- [FAQ](https://github.com/technomaton/edpa/blob/main/docs/faq.md)
- [Simulation & Calibration](https://github.com/technomaton/edpa-simulation)

See references/ for the original Czech methodology documentation.
