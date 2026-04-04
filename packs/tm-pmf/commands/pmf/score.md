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

Compute the composite score (Pain + Frequency + AI Advantage, range 3-30) and classify into the appropriate zone:
- **PMF Zone** (score 22-30): Strong product-market fit signal — move to Design phase
- **Promising** (score 18-21): Worth validating with 10 user conversations
- **Gray Zone** (score 12-17): Narrow the use case and rescore
- **Skip** (score < 12): Not worth pursuing

Output a concise markdown table with scores, zone classification, and a one-line recommendation.

This is the lightweight quick-check — no full audit needed.

Default output language is Czech. If the user writes in English, respond in English.
