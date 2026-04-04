---
description: "Analyze evolution trajectory and commoditization risk for a component or technology"
allowed-tools: Read, Grep, Glob
model: sonnet
---

# Evolution Check

Analyze the evolution trajectory for the component or technology specified in $ARGUMENTS.

Read `skills/wardley-assessment/WARDLEY_CLIMATE.md` and `skills/wardley-assessment/WARDLEY_CORE.md` to perform the analysis.

For the specified component:

1. **Determine current evolution stage** using the Component Characteristics Table:
   - How many providers exist?
   - Is there a standard?
   - Could you buy this off the shelf?
   - Is the approach well-understood?
2. **Scan against climatic patterns** — which of the 30 patterns are actively affecting this component?
3. **Assess direction and speed** — is it moving toward Commodity? How fast?
4. **Identify inertia** — what resists evolution? (success, capital, political)
5. **Estimate timeline** for the next stage transition
6. **Strategic implication** — what should you do about it? (build, buy, outsource, invest, divest)

Output a focused analysis with: current stage, direction, speed, key forces, inertia, timeline estimate, and recommended action.

If $ARGUMENTS is empty, ask the user what component or technology to analyze.

Default output language is Czech. If the user writes in English, respond in English.
