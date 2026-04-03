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

Auto-trigger on keywords: "PMF", "product-market fit", "AI product", "moat analysis", "launch readiness", "opportunity scoring", "Pain Frequency AI Advantage", "distribution strategy", "PLG loop", "pricing model", "unit economics", "AI PRD", "cost structure", "wedge", "flywheel"

## What to do

1. Read the knowledge base files in this directory:
   - `AI_PMF_CORE.md` — Paradox, Pain×Freq×AI matrix, Invisible Pain Points
   - `AI_PMF_PRODUCT.md` — 4D Method, Autonomy Staircase, 5 Layers, 6 UX Laws, Discovery Debt Log, FTCEM, CAIR Equation, Drift Management, 7 UX Traps
   - `AI_PMF_MOATS.md` — Five-Moat Taxonomy, AI Growth Framework, Adaptation Moat, Moat Flywheel
   - `AI_PMF_METRICS.md` — Dual metrics, 7 Hidden Costs, 10-100-1000
   - `AI_PMF_LAUNCH.md` — Launch Strategy Canvas, 7 AI Launch Plays, Three-Layer Launch Framework
   - `AI_PMF_STRATEGY.md` — 5-Question Pain Analysis, AI Positioning, AI Strategic Lens, 9 Shifts, Feasibility Checklist, 4D Strategy Framework, 7-Step Strategy Process, Founder's Playbook, 5 Silent Killers, 2Ps Framework
   - `AI_PMF_TRUST.md` — Trust Layer, 10 Psychological Triggers, Onboarding Psychology, Key Quotes Index
   - `AI_PMF_DISTRIBUTION.md` — 3-Layer Distribution System, 7 PLG Loops, 15 Distribution Plays, 6 Laws, Wedge Finder Canvas
   - `AI_PMF_PRICING.md` — 4 Pricing Models, 7-Layer Cost Structure, 9 Validation Tests, Unit Economics P&L, Cost Glossary
   - `AI_PMF_PRD.md` — 9-Section AI PRD Template, AI-Specific NFRs, Shopify Auto Write Case Study
   - `AI_PMF_BIBLIOGRAPHY.md` — Source citations with URLs, file-to-source mapping, quotes attribution
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
| 5-Question Pain Point Analysis | AI_PMF_STRATEGY.md | @pmf-opportunity |
| AI Positioning Template | AI_PMF_STRATEGY.md | @pmf-opportunity |
| 4D Method | AI_PMF_PRODUCT.md | @pmf-product |
| Autonomy Staircase | AI_PMF_PRODUCT.md | @pmf-product |
| Trust Layer | AI_PMF_TRUST.md | @pmf-product |
| 10 Psychological Triggers | AI_PMF_TRUST.md | @pmf-product |
| Five-Moat Taxonomy | AI_PMF_MOATS.md | @pmf-moat |
| Dual Success Metrics | AI_PMF_METRICS.md | @pmf-metrics |
| Launch Strategy Canvas | AI_PMF_LAUNCH.md | @pmf-conductor |
| 7 AI Launch Plays | AI_PMF_LAUNCH.md | @pmf-conductor |
| Three-Layer Launch Framework | AI_PMF_LAUNCH.md | @pmf-conductor |
| AI Strategic Lens | AI_PMF_STRATEGY.md | @pmf-conductor |
| 9 Shifts in AI PM | AI_PMF_STRATEGY.md | @pmf-conductor |
| AI Feasibility Checklist | AI_PMF_STRATEGY.md | @pmf-conductor |
| Key Quotes Index | AI_PMF_TRUST.md | (inline) |
| Onboarding Psychology | AI_PMF_TRUST.md | @pmf-product |
| Discovery Debt Log | AI_PMF_PRODUCT.md | @pmf-product |
| FTCEM Failure Framework | AI_PMF_PRODUCT.md | @pmf-product |
| CAIR Equation | AI_PMF_PRODUCT.md | @pmf-product |
| Drift Management Loop | AI_PMF_PRODUCT.md | @pmf-product |
| 7 UX Traps | AI_PMF_PRODUCT.md | @pmf-product |
| Adaptation Moat | AI_PMF_MOATS.md | @pmf-moat |
| Moat Flywheel | AI_PMF_MOATS.md | @pmf-moat |
| 4D Strategy Framework | AI_PMF_STRATEGY.md | @pmf-conductor |
| 7-Step Strategy Process | AI_PMF_STRATEGY.md | @pmf-conductor |
| Founder's Playbook | AI_PMF_STRATEGY.md | @pmf-conductor |
| 5 Silent Killers | AI_PMF_STRATEGY.md | @pmf-conductor |
| 2Ps Framework | AI_PMF_STRATEGY.md | @pmf-conductor |
| 3-Layer Distribution System | AI_PMF_DISTRIBUTION.md | @pmf-conductor |
| 15 Distribution Plays | AI_PMF_DISTRIBUTION.md | @pmf-conductor |
| 7 PLG Loops | AI_PMF_DISTRIBUTION.md | @pmf-conductor |
| Wedge Finder Canvas | AI_PMF_DISTRIBUTION.md | @pmf-conductor |
| 4 Pricing Models | AI_PMF_PRICING.md | @pmf-metrics |
| 7-Layer Cost Structure | AI_PMF_PRICING.md | @pmf-metrics |
| 9 Pricing Validation Tests | AI_PMF_PRICING.md | @pmf-metrics |
| Unit Economics P&L | AI_PMF_PRICING.md | @pmf-metrics |
| AI PRD Template | AI_PMF_PRD.md | @pmf-product |

## Output format

Full audit produces:
1. Pain × Frequency × AI Advantage score (X/30)
2. 4D Method stage assessment (which phase, exit criteria status)
3. Moat strength score (X/25)
4. Metrics health assessment
5. Launch readiness (Green/Yellow/Red per dimension)
6. Top 3 prioritized recommendations
