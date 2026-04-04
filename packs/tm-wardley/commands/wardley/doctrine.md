---
description: "Assess organizational doctrine adherence against Wardley's 40 universal principles"
allowed-tools: Read, Grep, Glob, Agent
model: opus
---

# Doctrine Assessment

Run a doctrine assessment on the organization, team, or product specified in $ARGUMENTS.

Invoke @wardley-doctrine to:

1. **Score all 40 doctrine principles** (0-4 each) across 4 categories:
   - Communication (10 principles)
   - Development (10 principles)
   - Operation (10 principles)
   - Learning (10 principles)
2. **Calculate aggregate score** (X/160) and classify:
   - 0-40: Critical
   - 41-80: Developing
   - 81-120: Competent
   - 121-160: Exemplary
3. **Identify weakest category** and top 5 violations
4. **Recommend priority improvements** with concrete actions

If $ARGUMENTS is empty, ask the user to describe the organization or team to assess.

Default output language is Czech. If the user writes in English, respond in English.
