---
name: commit-policy
description: Check last commit message against Conventional Commits; suggest a compliant rewrite if needed.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Bash(git:*)
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
---
# Commit Policy
Validate last commit subject; output OK or WARN + fixed subject.
