# tm-wardley — Wardley Mapping

Positional strategy via value chain evolution analysis. Based on Simon Wardley's mapping methodology.

## What It Does

Maps products, services, and organizations on two axes:
- **Y-axis (Visibility):** Position in the value chain from user need (top) to infrastructure (bottom)
- **X-axis (Evolution):** Stage from Genesis → Custom-Built → Product → Commodity

Identifies movement patterns, strategic plays, and build-vs-buy boundaries.

## Commands

| Command | Description |
|---------|-------------|
| `/wardley:map [product]` | Generate a Wardley Map in OWM format |
| `/wardley:analyze [product]` | Full strategic positioning audit (4 agents) |
| `/wardley:doctrine [org]` | Doctrine assessment (40 principles, score X/160) |
| `/wardley:evolve [component]` | Evolution trajectory and commoditization risk |
| `/wardley:build-buy [component]` | Build vs Buy vs Outsource analysis |
| `/wardley:landscape [market]` | Competitive landscape map |

## Agents

| Agent | Role |
|-------|------|
| `@wardley-conductor` | Orchestrates all 4 specialists for full audits |
| `@wardley-mapper` | Generates OWM-format Wardley Maps |
| `@wardley-evolution` | Analyzes evolution trajectories and climatic patterns |
| `@wardley-doctrine` | Assesses 40 doctrine principles |
| `@wardley-gameplay` | Recommends strategic plays and build-vs-buy |

## Knowledge Base

| File | Content |
|------|---------|
| `WARDLEY_CORE.md` | Two axes, components, value chain, movement, inertia |
| `WARDLEY_DOCTRINE.md` | 40 principles in 4 categories, scoring 0-4 |
| `WARDLEY_CLIMATE.md` | 30 climatic patterns with signals and implications |
| `WARDLEY_PLAYS.md` | 20 strategic plays (offensive/defensive/positional) |
| `WARDLEY_ILC.md` | Innovate-Leverage-Commoditize model |
| `WARDLEY_OWM.md` | OWM syntax for LLM map generation |
| `WARDLEY_AI.md` | AI stack evolution, wrapper trap, context defensibility |
| `WARDLEY_BIBLIOGRAPHY.md` | Sources and attribution |

## Integration

- **Standalone:** Fully functional independent of other packs
- **tm-strategy:** Adds "WHERE" lens to HOW (VUCA) + WHAT (PMF) integration
- **tm-edpa:** Evolution-aware capacity allocation via EDPA
- **tm-ml:** ML infrastructure build-vs-buy guidance

## License

MIT — see [LICENSE](LICENSE)

## Attribution

Based on Simon Wardley's work (CC-BY-SA-4.0). See [NOTICE](NOTICE) for full attribution.
