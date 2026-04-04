# Toggling & Team Onboarding

## Step 1: Prepare settings.json

Commit `.claude/settings.json` into your project with the team's default packs:

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

## Step 2: Choose Profile by Role

| Role | Packs to enable |
|------|----------------|
| Core developer | dx, docs, secure, github |
| Platform engineer | dx, infra, ops, secure |
| Growth / marketing | growth, business |
| Governance / PM | governance, dx, docs, agents |
| Full stack | all community packs |

## Step 3: User Opens Claude Code

Nothing else needed. Claude Code:
- Finds `settings.json`
- Loads the marketplace
- Activates enabled packs
- Skills/commands/agents are immediately available

## Step 4: Personal Toggle (optional)

Each user can per-user enable/disable packs:

```bash
/plugin enable tm-agents@technomaton-hub
/plugin disable tm-growth@technomaton-hub
```

## Full settings.json Example (all community packs)

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
    "tm-infra@technomaton-hub": "enabled",
    "tm-github@technomaton-hub": "enabled",
    "tm-growth@technomaton-hub": "enabled",
    "tm-eaa@technomaton-hub": "enabled",
    "tm-ops@technomaton-hub": "enabled",
    "tm-data@technomaton-hub": "enabled",
    "tm-ml@technomaton-hub": "enabled",
    "tm-atlassian@technomaton-hub": "enabled",
    "tm-edpa@technomaton-hub": "enabled",
    "tm-agents@technomaton-hub": "enabled",
    "tm-meta@technomaton-hub": "enabled"
  }
}
```
