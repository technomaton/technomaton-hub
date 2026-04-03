---
description: "Audit and redesign a file with VUCA-balanced structure. Runs full audit first, then improves weakest dimensions and verifies improvement."
allowed-tools: Read, Write, Bash
model: sonnet
---

Redesign the file specified in $ARGUMENTS with VUCA-balanced structure.

Invoke @vuca-conductor with this task:

"Perform a full VUCA audit on: $ARGUMENTS

After the audit:
1. Identify all dimensions scoring below 3/5
2. For each weak dimension, propose specific textual additions
3. Rewrite the target file with improvements integrated
4. Run a second audit on the rewritten version to verify improvement
5. Present: original scores → changes made → new scores
6. Update your memory with both audit results (before/after)"
