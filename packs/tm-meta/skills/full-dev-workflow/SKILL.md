---
name: full-dev-workflow
description: >
  Use when starting a new feature from scratch — orchestrates the complete
  development cycle from design through governance, implementation, and review
  using skills from multiple sources.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Bash
disable-model-invocation: true
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  composed-from:
    - vendor: superpowers/brainstorming
    - vendor: superpowers/test-driven-development
    - vendor: superpowers/systematic-debugging
    - pack: tm-governance/edpa-setup
    - pack: tm-dx/pr-review
    - pack: tm-dx/commit-policy
    - vendor: superpowers/finishing-a-development-branch
---

# Full Development Workflow

Orchestrates a complete development cycle by combining skills from internal
TECHNOMATON packs and vendored external sources.

## When to Use

- Starting a new feature or project from scratch
- Any work that needs design → planning → implementation → review flow
- When you want to ensure governance and quality gates are applied

## Phase 1: Design (superpowers:brainstorming)

Invoke the superpowers:brainstorming skill. Follow its complete workflow:

1. Explore project context — check files, docs, recent commits
2. Ask clarifying questions — one at a time, understand purpose/constraints
3. Propose 2-3 approaches with trade-offs and your recommendation
4. Present design sections for approval
5. Write design spec

**Exit condition:** Design spec approved by user.

## Phase 2: Capacity Planning (tm-governance:edpa-setup)

After design approval, invoke tm-governance:edpa-setup to:

1. Initialize EDPA configuration for the new feature
2. Set up capacity registry entries
3. Configure evidence detection rules
4. Establish reporting cadence

**Exit condition:** capacity.yaml configured and committed.

## Phase 3: Implementation (superpowers:test-driven-development)

Implement the approved design using strict TDD discipline:

1. **RED:** Write a failing test that describes the expected behavior
2. **GREEN:** Write minimal production code to make the test pass
3. **REFACTOR:** Clean up while keeping tests green

Use superpowers:writing-plans to break implementation into tasks.
Use superpowers:systematic-debugging if bugs are encountered.

**Exit condition:** All tests pass, implementation complete.

## Phase 4: Review (tm-dx:pr-review)

Before merging, invoke tm-dx:pr-review to:

1. Validate commit policy (conventional commits)
2. Run PR review checklist
3. Ensure documentation is updated
4. Verify test coverage

**Exit condition:** PR approved and merged.

## Phase 5: Finishing (superpowers:finishing-a-development-branch)

After PR review is approved, invoke superpowers:finishing-a-development-branch to:

1. Verify all tests pass on the feature branch
2. Present integration options (merge, squash, rebase)
3. Execute the chosen merge strategy
4. Clean up the feature branch

**Exit condition:** Branch merged and cleaned up.

## Error Handling

- If design is rejected → return to Phase 1
- If tests fail → use superpowers:systematic-debugging
- If review finds issues → fix and re-submit
