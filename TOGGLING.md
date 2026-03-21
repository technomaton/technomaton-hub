# Toggling & Team Profiles

## Per-pack control

```bash
/plugin enable tm-infra@technomaton-hub
/plugin disable tm-growth@technomaton-hub
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
    "tm-dx@technomaton-hub": "enabled",
    "tm-docs@technomaton-hub": "enabled",
    "tm-github@technomaton-hub": "enabled",
    "tm-secure@technomaton-hub": "enabled",
    "tm-infra@technomaton-hub": "enabled",
    "tm-governance@technomaton-hub": "enabled",
    "tm-agents@technomaton-hub": "disabled"
  }
}
```

## Suggested profiles

**Core developer:** dx, docs, secure, github
**Platform engineer:** dx, infra, ops, secure
**Growth team:** growth, business
**Project governance:** governance, dx, docs
**Full stack:** all community packs enabled
