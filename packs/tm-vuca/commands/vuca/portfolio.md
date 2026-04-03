---
description: "Batch VUCA audit of all skills in a directory. Produces aggregate scores, identifies systemic patterns, and recommends portfolio-level improvements."
allowed-tools: Read, Write, Grep, Glob, Agent
model: opus
---

Run a portfolio VUCA audit on all SKILL.md files found in $ARGUMENTS (default: .claude/skills/).

Invoke @vuca-conductor with this task:

"Find all SKILL.md files in: $ARGUMENTS (default: .claude/skills/)

For each SKILL.md found:
1. Run a full 4-dimension audit (dispatch all specialist subagents)
2. Record scores in a summary table

After all audits complete:
1. Build aggregate table: | Skill | K | P | Ctx | R | Total |
2. Calculate portfolio averages per dimension
3. Identify systemic patterns (which dimension is consistently weakest?)
4. Identify top 3 skills needing redesign (lowest total scores)
5. Provide portfolio-level recommendations
6. Update your memory with the full portfolio snapshot"
