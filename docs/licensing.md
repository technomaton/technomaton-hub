# Licensing

## Dual License Model

Technomaton Hub uses a dual license model:

### Community Packs (MIT)

Packs with `"tier": "community"` in their plugin.json are MIT-licensed:
- tm-dx, docs, secure, infra, github
- tm-growth, eaa, ops, data, ml
- tm-atlassian, governance, agents, meta

Free to use, modify, and distribute.

### Commercial Packs (Proprietary)

Packs with `"tier": "commercial"` in their plugin.json are proprietary:
- tm-servicenow, public, business

Licensed per arrangement with TECHNOMATON Group.

## License Files

Each pack has its own LICENSE file that must match its tier:
- Community: MIT License text
- Commercial: Proprietary license text

## Validation

```bash
bash scripts/validate-licenses.sh
```

Checks that each pack's LICENSE content matches its declared tier.

## Contributing

- Contributions to community packs are MIT-licensed
- Contributions to commercial packs by arrangement only
- See CONTRIBUTING.md for details
