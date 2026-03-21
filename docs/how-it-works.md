# How Technomaton Hub Works

## What It Is

Hub is a **mono-repo marketplace** for Claude Code. It works as an internal "app store" — teams enable the packs they need and get skills, commands, agents, and hooks directly in Claude Code.

```
Hub (marketplace.json) -> Pack (plugin.json) -> Skills / Commands / Agents / Hooks
                                                    |
                                            Claude Code loads and uses them
```

## 4 Types of Capabilities

| Type | What it is | How it's invoked | Example |
|------|-----------|------------------|---------|
| **Skill** | Knowledge workflow with steps and exit conditions | Claude invokes automatically or via meta-skill | `tm-dx/skills/pr-review` |
| **Command** | Direct user action | `/category/command` | `/docs/adr` |
| **Agent** | Specialized AI role with persistent context | `@agent-name` or via `/agents` | `@security-reviewer` |
| **Hook** | Automatic guardrail on tool use | Runs automatically | After Write/Edit -> format + tests |

### File Formats

**SKILL.md** (richest format):

```yaml
---
name: pr-review
description: Assist with reviewing diffs
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
---
# PR Review
Analyze changed hunks; propose inline comments and a short summary.
```

**Command .md** (simpler):

```yaml
---
description: Create ADR draft (MADR-like)
allowed-tools: Read, Write, Grep, Glob
model: haiku
---
# ADR Draft
Create architecture decision records...
```

**Agent .md** (role definition):

```yaml
---
name: product-manager
description: Product manager agent...
tools: Read, Write, Grep, Glob
model: inherit
license: MIT
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  domain: product
---
# Product Manager
## Role / ## Capabilities / ## When to Use / ## Output Format
```

**hooks.json** (automatic scripts):

```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Write|Edit",
      "hooks": [{ "type": "command", "command": "${CLAUDE_PLUGIN_ROOT}/scripts/format-code.sh" }]
    }]
  }
}
```

## How to Add the Hub to Your Project

### Variant A: Git Submodule (recommended for teams)

```bash
# 1. Add hub as submodule
git submodule add https://github.com/technomaton/technomaton-hub

# 2. Create .claude/settings.json in your project (commit to repo)
```

```json
{
  "extraKnownMarketplaces": {
    "technomaton-hub": {
      "source": {
        "source": "path",
        "path": "./technomaton-hub/.claude-plugin/marketplace.json"
      }
    }
  },
  "enabledPlugins": {
    "tm-dx@technomaton-hub": "enabled",
    "tm-docs@technomaton-hub": "enabled",
    "tm-secure@technomaton-hub": "enabled"
  }
}
```

```bash
# 3. Commit settings.json -> whole team gets the same packs
git add .claude/settings.json && git commit -m "chore: enable technomaton-hub packs"
```

### Variant B: Local Path (for solo/testing)

```bash
# In Claude Code:
/plugin marketplace add /path/to/technomaton-hub
/plugin install tm-dx@technomaton-hub
/plugin install tm-docs@technomaton-hub
```

### Variant C: Remote URL

```bash
/plugin marketplace add https://github.com/technomaton/technomaton-hub
```

### What Happens After Setup

1. User opens Claude Code in the project
2. Claude Code finds `.claude/settings.json` -> sees the marketplace
3. Loads `marketplace.json` -> knows which packs are enabled
4. For each enabled pack loads `plugin.json` -> knows about skills, commands, agents, hooks
5. Skills/commands/agents are available in the conversation
6. Hooks run automatically on matching tool use events

## Creating a New Pack

```bash
make new-pack
```

Interactive script asks for:
1. **Name** (without `tm-` prefix) -> creates `packs/tm-<name>/`
2. **Description** -> goes into plugin.json
3. **Tier** -> `community` (MIT) or `commercial` (Proprietary)

### Generated Structure

```
packs/tm-<name>/
├── .claude-plugin/plugin.json    <- manifest
├── .mcp.json                     <- MCP servers
├── hooks/hooks.json              <- hooks (empty)
├── skills/                       <- add SKILL.md here
├── commands/                     <- add commands here
├── agents/                       <- add agents here
├── README.md
├── CHANGELOG.md
└── LICENSE                       <- MIT or Proprietary
```

### After Adding Content

1. Add file (skill/command/agent) to the correct directory
2. Register path in `plugin.json` (skills/commands/agents array)
3. Update capabilities count in `.claude-plugin/marketplace.json`
4. Run `make validate` -> verify consistency
5. Commit

### Templates

Pre-built templates in `templates/`:
- `skill/SKILL.md.tmpl` — YAML frontmatter + body
- `command/command.md.tmpl` — simple command
- `agent/agent.md.tmpl` — role/capabilities/when to use
- `hook/hook-entry.json.tmpl` — hook entry

## Runtime — How Claude Code Uses Capabilities

### Skills

- Claude Code loads SKILL.md at session start
- A skill is **knowledge** — Claude has it "in mind" and uses it based on the `description` field
- Meta-skills orchestrate: "now invoke skill X" -> Claude switches to that workflow
- `allowed-tools` restricts which tools the skill can use

### Commands

- User types `/pr/review` -> Claude Code finds `commands/pr/review.md`
- The command .md content becomes the instruction for Claude
- `model` field determines which model is used (haiku = fast/cheap, opus = quality)

### Agents

- User types `@security-reviewer` -> Claude Code loads the agent .md
- The agent .md defines role, capabilities, output format
- Claude adopts the role and maintains it during interaction

### Hooks

- After each Write/Edit tool use, Claude Code runs scripts from hooks.json
- `PreToolUse` — before action (validation, blocking)
- `PostToolUse` — after action (formatting, tests)
- `${CLAUDE_PLUGIN_ROOT}` expands to the pack path

## Meta-Skills — Workflow Orchestration

Meta-skills in `tm-meta` combine skills from **different packs and vendors** into sequences:

### Example: `full-dev-workflow`

```
Phase 1: Design           -> superpowers:brainstorming        (vendored)
Phase 2: Capacity          -> tm-governance:edpa-setup         (internal)
Phase 3: Implementation    -> superpowers:test-driven-development (vendored)
Phase 4: Review            -> tm-dx:pr-review                  (internal)
Phase 5: Finishing         -> superpowers:finishing-a-dev-branch (vendored)
```

Each phase has an **exit condition** — once met, the workflow proceeds to the next phase.

### How composed-from Works

```yaml
metadata:
  composed-from:
    - vendor: superpowers/brainstorming        # from vendor/superpowers-v5.0.5/
    - pack: tm-governance/edpa-setup           # from packs/tm-governance/
    - pack: tm-dx/pr-review                    # from packs/tm-dx/
```

A meta-skill **does not import** sub-skills — it tells Claude "now invoke this skill." Claude finds it in the vendor or pack.

## Vendor System — External Skills

### Why Vendor?

- Protection against upstream deletion/breaking changes
- Offline functionality
- Version and quality control
- **Committed to git** — reproducible

### How to Import

```bash
make vendor-skill \
  source=https://github.com/obra/superpowers \
  version=v5.0.5 \
  skills="brainstorming,test-driven-development"
```

The script:
1. Clones the repo at the given tag/commit
2. Quality gate: license, frontmatter, repo activity
3. Copies skills into `vendor/<name>-<version>/`
4. Generates `_vendor.json` with metadata
5. Updates `imports.lock` with SHA-256 hashes
6. Updates `NOTICE` with attribution

### Current Vendors

| Source | Count | Examples |
|--------|-------|---------|
| superpowers v5.0.5 | 14 skills | brainstorming, TDD, debugging, planning |
| anthropics/skills | 17 skills | pdf, docx, pptx, frontend-design |
| workflows | 146 skills | from 33 plugins (accessibility, cloud, data...) |
| official-plugins | 345+43+90 | Vercel, Sentry, Notion, Figma... |

### Maintenance

```bash
make update-vendor name=superpowers version=v5.1.0   # update
make check-upstream                                    # check for changes (CI weekly)
make validate-vendor                                   # verify hashes
```

## Team Onboarding

### Step 1: Prepare settings.json

Commit `.claude/settings.json` into the project with selected packs:

```json
{
  "extraKnownMarketplaces": {
    "technomaton-hub": {
      "source": { "source": "path", "path": "./technomaton-hub/.claude-plugin/marketplace.json" }
    }
  },
  "enabledPlugins": {
    "tm-dx@technomaton-hub": "enabled",
    "tm-docs@technomaton-hub": "enabled",
    "tm-secure@technomaton-hub": "enabled",
    "tm-github@technomaton-hub": "enabled"
  }
}
```

### Step 2: Choose Profile by Role

| Role | Packs to enable |
|------|----------------|
| Core developer | dx, docs, secure, github |
| Platform engineer | dx, infra, ops, secure |
| Growth / marketing | growth, business |
| Governance / PM | governance, dx, docs, agents |
| Full stack | all community packs |

### Step 3: User Opens Claude Code

Nothing else needed. Claude Code:
- Finds settings.json
- Loads the marketplace
- Activates enabled packs
- Skills/commands/agents are immediately available

### Step 4: Personal Toggle (optional)

Each user can per-user enable/disable:

```bash
/plugin enable tm-agents@technomaton-hub
/plugin disable tm-growth@technomaton-hub
```

## Validation and Quality

```bash
make validate    # 10 checks:
```

1. marketplace.json exists
2. All pack manifests complete
3. SKILL.md frontmatter valid
4. Command frontmatter valid
5. Agent frontmatter valid
6. License consistency (tier <-> LICENSE file)
7. plugin.json capability arrays = files on disk
8. marketplace count = pack count
9. Vendor integrity (hashes, _vendor.json, NOTICE)
10. Export pipeline (dry-run)

## Export — Portability

```bash
make export
```

Strips Claude Code-specific fields (`allowed-tools`, `model`, `hooks`...) and generates universal SKILL.md into `dist/agentskills/`. These skills work in any AI agent, not just Claude Code.

CI/CD: dry-run on every push, full export on tag -> GitHub Release.

## Licensing

| Tier | License | Packs |
|------|---------|-------|
| community | MIT | dx, docs, secure, infra, github, growth, eaa, ops, data, ml, atlassian, governance, agents, meta |
| commercial | Proprietary | servicenow, public, business |

Validation checks that the LICENSE file in each pack matches its declared tier.

## Summary — Flow from Install to Usage

```
1. git submodule add technomaton-hub    (or /plugin marketplace add)
2. .claude/settings.json committed      (team-wide defaults)
3. User opens Claude Code               (packs load automatically)
4. /pr/review                           (command)
5. @security-reviewer                   (agent)
6. Claude invokes skills on its own     (skills + meta-skills)
7. Hooks run automatically              (format, tests, scanning)
```
