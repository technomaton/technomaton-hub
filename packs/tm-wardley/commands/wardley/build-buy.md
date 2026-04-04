---
description: "Build vs Buy vs Outsource analysis for a component based on Wardley evolution stage"
allowed-tools: Read, Grep, Glob
model: sonnet
---

# Build vs Buy Analysis

Analyze the build-vs-buy-vs-outsource decision for the component or capability specified in $ARGUMENTS.

Read `skills/wardley-assessment/WARDLEY_CORE.md`, `skills/wardley-assessment/WARDLEY_PLAYS.md`, and `skills/wardley-assessment/WARDLEY_AI.md` to perform the analysis.

For the specified component:

1. **Determine evolution stage** using the Component Characteristics Table:
   - Genesis / Custom-Built / Product / Commodity
2. **Apply the positional play framework:**
   - Genesis/Custom-Built → Build (competitive advantage, differentiation)
   - Product → Buy (leverage existing, focus resources on differentiators)
   - Commodity → Outsource (minimize cost, no differentiation value)
3. **Check AI-specific guidance** from WARDLEY_AI.md Build vs Buy Decision Matrix if the component is AI-related
4. **Assess evolution trajectory** — if the component is about to shift stages, factor in timing:
   - Moving toward Product? Consider buying soon instead of building
   - Still firmly Custom-Built? Building is justified
5. **Evaluate switching cost** — how hard would it be to switch from build to buy later?
6. **Provide recommendation** with rationale, risks, and counter-arguments

If $ARGUMENTS is empty, ask the user what component or capability to analyze.

Default output language is Czech. If the user writes in English, respond in English.
