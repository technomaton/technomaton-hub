---
name: document-workflow
description: >
  Use when creating professional documents — orchestrates collaborative
  authoring, formatting into Word/PDF/PowerPoint, and brand styling using
  vendored Anthropic example-skills.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Write Grep Glob Bash
disable-model-invocation: true
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  composed-from:
    - vendor: example-skills/doc-coauthoring
    - vendor: example-skills/docx
    - vendor: example-skills/pdf
    - vendor: example-skills/pptx
    - vendor: example-skills/xlsx
    - vendor: example-skills/brand-guidelines
    - vendor: example-skills/internal-comms
---

# Document Workflow

Orchestrates professional document creation by combining coauthoring workflow,
document formatting, and brand identity skills.

## When to Use

- Creating business proposals, specs, reports, or presentations
- Writing internal communications (status updates, newsletters)
- Producing branded documents with consistent visual identity
- Generating financial reports or data-driven spreadsheets

## Phase 1: Content Creation

Choose the appropriate starting skill based on document type:

### For structured documents (specs, proposals, decision docs)
Invoke example-skills:doc-coauthoring. Follow its workflow:
1. Context transfer — share existing knowledge and constraints
2. Iterative refinement — review and improve content
3. Reader verification — ensure document works for its audience

### For internal communications (status reports, newsletters, FAQs)
Invoke example-skills:internal-comms. Use the appropriate template:
- 3P updates (Progress, Plans, Problems)
- Company newsletters
- Incident reports
- Project updates

**Exit condition:** Content approved by user.

## Phase 2: Formatting

Choose the output format based on need:

| Need | Skill | Output |
|------|-------|--------|
| Contracts, reports | example-skills:docx | .docx |
| Invoices, printable | example-skills:pdf | .pdf |
| Presentations, pitches | example-skills:pptx | .pptx |
| Financial data, analysis | example-skills:xlsx | .xlsx |

**Exit condition:** Document formatted in target format.

## Phase 3: Brand Styling (optional)

If the document should follow TECHNOMATON brand identity:

Invoke example-skills:brand-guidelines to apply:
- Company colors and typography
- Logo placement
- Visual consistency standards

**Exit condition:** Branded document ready for distribution.
