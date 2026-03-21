# tm-governance

**EDPA — Evidence-Driven Proportional Allocation v2.2**

Capacity derivation from delivery evidence. Composable governance skill suite for GitHub-native projects.

> **Standalone version:** [github.com/technomaton/edpa](https://github.com/technomaton/edpa)
> This hub pack syncs content from the standalone EDPA repository, which includes a Python CLI engine, GitHub Actions, worked examples, tests, and full English documentation.

## Skills

- `edpa-setup` — Initialize EDPA governance for a project
- `edpa-engine` — Run evidence-driven calculation for an iteration
- `edpa-reports` — Generate timesheets, exports, and snapshots
- `edpa-autocalib` — Auto-calibrate CW heuristics

## Commands

- `/edpa setup` — Initialize governance
- `/edpa close-iteration` — Close iteration (engine + reports)
- `/edpa reports` — Generate reports
- `/edpa calibrate` — Auto-calibrate heuristics

## Sync

This pack is synced from [technomaton/edpa](https://github.com/technomaton/edpa). To update:

```bash
# From hub root
scripts/sync-edpa.sh
```

## Documentation

Full documentation is in the [standalone repo](https://github.com/technomaton/edpa/tree/main/docs):
- [Methodology (EN)](https://github.com/technomaton/edpa/blob/main/docs/methodology.md)
- [Quick Start](https://github.com/technomaton/edpa/blob/main/docs/quick-start.md)
- [FAQ](https://github.com/technomaton/edpa/blob/main/docs/faq.md)

See references/ for the original Czech methodology documentation.
