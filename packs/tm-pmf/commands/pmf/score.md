---
description: "Quick Pain×Frequency×AI Advantage scoring for an AI product opportunity"
allowed-tools: Read, Grep, Glob
model: haiku
---

# PMF Quick Score

Read `skills/pmf-assessment/AI_PMF_CORE.md` from this pack for the scoring framework.

Score the product or idea described in $ARGUMENTS across three dimensions:
- **Pain** (1-10): How severe is the problem?
- **Frequency** (1-10): How often does the user encounter it?
- **AI Advantage** (1-10): How much better is AI vs. traditional solutions?

Compute the composite score (Pain × Frequency × AI Advantage) and classify into the appropriate zone:
- **PMF Zone** (score ≥ 500): Strong product-market fit signal
- **Test Zone** (200-499): Worth testing with users
- **SaaS Zone** (100-199): Traditional SaaS territory, AI adds marginal value
- **Demo Zone** (50-99): Impressive demo, weak daily use case
- **Skip Zone** (< 50): Move on

Output a concise markdown table with scores, zone classification, and a one-line recommendation.

This is the lightweight quick-check — no full audit needed.

Default output language is Czech. If the user writes in English, respond in English.
