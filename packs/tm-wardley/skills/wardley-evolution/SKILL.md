---
name: wardley-evolution
description: >
  Analyze component evolution trajectories and identify strategic movement
  patterns. Scans against 30 climatic patterns, detects inertia barriers,
  estimates evolution timing, and assesses ILC cycle positioning.
  Use when evaluating technology portfolio evolution, commoditization risk,
  build-vs-buy timing, or competitive timing.
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

# Wardley Evolution Analysis

This skill analyzes component evolution trajectories using Wardley's climatic patterns.

## When this skill activates

Auto-trigger on keywords: "evolution analysis", "commoditization risk", "evolution stage", "component evolution", "technology evolution", "build vs buy timing", "ILC cycle", "inertia", "climatic patterns"

## What to do

1. Read the knowledge base files:
   - `skills/wardley-assessment/WARDLEY_CLIMATE.md` — 30 climatic patterns and scanning protocol
   - `skills/wardley-assessment/WARDLEY_ILC.md` — Innovate-Leverage-Commoditize model
   - `skills/wardley-assessment/WARDLEY_CORE.md` — Component Characteristics Table for stage determination
   - `skills/wardley-assessment/WARDLEY_AI.md` — AI-specific evolution patterns (when analyzing AI components)
2. For focused component analysis → `@wardley-evolution` agent
3. For full portfolio evolution audit → route through `@wardley-conductor`
4. For simple evolution stage determination → answer inline using Component Characteristics Table

## Output format

Produces:
1. Component evolution table (stage, direction, speed, forces, inertia, timeline)
2. Climatic pattern matches with strategic implications
3. ILC cycle position assessment
4. Top evolution risks and opportunities
5. Commoditization timeline summary
