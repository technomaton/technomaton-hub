---
name: pmf-assessment
description: >
  Full AI Product-Market Fit assessment. Orchestrates evaluation across all PMF
  frameworks: opportunity scoring, product readiness, moat strength, metrics health,
  and launch readiness. Routes to @pmf-conductor agent for multi-specialist analysis.
  Use when evaluating a product idea, auditing an existing AI product, or preparing
  for launch/scaling decisions.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Agent
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  domain: strategy
---

# PMF Assessment — Full AI Product-Market Fit Audit

This skill provides the AI PMF framework knowledge base and routes to the appropriate agent.

## When this skill activates

Auto-trigger on keywords: "PMF", "product-market fit", "AI product", "moat analysis", "launch readiness", "opportunity scoring", "Pain Frequency AI Advantage"

## What to do

1. Read the knowledge base files in this directory:
   - `AI_PMF_CORE.md` — Paradox, Pain×Freq×AI matrix, Invisible Pain Points
   - `AI_PMF_PRODUCT.md` — 4D Method, Autonomy Staircase, 5 Layers, 6 UX Laws
   - `AI_PMF_MOATS.md` — Three-Moat Taxonomy, AI Growth Framework
   - `AI_PMF_METRICS.md` — Dual metrics, 7 Hidden Costs, 3 Pricing Models, 10-100-1000
   - `AI_PMF_LAUNCH.md` — Launch Strategy Canvas
2. Route to the appropriate agent:
   - Full PMF audit → `@pmf-conductor` (orchestrates all 4 specialists)
   - Opportunity scoring only → `@pmf-opportunity`
   - Product design guidance → `@pmf-product`
   - Moat analysis only → `@pmf-moat`
   - Metrics review → `@pmf-metrics`
   - Just information about a framework → answer from knowledge files directly
3. If no agent is needed (simple factual question), answer inline

## Quick reference

| Framework | File | Agent |
|-----------|------|-------|
| Pain × Freq × AI Advantage | AI_PMF_CORE.md | @pmf-opportunity |
| Invisible Pain Points | AI_PMF_CORE.md | @pmf-opportunity |
| 4D Method | AI_PMF_PRODUCT.md | @pmf-product |
| Autonomy Staircase | AI_PMF_PRODUCT.md | @pmf-product |
| Three-Moat Taxonomy | AI_PMF_MOATS.md | @pmf-moat |
| Dual Success Metrics | AI_PMF_METRICS.md | @pmf-metrics |
| Launch Strategy Canvas | AI_PMF_LAUNCH.md | @pmf-conductor |

## Output format

Full audit produces:
1. Pain × Frequency × AI Advantage score (X/30)
2. 4D Method stage assessment (which phase, exit criteria status)
3. Moat strength score (X/25)
4. Metrics health assessment
5. Launch readiness (Green/Yellow/Red per dimension)
6. Top 3 prioritized recommendations
