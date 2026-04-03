---
name: pmf-product-design
description: >
  Guide AI product development through the 4D Method (Discover, Design, Develop, Deploy).
  Determines current phase, evaluates exit criteria, identifies blockers, and provides
  phase-specific guidance including the Autonomy Staircase and AI UX laws.
  Use when planning or reviewing an AI product development process.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  domain: strategy
---

# PMF Product Design — 4D Method Guide

Guide AI product development through the four phases.

## When to use

- Starting an AI product from scratch (which phase am I in?)
- Reviewing progress (have I met exit criteria for current phase?)
- Stuck in development (what's blocking transition to next phase?)
- Designing AI architecture (what components do I need?)

## Process

1. Read `AI_PMF_PRODUCT.md` from `../pmf-assessment/` for the complete 4D framework
2. Determine the user's current phase based on their description
3. Evaluate exit criteria for the current phase
4. Provide phase-specific guidance
5. For Design phase: walk through all 5 design components
6. For Deploy phase: assess Autonomy Staircase level and apply 6 UX Laws

## Output format

```
## 4D Assessment: [Product Name]

### Current Phase: D[1-4] — [Phase Name]

### Exit Criteria Status
- [ ] [criterion 1] — [met/not met/partial]
- [ ] [criterion 2] — [met/not met/partial]

### Phase-Specific Assessment
[Detailed evaluation of current phase work]

### Blockers to Next Phase
1. [blocker]

### Autonomy Level: [1-4] — [Level Name]
[Current level assessment and progression criteria]

### Recommendations
1. [action to advance to next phase]
```
