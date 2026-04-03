---
description: "10-100-1000 Validation Loop — determine stage and what to test next"
allowed-tools: Read, Grep, Glob
model: haiku
---

# Validation Stage Check

Determine the validation stage for the product specified in $ARGUMENTS.

Read `skills/pmf-assessment/AI_PMF_METRICS.md` from this pack for the 10-100-1000 framework.

Based on the user's description of current state, classify into one of:
- **10 conversations** — Problem clarity stage. Are you solving a real pain?
- **100 prototype interactions** — Reasoning stability stage. Does the AI behave reliably?
- **1,000 logs** — System reliability stage. Does it work at scale without breaking?
- **Post-1,000** — Scaling stage. Unit economics and growth loops.

For the identified stage, output:
1. **What to test** — The key question to answer at this stage
2. **Exit criteria** — What must be true to advance to the next stage
3. **Stress test recommendations** — How to push the boundaries
4. **What to measure** — Specific metrics to track

This is a lightweight check — no full audit needed.

Default output language is Czech. If the user writes in English, respond in English.
