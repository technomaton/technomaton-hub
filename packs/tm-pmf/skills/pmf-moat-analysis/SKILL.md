---
name: pmf-moat-analysis
description: >
  Analyze and strengthen an AI product's competitive moats. Evaluates across 5 moat
  types (Data, Behavioral, Workflow, Distribution, Trust), identifies vulnerabilities,
  and recommends moat construction strategies. Use when assessing defensibility,
  planning competitive strategy, or evaluating acquisition targets.
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

# PMF Moat Analysis

Evaluate and strengthen competitive moats for AI products.

## When to use

- Assessing "can this be cloned overnight?"
- Planning long-term competitive strategy
- Evaluating whether you're feature-first or pain-first
- Reviewing moat strength before fundraising or scaling

## Process

1. Read `AI_PMF_MOATS.md` from `../pmf-assessment/` for the moat taxonomy
2. Read `CASE_STUDIES.md` from `../pmf-opportunity/` for comparable moat strategies
3. Evaluate the product across all 5 moat types
4. Identify the bootstrap strategy (workflow first → data later)
5. Match to case study moat patterns
6. Recommend moat construction priorities

## Output format

```
## Moat Analysis: [Product Name]

### Moat Scorecard
| Moat Type | Present? | Strength (0-5) | Evidence |
|-----------|----------|----------------|----------|
| Data | | | |
| Behavioral | | | |
| Workflow | | | |
| Distribution | | | |
| Trust | | | |
| **Total** | | **X/25** | |

### Vulnerability Assessment
- **Clone risk:** [High/Medium/Low] — [which parts are cloneable]
- **Feature-first vs Pain-first:** [which are you?]
- **Commoditization timeline:** [how long before differentiation erodes]

### Moat Construction Priority
1. [Which moat to build first and why]
2. [Second priority]

### Comparable Case Studies
- [Company]: [relevant moat lesson]

### AI Growth Framework Assessment
- Data Network Effects: [present/absent, strength]
- Intelligence Moats: [present/absent, strength]
- Trust Compounding: [present/absent, strength]
```
