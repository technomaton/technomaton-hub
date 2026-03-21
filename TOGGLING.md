# Toggling & Team Profiles

## Per-pack control

```bash
/plugin enable technomaton-infra@technomaton-hub
/plugin disable technomaton-growth@technomaton-hub
```

## Team defaults in `.claude/settings.json`

```json
{
  "extraKnownMarketplaces": {
    "technomaton-hub": {
      "source": { "source": "path", "path": "./technomaton-hub/.claude-plugin/marketplace.json" }
    }
  },
  "enabledPlugins": {
    "technomaton-dx@technomaton-hub": "enabled",
    "technomaton-docs@technomaton-hub": "enabled",
    "technomaton-github@technomaton-hub": "enabled",
    "technomaton-secure@technomaton-hub": "enabled",
    "technomaton-infra@technomaton-hub": "enabled",
    "technomaton-governance@technomaton-hub": "enabled",
    "technomaton-agents@technomaton-hub": "disabled"
  }
}
```

## Suggested profiles

**Core developer:** dx, docs, secure, github
**Platform engineer:** dx, infra, ops, secure
**Growth team:** growth, business
**Project governance:** governance, dx, docs
**Full stack:** all community packs enabled
