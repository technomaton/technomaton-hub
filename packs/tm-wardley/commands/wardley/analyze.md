---
description: "Full Wardley Mapping strategic assessment using all framework dimensions via multi-agent system"
allowed-tools: Read, Write, Grep, Glob, Agent
model: opus
---

# Full Wardley Analysis

Run a comprehensive Wardley Mapping assessment on the product, service, or organization specified in $ARGUMENTS.

Invoke @wardley-conductor with the task to dispatch all four specialist agents in parallel:
- @wardley-mapper — generates OWM-format Wardley Map, positions components on both axes
- @wardley-evolution — analyzes evolution trajectories, climatic patterns, commoditization timelines
- @wardley-doctrine — scores 40 doctrine principles across 4 categories (X/160)
- @wardley-gameplay — recommends strategic plays, build-vs-buy decisions, ecosystem strategy

The conductor synthesizes outputs into a unified **Wardley Assessment Report** containing:
1. **Wardley Map** — complete OWM text (pasteable into OnlineWardleyMaps.com)
2. **Evolution Dynamics** — key movement patterns, commoditization risks, ILC cycle position
3. **Doctrine Health** — score X/160 with category breakdown and top violations
4. **Strategic Plays** — top 3 recommended plays with build-vs-buy matrix
5. **Overall Position** — Strong / Vulnerable / Critical classification
6. **Top 3 Recommendations** — prioritized next actions

Default output language is Czech. If the user writes in English, respond in English.
