# Export Pipeline

## Purpose

Convert Claude Code-native SKILL.md files into universal Agent Skills format by stripping platform-specific fields.

## How It Works

```bash
make export
# or
bash scripts/export-agentskills.sh
```

### Process

1. Scan `packs/*/skills/*/SKILL.md`
2. Parse YAML frontmatter
3. Strip CC-specific fields: `allowed-tools`, `context`, `model`, `hooks`, `disable-model-invocation`
4. Keep universal fields: `name`, `description`, `license`, `compatibility`, `metadata`
5. Write to `dist/agentskills/<pack>/<skill>/SKILL.md`

### Stripped Fields

| Field | Reason |
|-------|--------|
| `allowed-tools` | CC-specific tool permissions |
| `context` | CC-specific context loading |
| `model` | CC-specific model selection |
| `hooks` | CC-specific hook references |
| `disable-model-invocation` | CC-specific safety control |

### Output

```
dist/agentskills/
├── technomaton-dx/
│   ├── commit-policy/SKILL.md
│   └── pr-review/SKILL.md
├── technomaton-docs/
│   └── adr-draft/SKILL.md
└── ...
```

## CI/CD

- `ci.yml` — dry-run export on every push/PR
- `export.yml` — full export on tag, uploads as artifact
- `release.yml` — creates GitHub Release with both CC and Agent Skills zips
