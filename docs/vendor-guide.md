# Vendor Guide — Managing External Skills

## Overview

External skills are vendored into `vendor/` as snapshots. This provides:
- Protection against upstream deletion or breaking changes
- Offline functionality after installation
- Full control over quality and versioning

## Importing a New External Skill

```bash
make vendor-skill \
  source=https://github.com/org/repo \
  version=v1.0.0 \
  skills="skill1,skill2,skill3"
```

The script will:
1. Clone the source repository
2. Run quality gate checks (license, frontmatter, activity)
3. Copy selected skills into `vendor/<name>-<version>/`
4. Generate `_vendor.json` metadata
5. Update `imports.lock` with hashes
6. Update `NOTICE` with attribution

Use `--force` to skip quality gate (e.g., for repos without LICENSE file).
Use `--dry-run` to preview without making changes.

## Updating a Vendored Skill

```bash
make update-vendor name=superpowers version=v5.1.0
```

## Checking for Upstream Changes

```bash
make check-upstream
```

Runs automatically every Monday via GitHub Actions (`check-upstream.yml`).
Creates an issue if updates are available or upstream is unreachable.

## Validating Vendor Integrity

```bash
make validate-vendor
```

Checks:
- Every vendor dir referenced in `imports.lock` exists on disk
- Every vendor dir has `_vendor.json`
- Every vendor has attribution in `NOTICE`
- Content hashes match

This runs as part of `make validate`.

## File Reference

| File | Purpose |
|------|---------|
| `vendor/<name>-<version>/` | Vendored skill files |
| `vendor/<name>-<version>/_vendor.json` | Import metadata |
| `vendor/<name>-<version>/LICENSE` | Copy of upstream license |
| `imports.lock` | Version pinning + content hashes |
| `NOTICE` | Third-party attribution |
| `scripts/vendor-skill.sh` | Import script |
| `scripts/validate-vendor.sh` | Integrity check |
| `scripts/check-upstream.sh` | Upstream monitoring |

## Quality Gate Checks

Before importing, the script verifies:
- License file exists and is compatible (MIT, Apache-2.0)
- SKILL.md files have valid YAML frontmatter
- Repository has recent activity (last commit date)

## When Upstream Disappears

If an upstream repo is deleted or goes private:
1. Your vendored copy in `vendor/` continues to work
2. `make check-upstream` will report: "WARNING: <source> is not accessible!"
3. No action needed — the vendored snapshot is your safety net
