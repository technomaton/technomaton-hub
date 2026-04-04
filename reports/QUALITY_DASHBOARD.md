# Quality Dashboard

> Auto-generated — do not edit manually.
> Run `make quality-dashboard` to regenerate.

**Generated:** 2026-04-04

## Pack Health Summary

| Pack | Score | Grade | Structural | Content | Coverage | Readiness |
|------|-------|-------|-----------|---------|----------|-----------|
| tm-pmf | **100** | healthy | 100 | 100 | 100 | 100 |
| tm-strategy | **100** | healthy | 100 | 100 | 100 | 100 |
| tm-vuca | **100** | healthy | 100 | 100 | 100 | 100 |
| tm-wardley | **100** | healthy | 100 | 100 | 100 | 100 |

## Scoring Methodology

| Dimension | Weight | What it measures |
|-----------|--------|-----------------|
| Structural | 20% | File existence, frontmatter completeness, manifest validity |
| Content Consistency | 35% | Agent reference validity, scoring scale alignment, taxonomy naming |
| Knowledge Coverage | 25% | Bibliography mapping, agent knowledge file references |
| Agent Readiness | 20% | Tools declared, output format specified, usage guidance present |

**Grades:** healthy (90+), attention (70-89), warning (50-69), critical (<50)

## How to Improve

Run `make test` to see specific failures, then fix the reported issues.
Run `make quality` to recalculate scores after fixes.
