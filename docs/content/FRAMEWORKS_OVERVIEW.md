# TECHNOMATON Hub — Framework Overview

> Single-page reference for all frameworks in the hub. Each pack is a self-contained plugin with its own knowledge base, agents, commands, and bibliography.

---

## Pack Index

| Pack | Domain | Framework | Primary Sources | License | Status |
|------|--------|-----------|-----------------|---------|--------|
| **tm-vuca** | Strategy (HOW) | VUCA Skills Framework | Dawson / Lectica / Fischer | CC-BY-4.0 (knowledge) + MIT (code) | Stable v1.1.0 |
| **tm-pmf** | Strategy (WHAT) | AI PMF Playbook | Miqdad Jaffer (OpenAI) | CC-BY-4.0 (knowledge) + MIT (code) | Stable v1.1.0 |
| **tm-strategy** | Meta-orchestration | Integration Matrix | Composite (VUCA + PMF) | MIT | Stable v1.0.0 |
| **tm-governance** | Governance | EDPA | Jaroslav Urbánek | MIT | Beta v1.0.0-beta |
| **tm-ml** | ML/AI Ops | RAG, MLOps, Prompt Eng. | — | MIT | Stable |
| **tm-dx** | Dev Experience | PR Review, Commit Policy | — | MIT | Stable |

---

## Framework Summaries

### tm-vuca — VUCA Skills Framework

Evaluates cognitive complexity and decision-making skills under VUCA (Volatility, Uncertainty, Complexity, Ambiguity) conditions. Based on Theo Dawson's research at Lectica, Inc. and Kurt Fischer's Dynamic Skill Theory. The framework maps 4 mega-skills (Collaborative Capacity, Perspective Coordination, Contextual Thinking, Decision-Making Process) into 16 macro-skills, ~40 mini-skills, and 80+ micro-skills. Skills are developed through micro-VCoLing (Virtuous Cycle of Learning) and measured on the Lectical Scale (levels 9-13 for adults). Empirical data from 4,296 LDMA assessments (2008-2024) shows improvement from baseline 41 to 55 after micro-VCoLing introduction.

**Knowledge files:** `VUCA_FRAMEWORK_EN.md`, `VUCA_FRAMEWORK_CS.md`, `VUCA_EMPIRICAL_DATA.md`, `VUCA_BIBLIOGRAPHY.md`
**Agents:** 5 (conductor + 4 dimension specialists)
**Commands:** `/vuca:audit`, `/vuca:portfolio`, `/vuca:redesign`

### tm-pmf — AI Product-Market Fit Playbook

Strategic assessment framework for AI products adapted from Miqdad Jaffer's (Product Lead, OpenAI) AI PMF framework ecosystem. Covers: opportunity scoring (Pain × Frequency × AI Advantage), product development (4D Method: Discover, Design, Develop, Deploy), defensibility (Five-Moat Taxonomy: Data, Behavioral, Workflow, Distribution, Trust), measurement (Dual Success Metrics), launch strategy (7 AI Launch Plays), and trust engineering (Trust Layer + 10 Psychological Triggers). Core insight: "PMF is now a subscription that companies have to keep renewing." (Elena Verna)

**Knowledge files:** `AI_PMF_CORE.md`, `AI_PMF_PRODUCT.md`, `AI_PMF_MOATS.md`, `AI_PMF_METRICS.md`, `AI_PMF_LAUNCH.md`, `AI_PMF_STRATEGY.md`, `AI_PMF_TRUST.md`, `AI_PMF_BIBLIOGRAPHY.md`, `CASE_STUDIES.md`
**Agents:** 5 (conductor + 4 domain specialists)
**Commands:** `/pmf:score`, `/pmf:audit`, `/pmf:moat`, `/pmf:launch-check`, `/pmf:invisible-pain`, `/pmf:validate`

### tm-strategy — Integration Matrix

Meta-orchestration layer that composes VUCA (qualitative lens — HOW you communicate and design) with PMF (strategic lens — WHAT you're building and for whom). Maps each VUCA dimension to corresponding PMF framework elements and identifies risk amplification patterns. When both a VUCA dimension and its corresponding PMF area score low, the risk becomes critical. Neither framework alone gives the full picture.

**Knowledge files:** `SKILL.md` (integration matrix embedded)
**Agents:** 1 (strategy-conductor dispatches to both VUCA and PMF conductors)
**Commands:** `/strategy:audit`, `/strategy:compass`

### tm-governance — EDPA (Evidence-Driven Proportional Allocation)

Derives team member hours from Git delivery evidence — zero timesheets required. Uses mathematical guarantees and Monte Carlo calibrated CW (Contribution Weight) heuristics. Maintained as a standalone repository at [github.com/technomaton/edpa](https://github.com/technomaton/edpa) with a Python CLI engine, GitHub Actions, MCP server, and full documentation. The hub pack syncs content from the standalone repo.

**Knowledge files:** `references/methodology-en.md`, `references/methodology.cs.md`, + 6 reference files
**Agents:** 5 (setup, engine, reports, autocalib, sync)
**Commands:** `/edpa setup`, `/edpa close-iteration`, `/edpa reports`, `/edpa calibrate`, `/edpa sync`

### tm-ml — ML/AI Infrastructure

Agent-based pack for ML operations, RAG indexing/evaluation, and prompt engineering. Provides specialist agents but no formal knowledge base — agents rely on external tools and context.

**Agents:** 3 (ai-researcher, ml-ops, prompt-engineer)
**Commands:** `/rag:index`, `/rag:evals`

### tm-dx — Developer Experience

Code quality and release management tools. PR review with structured feedback, commit policy enforcement, and release cutting. Includes vendored Superpowers v5.0.5 with 14 advanced DX skills.

**Skills:** 2 (commit-policy, pr-review)
**Commands:** `/pr-review`, `/release-cut`

---

## Cross-Pack Relationships

```
┌─────────────────────────────────────────────┐
│              tm-strategy                     │
│         Integration Matrix                   │
│      (meta-orchestration layer)              │
│                                              │
│   ┌──────────────┐  ┌──────────────┐        │
│   │   tm-vuca    │  │   tm-pmf     │        │
│   │  HOW lens    │  │  WHAT lens   │        │
│   │  (qualitat.) │  │  (strategic) │        │
│   └──────────────┘  └──────────────┘        │
└─────────────────────────────────────────────┘

┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│ tm-governance│  │    tm-ml     │  │    tm-dx     │
│   EDPA       │  │  ML/AI Ops   │  │   Dev Exp.   │
│ (governance) │  │  (tooling)   │  │  (tooling)   │
└──────────────┘  └──────────────┘  └──────────────┘
```

### Integration Points

| From | To | Relationship |
|------|-----|-------------|
| tm-strategy | tm-vuca | Dispatches to vuca-conductor for HOW assessment |
| tm-strategy | tm-pmf | Dispatches to pmf-conductor for WHAT assessment |
| tm-strategy | (synthesis) | Combines via Integration Matrix for risk amplification patterns |
| tm-governance | (standalone) | Syncs from github.com/technomaton/edpa |

---

## Bibliography Links

- **VUCA:** `packs/tm-vuca/skills/vuca-assessment/VUCA_BIBLIOGRAPHY.md`
- **PMF:** `packs/tm-pmf/skills/pmf-assessment/AI_PMF_BIBLIOGRAPHY.md`
- **EDPA:** `packs/tm-governance/references/`
