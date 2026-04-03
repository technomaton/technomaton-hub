---
description: "Run a VUCA audit using the multi-agent system. Dispatches @vuca-conductor which orchestrates 4 specialist subagents in parallel."
allowed-tools: Read, Write, Grep, Glob, Agent
model: opus
---

Run a VUCA audit on the file or directory specified in $ARGUMENTS.

Invoke @vuca-conductor with this task:

"Perform a full VUCA audit on: $ARGUMENTS

Read the target, then dispatch all four specialist subagents in parallel:
- @vuca-collaboration for Dimension 1
- @vuca-perspectives for Dimension 2
- @vuca-context for Dimension 3
- @vuca-decision for Dimension 4

Synthesize their results into a single audit report with aggregate scores, top recommendations, and a micro-VCoL exercise for the weakest dimension.

Update your memory with the audit result."
