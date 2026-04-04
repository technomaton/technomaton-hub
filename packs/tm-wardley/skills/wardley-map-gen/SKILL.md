---
name: wardley-map-gen
description: >
  Generate Wardley Maps in OWM format from product or service descriptions.
  Constructs value chains, positions components on visibility and evolution axes,
  produces renderable map text. Use when asked to create, visualize, or iterate
  on a Wardley Map.
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

# Wardley Map Generation

This skill generates Wardley Maps in OWM (Online Wardley Maps) text format.

## When this skill activates

Auto-trigger on keywords: "wardley map", "generate map", "map the value chain", "OWM", "create wardley", "visualize value chain", "map components"

## What to do

1. Read the knowledge base files:
   - `skills/wardley-assessment/WARDLEY_CORE.md` — axes, components, positioning
   - `skills/wardley-assessment/WARDLEY_OWM.md` — OWM syntax, generation protocol, examples
2. Route to `@wardley-mapper` agent for map generation
3. For simple requests (fewer than 8 components), the mapper can handle inline
4. For complex requests (competitive landscape, multi-user perspectives), route through `@wardley-conductor`

## Output format

Produces:
1. Complete OWM text block (pasteable into OnlineWardleyMaps.com)
2. Positioning rationale table
3. Key strategic observations from the map
4. Evolution highlights (which components are moving)
