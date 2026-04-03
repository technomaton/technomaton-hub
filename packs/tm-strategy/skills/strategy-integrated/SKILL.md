---
name: strategy-integrated
description: >
  Integrated strategic assessment combining VUCA Skills (qualitative lens — HOW)
  with AI PMF Playbook (strategic lens — WHAT). Orchestrates both frameworks
  simultaneously for comprehensive product and communication evaluation.
  Use when you need both perspectives: how well you communicate/design AND
  what you're building/for whom/what moat.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Agent
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  domain: strategy
  composed-from:
    - pack: tm-vuca/vuca-assessment
    - pack: tm-pmf/pmf-assessment
---

# Strategy Integrated — VUCA + PMF Orchestration

## When This Skill Activates

Trigger on keywords or intent matching:
- "strategy audit"
- "full assessment"
- "VUCA + PMF"
- "integrated analysis"
- "strategic evaluation"
- "comprehensive assessment"
- Any request that asks for both communication/design quality AND product-market fit analysis simultaneously

## What It Does

This meta-skill composes two independent frameworks into a single integrated assessment:

1. **VUCA Skills** (qualitative lens — HOW): Evaluates communication clarity, decision-making structure, perspective diversity, and collaboration quality. Scores 0-20 across 4 dimensions.
2. **AI PMF Playbook** (strategic lens — WHAT): Evaluates market opportunity, product design, competitive moat, and metrics rigor. Produces structured PMF stage assessment.

Neither framework alone gives the full picture. A product can have strong PMF signals but terrible communication (scaling will stall). Or it can have excellent VUCA scores but be solving the wrong problem (no market).

## Cross-Framework Integration Matrix

| VUCA Dimension | PMF Framework | Integration Signal |
|---|---|---|
| Kontext (Context) | Market analysis, Invisible Pain, Competition Readiness | Low Context + narrow market view = blind spots |
| Rozhodování (Decision) | 4D Method, Autonomy Staircase, Go/No-Go | Low Decision + no 4D structure = premature scaling |
| Perspektivy (Perspectives) | User research, Dual Metrics, Case Studies | Low Perspectives + single metric = false PMF |
| Kolaborace (Collaboration) | Trust engineering, Workflow Moats, AI UX | Low Collaboration + no trust layer = scaling churn |

### How to read the matrix

Each row identifies a risk amplification pattern. When both the VUCA dimension and the corresponding PMF framework area score low, the risk in the "Integration Signal" column becomes acute. A single low score is a warning; both low is a critical finding that should appear in the top recommendations.

## Routing

This skill dispatches to the `@strategy-conductor` agent, which handles parallel orchestration of both sub-frameworks and synthesis of results.

When invoked:
1. Pass the user's target (product, initiative, artifact) to `@strategy-conductor`
2. The conductor dispatches to `@vuca-conductor` and `@pmf-conductor` in parallel
3. Results are synthesized through the Integration Matrix
4. A combined scorecard is returned

## Output Format

The integrated assessment produces:

### Combined Scorecard

1. **VUCA Scorecard** (0-20 total)
   - Kontext: 0-5
   - Rozhodování: 0-5
   - Perspektivy: 0-5
   - Kolaborace: 0-5

2. **PMF Scorecard**
   - Opportunity strength
   - Product design quality
   - Moat durability
   - Metrics maturity

3. **Integration Matrix Findings**
   - Risk amplification patterns identified (from the matrix above)
   - Cross-framework contradictions (e.g., high VUCA but weak PMF)
   - Reinforcing strengths

4. **Top 5 Prioritized Recommendations**
   - Ordered by impact, drawing from both frameworks
   - Each recommendation tagged with source framework (VUCA/PMF/both)

Default language: Czech. Switch to English if the user writes in English.
