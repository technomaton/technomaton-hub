---
name: pmf-opportunity
description: >
  Score an AI product opportunity using the Pain × Frequency × AI Advantage matrix.
  Identifies whether an idea is in the PMF zone, demo territory, or SaaS territory.
  Also discovers invisible pain points in target workflows. Use when evaluating new
  product ideas, pivoting, or assessing market opportunities.
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

# PMF Opportunity Scoring

Score an AI product opportunity and identify invisible pain points.

## When to use

- Evaluating a new product/feature idea
- Comparing multiple opportunity candidates
- Looking for hidden workflow friction in a market
- Deciding whether an AI approach is justified vs traditional software

## Process

1. Read `AI_PMF_CORE.md` from `../pmf-assessment/` for the scoring framework
2. Read `CASE_STUDIES.md` in this directory for comparable examples
3. Gather information about the target opportunity from user input
4. Score across three dimensions:

### Scoring

| Dimension | Question | Score 1-10 |
|-----------|----------|-----------|
| Pain | How costly is this problem if unsolved? (time, money, reputation, compliance) | __ |
| Frequency | How often does this occur? (daily=10, weekly=7, monthly=4, quarterly=2) | __ |
| AI Advantage | Does AI provide step-change improvement? (10x=10, 2-5x=6, marginal=3) | __ |

**Total: __/30**

### Zone classification:
- **≥21: PMF Zone** — High potential, proceed to 4D Method
- **15-20: Test Zone** — Promising but validate assumptions first
- **10-14: SaaS/Demo Territory** — Consider traditional software or pivot the angle
- **<10: Skip** — Pain, frequency, or AI advantage too low

5. Run the Invisible Pain Points discovery checklist
6. Match to closest case study from CASE_STUDIES.md
7. Provide recommendation with next steps

## Output format

```
## Opportunity Score: [Product/Idea Name]

| Dimension | Score | Rationale |
|-----------|-------|-----------|
| Pain | X/10 | [why] |
| Frequency | X/10 | [why] |
| AI Advantage | X/10 | [why] |
| **Total** | **X/30** | **[zone]** |

### Invisible Pain Points Found
- [pain point 1]
- [pain point 2]

### Closest Case Study Match
[Which of the 10 case studies is most comparable, and why]

### Recommendation
[Go / Test / Pivot / Skip] — [1-2 sentence rationale]

### Next Steps
1. [action]
2. [action]
```
