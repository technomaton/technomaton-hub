---
name: strategy-integrated
description: >
  Integrated strategic assessment combining VUCA Skills (qualitative lens — HOW),
  AI PMF Playbook (strategic lens — WHAT), and Wardley Mapping (positional lens — WHERE).
  Orchestrates three frameworks simultaneously for comprehensive product, communication,
  and strategic positioning evaluation. Use when you need all perspectives: how well you
  communicate/design AND what you're building/for whom/what moat AND where it sits in the
  value chain and how it will evolve.
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
    - pack: tm-wardley/wardley-assessment
---

# Strategy Integrated — VUCA + PMF Orchestration

## When This Skill Activates

Trigger on keywords or intent matching:
- "strategy audit"
- "full assessment"
- "VUCA + PMF"
- "VUCA + PMF + Wardley"
- "integrated analysis"
- "strategic positioning"
- "value chain assessment"
- "strategic evaluation"
- "comprehensive assessment"
- Any request that asks for communication/design quality AND product-market fit AND/OR value chain positioning

## What It Does

This meta-skill composes three independent frameworks into a single integrated assessment:

1. **VUCA Skills** (qualitative lens — HOW): Evaluates communication clarity, decision-making structure, perspective diversity, and collaboration quality. Scores 0-20 across 4 dimensions.
2. **AI PMF Playbook** (strategic lens — WHAT): Evaluates market opportunity, product design, competitive moat, and metrics rigor. Produces structured PMF stage assessment.
3. **Wardley Mapping** (positional lens — WHERE): Evaluates value chain position, component evolution stage, doctrine health, and strategic plays. Produces strategic positioning audit with OWM map.

No single framework gives the full picture. A product can have strong PMF signals but terrible communication (scaling will stall). It can have excellent VUCA scores but be solving the wrong problem (no market). Or it can have both strong PMF and communication but be positioned on a commoditizing layer of the value chain (defensibility eroding).

## Cross-Framework Integration Matrix

| VUCA Dimension | PMF Framework | Wardley (WHERE) | Integration Signal |
|---|---|---|---|
| Contextual Thinking (Kontextuální myšlení) | Market analysis, Invisible Pain, Competition Readiness, AI Strategic Lens | Value chain visibility, climatic pattern recognition, ILC stage | Low Context + narrow market + misunderstood value chain = **strategic blind spot** |
| Decision-Making Process (Rozhodovací proces) | 4D Method, Autonomy Staircase, Go/No-Go, AI Feasibility Checklist | Build-vs-buy, movement patterns, inertia, doctrine alignment | Low Decision + no 4D structure + wrong build-vs-buy = **premature/misdirected scaling** |
| Perspective Coordination (Koordinace perspektiv) | User research, Dual Success Metrics, Case Studies, 5-Question Pain Point Analysis | Stakeholder positioning, climatic pattern signals, ecosystem mapping | Low Perspectives + single metric + missed climatic shifts = **false PMF** |
| Collaborative Capacity (Kolaborativní kapacita) | Trust engineering, Workflow Moats, Six Laws of AI UX, Trust Layer, 10 Psychological Triggers | Doctrine adherence, common language, strategic play consensus | Low Collaboration + no trust layer + no strategic alignment = **scaling churn** |

### How to read the matrix

Each row identifies a risk amplification pattern across three dimensions. When all three score low, the risk is critical. Two low is a compounding risk. One low is a remedial opportunity — the strong dimensions can compensate.

The Wardley column adds the positional lens: even with strong VUCA and PMF scores, building on a commoditizing value chain layer or ignoring climatic patterns creates strategic vulnerability that neither communication quality nor market fit can overcome.

## Routing

This skill dispatches to the `@strategy-conductor` agent, which handles parallel orchestration of all three frameworks and synthesis of results.

When invoked:
1. Pass the user's target (product, initiative, artifact) to `@strategy-conductor`
2. The conductor dispatches to `@vuca-conductor`, `@pmf-conductor`, and `@wardley-conductor` in parallel
3. Results are synthesized through the Three-Framework Integration Matrix
4. A combined scorecard with cross-framework risk amplification analysis is returned

## Output Format

The integrated assessment produces:

### Combined Scorecard

1. **VUCA Scorecard** (0-20 total)
   - Contextual Thinking (Kontextove mysleni): 0-5
   - Decision-Making Process (Rozhodovaci proces): 0-5
   - Perspective Coordination (Koordinace perspektiv): 0-5
   - Collaborative Capacity (Kolaborativni kapacita): 0-5

2. **PMF Scorecard**
   - Opportunity strength
   - Product design quality
   - Moat durability
   - Metrics maturity

3. **Wardley Scorecard**
   - Wardley Map in OWM format (pasteable into OnlineWardleyMaps.com)
   - Evolution dynamics (commoditization timelines, movement patterns)
   - Doctrine health (X/160 with category breakdown)
   - Strategic plays (top 3 recommended + build-vs-buy matrix)
   - Overall position: Strong / Vulnerable / Critical

4. **Three-Framework Integration Matrix Findings**
   - Risk amplification patterns identified (from the expanded matrix)
   - Cross-framework contradictions (e.g., high VUCA but weak PMF, strong PMF but value chain threat)
   - Reinforcing strengths across all three frameworks

5. **Top 5-7 Prioritized Recommendations**
   - Ordered by impact, drawing from all three frameworks
   - Each recommendation tagged with source framework (VUCA/PMF/Wardley/combination)
   - Priority given to items where multiple frameworks converge on the same weakness

Default language: English. Switch to Czech if the user writes in Czech.
