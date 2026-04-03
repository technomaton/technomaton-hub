---
description: "Combined VUCA + PMF strategic assessment using both framework systems in parallel"
allowed-tools: Read, Write, Grep, Glob, Agent
model: opus
---

# /strategy/audit

Run a full integrated strategic assessment on the target specified in $ARGUMENTS.

Invoke `@strategy-conductor` to dispatch both `@vuca-conductor` and `@pmf-conductor` in parallel. The conductor will analyze the target from both frameworks simultaneously and synthesize results through the Integration Matrix.

## Expected Output

1. **VUCA Scorecard** — 4 dimensions (Contextual Thinking, Decision-Making Process, Perspective Coordination, Collaborative Capacity), each 0-5, total 0-20
2. **PMF Scorecard** — Opportunity strength, Product design quality, Moat durability, Metrics maturity
3. **Integration Matrix Findings** — Risk amplification patterns where weaknesses in one framework compound weaknesses in the other
4. **Top 5 Prioritized Recommendations** — Ordered by impact, drawing from both frameworks, each tagged with source (VUCA/PMF/both)

If $ARGUMENTS is empty, ask the user what product, initiative, or artifact to assess.
