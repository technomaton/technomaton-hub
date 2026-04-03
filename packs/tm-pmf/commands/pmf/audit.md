---
description: "Full AI PMF assessment using all framework dimensions via multi-agent system"
allowed-tools: Read, Write, Grep, Glob, Agent
model: sonnet
---

# Full PMF Audit

Run a comprehensive PMF audit on the product or idea specified in $ARGUMENTS.

Invoke @pmf-conductor with the task to dispatch all four specialist agents in parallel:
- @pmf-opportunity — Pain×Frequency×AI Advantage scoring and opportunity classification
- @pmf-moat — Three-Moat Taxonomy analysis and competitive defensibility
- @pmf-metrics — 10-100-1000 validation stage and metrics health
- @pmf-launch — Launch Strategy Canvas and readiness assessment

The conductor synthesizes outputs into a unified **PMF Assessment Report** containing:
1. **Opportunity Score** — composite Pain×Frequency×AI Advantage with zone classification
2. **4D Phase** — current position on the PMF journey
3. **Moat Strength** — defensibility rating and top moat priorities
4. **Metrics Health** — current validation stage and key indicators
5. **Launch Readiness** — Go/No-Go across all four canvas dimensions
6. **Top 3 Recommendations** — prioritized next actions

Default output language is Czech. If the user writes in English, respond in English.
