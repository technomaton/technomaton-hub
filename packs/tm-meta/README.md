# tm-meta

Meta-workflows that orchestrate skills from internal TECHNOMATON packs and vendored external sources (superpowers, Anthropic example-skills).

## Skills

| Skill | Description |
|-------|-------------|
| full-dev-workflow | End-to-end: brainstorming, governance, TDD, review |
| document-workflow | Document creation: coauthoring, formatting, branding |
| secure-dev-workflow | Security-first: threat modeling, secure implementation, audit |

## External Sources

This pack orchestrates skills from vendored external sources:
- **superpowers** (obra/superpowers) — brainstorming, TDD, debugging, planning
- **example-skills** (anthropics/skills) — docx, pdf, pptx, xlsx, internal-comms, brand-guidelines

See `vendor/` and `imports.lock` for version details.
