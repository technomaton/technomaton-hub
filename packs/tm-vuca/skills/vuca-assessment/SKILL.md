---
name: vuca-assessment
description: >
  VUCA framework knowledge base and auto-trigger for VUCA audits. When user
  mentions VUCA, complexity gap, skills audit, balance analysis, or agent
  evaluation — routes to @vuca-conductor agent for multi-agent assessment.
  Contains complete VUCA hierarchy (4 mega-skills, 16 macro-skills, ~40
  mini-skills, 80+ micro-skills).
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Agent
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  domain: strategy
---

# VUCA Assessment Skill

This skill provides the VUCA framework knowledge base and routes to the appropriate agent.

## When this skill activates

Auto-trigger on keywords: "VUCA", "complexity gap", "audit skills", "vyváženost", "balance", "skill audit", "agent evaluation", "mikro-VCoL", "Lectical", "Dawson"

## What to do

1. Read `VUCA_FRAMEWORK.md` in this directory for the complete hierarchy
2. Route to the appropriate agent:
   - Full audit → `@vuca-conductor` (orchestrates all 4 specialist agents)
   - Single dimension focus → direct to specific agent (@vuca-collaboration, @vuca-perspectives, @vuca-context, @vuca-decision)
   - Just information about VUCA → answer from VUCA_FRAMEWORK.md directly
3. If no agent is needed (simple factual question), answer inline

## Quick reference

Four VUCA dimensions:
- **Kolaborace** (Collaborative Capacity) — audience adaptation, uncertainty, communication
- **Perspektivy** (Perspective Coordination) — multi-source, cross-validation, integration
- **Kontext** (Contextual Thinking) — situation, broader context, constraints, negative triggers
- **Rozhodování** (Decision-Making Process) — framing, goals, alternatives, verification

VCoL cycle: Goal → Gather → Apply → Reflect → (new goal)

Scoring: 0-5 per dimension, 0-20 total. Target: ≥ 14/20, no dimension below 2.
