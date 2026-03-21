# Pack Boundaries

## Core Rule

Every pack owns exactly one domain. Commands, skills, and agents must not duplicate functionality that belongs to another pack.

## Boundary Matrix

| Domain | Owner Pack | Examples |
|--------|-----------|----------|
| PR review, release, DX guardrails | tm-dx | `/pr-review`, `/release-cut` |
| Documentation (ADR, changelog, readme) | tm-docs | `/adr`, `/changelog`, `/readme` |
| Security scanning, compliance, policy | tm-secure | `/secrets`, `/dependencies`, `/branch-policy` |
| Infrastructure (Azure, Terraform) | tm-infra | `/infra-plan`, `/afd`, `/private-link` |
| GitHub MCP utilities | tm-github | `/pr-status`, `/release-notes`, `/dependabot` |
| Growth, sales, marketing | tm-growth | `/icp`, `/post`, `/sequence`, `/brief` |
| Accessibility (EAA) | tm-eaa | `/checklist`, `/test-plan`, `/procurement` |
| Observability, ops, incidents | tm-ops | `/incident`, `/postmortem`, `/runbook` |
| Data & analytics | tm-data | data quality, data engineering agents |
| ML & AI (RAG, MLOps) | tm-ml | `/rag-evals`, `/rag-index`, ml-ops agent |
| Atlassian (Jira, Confluence) | tm-atlassian | `/jira-create-bug` |
| ServiceNow (ITSM) | tm-servicenow | `/snow-incident` |
| Public sector (tenders, grants) | tm-public | `/tender-checklist` |
| Finance & legal | tm-business | `/forecast`, `/redline` |
| EDPA governance | tm-governance | capacity, evidence, reporting |
| Cross-cutting agents | tm-agents | product, discovery, prompt, research |
| Meta-workflows (orchestration) | tm-meta | full-dev-workflow, secure-dev-workflow |

## Agent Distribution Policy

- **Domain-specific agents** belong in the domain pack when they require domain-specific knowledge (e.g., `security-reviewer` in tm-secure, `data-analyst` in tm-data, `ml-ops` in tm-ml).
- **Cross-cutting agents** that serve general purposes across domains belong in tm-agents (e.g., `product-manager`, `discovery-agent`, `prompt-engineer`, `research-agent`).

## tm-secure Agent Scopes

| Agent | Scope |
|-------|-------|
| security-reviewer | Code-level security review (OWASP, injection, auth) |
| compliance-officer | Compliance frameworks (SOC2, ISO 27001, GDPR mapping) |
| dpo | Personal data protection, DPIA, data subject rights |
| risk-analyst | Threat modeling, risk assessment, mitigation strategies |

## Resolving Overlaps

When a new command or agent could belong to multiple packs:

1. Identify which pack's domain is the **primary concern**
2. If the feature requires domain-specific knowledge, place it in the domain pack
3. If the feature is cross-cutting, prefer the most specific pack
4. Document the decision if it's not obvious
