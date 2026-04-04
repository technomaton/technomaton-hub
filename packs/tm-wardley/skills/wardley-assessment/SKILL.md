---
name: wardley-assessment
description: >
  Full Wardley Mapping strategic assessment. Orchestrates map generation,
  evolution analysis, doctrine audit, and gameplay recommendations via
  multi-agent system. Routes to @wardley-conductor for comprehensive analysis.
  Use when evaluating strategic positioning, analyzing value chains,
  generating maps, assessing organizational doctrine, or planning
  build-vs-buy decisions.
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

# Wardley Assessment — Full Strategic Positioning Audit

This skill provides the Wardley Mapping framework knowledge base and routes to the appropriate agent.

## When this skill activates

Auto-trigger on keywords: "Wardley", "wardley map", "value chain", "evolution axis", "evolution stage", "doctrine assessment", "climatic patterns", "ILC", "Innovate Leverage Commoditize", "component evolution", "OWM", "build vs buy", "strategic positioning", "landscape analysis", "commoditization", "commoditize", "Genesis Custom Product Commodity"

## What to do

1. Read the knowledge base files in this directory:
   - `WARDLEY_CORE.md` — Two axes, components, value chain construction, movement, inertia, map reading protocol
   - `WARDLEY_DOCTRINE.md` — 40 doctrine principles in 4 categories, scoring rubric (0-4 each, 160 total)
   - `WARDLEY_CLIMATE.md` — 30 climatic patterns, scanning protocol, AI manifestations, pattern interactions
   - `WARDLEY_PLAYS.md` — 20 strategic plays (8 offensive, 6 defensive, 6 positional), AI-specific plays
   - `WARDLEY_ILC.md` — Innovate-Leverage-Commoditize model, AWS case study, AI ILC cycle
   - `WARDLEY_OWM.md` — OWM syntax reference for LLM map generation, 3 worked examples
   - `WARDLEY_AI.md` — AI stack evolution map, 6-layer model, wrapper trap, context layer defensibility
   - `WARDLEY_BIBLIOGRAPHY.md` — Source citations, file-to-source mapping, attribution
2. Route to the appropriate agent:
   - Full Wardley audit → `@wardley-conductor` (orchestrates all 4 specialists)
   - Map generation only → `@wardley-mapper`
   - Evolution analysis only → `@wardley-evolution`
   - Doctrine assessment only → `@wardley-doctrine`
   - Strategic gameplay only → `@wardley-gameplay`
   - Just information about a framework → answer from knowledge files directly
3. If no agent is needed (simple factual question), answer inline

## Quick reference

| Framework | File | Agent |
|-----------|------|-------|
| Two Axes (Visibility + Evolution) | WARDLEY_CORE.md | @wardley-mapper |
| Component Characteristics Table | WARDLEY_CORE.md | @wardley-mapper |
| Value Chain Construction | WARDLEY_CORE.md | @wardley-mapper |
| Movement & Inertia | WARDLEY_CORE.md | @wardley-evolution |
| Map Reading Protocol | WARDLEY_CORE.md | (inline) |
| OWM Syntax | WARDLEY_OWM.md | @wardley-mapper |
| LLM Map Generation Protocol | WARDLEY_OWM.md | @wardley-mapper |
| 40 Doctrine Principles | WARDLEY_DOCTRINE.md | @wardley-doctrine |
| Doctrine Scoring Rubric | WARDLEY_DOCTRINE.md | @wardley-doctrine |
| 30 Climatic Patterns | WARDLEY_CLIMATE.md | @wardley-evolution |
| Pattern Scanning Protocol | WARDLEY_CLIMATE.md | @wardley-evolution |
| AI Climatic Manifestations | WARDLEY_CLIMATE.md | @wardley-evolution |
| 8 Offensive Plays | WARDLEY_PLAYS.md | @wardley-gameplay |
| 6 Defensive Plays | WARDLEY_PLAYS.md | @wardley-gameplay |
| 6 Positional Plays | WARDLEY_PLAYS.md | @wardley-gameplay |
| Build vs Buy vs Outsource | WARDLEY_PLAYS.md | @wardley-gameplay |
| AI-Specific Plays | WARDLEY_PLAYS.md | @wardley-gameplay |
| ILC Model | WARDLEY_ILC.md | @wardley-evolution |
| ILC Assessment Protocol | WARDLEY_ILC.md | @wardley-evolution |
| AI ILC Cycle | WARDLEY_ILC.md | @wardley-gameplay |
| AI Stack Evolution Map | WARDLEY_AI.md | @wardley-gameplay |
| Wrapper Trap | WARDLEY_AI.md | @wardley-gameplay |
| Source Citations | WARDLEY_BIBLIOGRAPHY.md | (inline) |

## Output format

Full audit produces:
1. Wardley Map in OWM format (pasteable into OnlineWardleyMaps.com)
2. Evolution dynamics analysis (commoditization timelines, movement patterns)
3. Doctrine health score (X/160 with category breakdown)
4. Strategic gameplay recommendations (top 3 plays + build-vs-buy matrix)
5. Overall strategic position classification (Strong / Vulnerable / Critical)
6. Top 3 prioritized recommendations
