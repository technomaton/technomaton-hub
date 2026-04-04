---
description: "Generate a competitive landscape Wardley Map showing multiple players' positions in a market"
allowed-tools: Read, Grep, Glob, Agent
model: opus
---

# Competitive Landscape Map

Generate a competitive landscape Wardley Map for the market or industry specified in $ARGUMENTS.

Invoke @wardley-mapper and @wardley-evolution to:

1. **Map the shared value chain** — identify the common value chain for the market (user needs → capabilities → infrastructure)
2. **Position multiple players** — for each competitor, show where they position on the evolution axis at each value chain layer
3. **Identify differentiation points** — where do competitors diverge? Which layers do they own vs. consume as commodity?
4. **Analyze evolution dynamics** — which shared components are commoditizing? Where is the next innovation opportunity?
5. **Assess competitive vulnerability** — which players have differentiation at late-stage evolution (vulnerable) vs. early-stage (defensible)?

The output includes:
- OWM-format landscape map (pasteable into OnlineWardleyMaps.com)
- Competitor positioning comparison table
- Commoditization risk assessment for shared components
- Strategic opportunity identification (where in the value chain is the next advantage?)

If $ARGUMENTS is empty, ask the user what market or industry to map.

Default output language is Czech. If the user writes in English, respond in English.
