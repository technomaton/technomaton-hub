# Feature Plan: Technomaton Hub — Kurátorovaný Capability Hub s Meta-Skill Kompozicí

**Autor:** Technomaton Team
**Datum:** 2026-03-21
**Status:** Návrh
**Cílový soubor:** `docs/feature-plan-meta-skills-and-distribution.md`

---

## 1. Vize

Technomaton Hub slouží jako **kurátorovaný zdroj AI-powered capabilities** pro každodenní práci firmy TECHNOMATON — od vedení přes vývojový tým (do 5 lidí) až po externí spolupracovníky.

### Co hub poskytuje

- **Skills** — znalostní moduly s workflow a best practices
- **Agents** — specializovaní AI asistenti pro konkrétní role (product manager, security reviewer, data analyst...)
- **Commands** — uživatelské akce vyvolatelné přes `/příkaz`
- **Hooks** — automatizované guardraily (secret scan, format, tests)
- **Meta-skills** — orchestrační workflow kombinující skills z různých zdrojů

### Pokrytí firemních potřeb

| Oblast | Vlastní packy | Externí skills (k integraci) |
|--------|--------------|------------------------------|
| **Vývoj** | tm-dx, tm-github | superpowers (TDD, debugging, planning) |
| **Kvalita** | tm-secure | superpowers (code review, verification) |
| **Dokumentace** | tm-docs | example-skills (docx, pdf, pptx, doc-coauthoring) |
| **Design** | — | example-skills (frontend-design, canvas-design, brand-guidelines, theme-factory) |
| **Komunikace** | — | example-skills (internal-comms, slack-gif-creator) |
| **Data & Finance** | tm-data | example-skills (xlsx), excel-analyst-pro |
| **Governance** | tm-governance (EDPA) | — |
| **Infrastruktura** | tm-infra | — |
| **Marketing** | tm-public, tm-growth | example-skills (brand-guidelines, canvas-design) |
| **Business** | tm-business, tm-servicedesk | — |
| **ML/AI** | tm-ml | — |
| **Operativa** | tm-ops | — |
| **Agenti** | tm-agents (6 agentů) | — |

---

## 2. Současný stav

### 2.1 Technomaton Hub (vlastní)

15 packů, 8 skills, 36 commands, 17 agents. Vše self-contained, žádné závislosti mezi packy ani na externích zdrojích.

### 2.2 Dostupné externí zdroje

#### Superpowers Plugin (obra/superpowers v5.0.5) — 14 skills

Zaměření: **vývojové workflow a disciplína**

| Skill | Co dělá | Relevance pro firmu |
|-------|---------|---------------------|
| brainstorming | Socratic design → spec | Vysoká — každý nový projekt |
| writing-plans | Detailní implementační plány | Vysoká — plánování práce |
| executing-plans | Exekuce plánů s checkpointy | Vysoká — řízení implementace |
| subagent-driven-development | Paralelní vývoj se subagenty | Střední — větší úlohy |
| test-driven-development | RED-GREEN-REFACTOR | Vysoká — kvalita kódu |
| systematic-debugging | 4-fázová root cause analýza | Vysoká — řešení problémů |
| verification-before-completion | Ověření před dokončením | Vysoká — kvalita deliverables |
| requesting-code-review | Příprava na code review | Střední — týmová spolupráce |
| receiving-code-review | Zpracování review feedbacku | Střední — týmová spolupráce |
| dispatching-parallel-agents | Koordinace paralelních agentů | Střední — komplexní úlohy |
| using-git-worktrees | Izolované workspace | Nízká — pokročilé Git |
| finishing-a-development-branch | Dokončení větve (merge/PR) | Střední — Git workflow |
| writing-skills | Vytváření nových skills | Vysoká — rozšiřování hubu |
| using-superpowers | Úvod do systému skills | Nízká — jednorázově |

#### Anthropic Example Skills (anthropic-agent-skills) — 17 skills

Zaměření: **dokumenty, design, komunikace, data**

| Skill | Co dělá | Relevance pro firmu |
|-------|---------|---------------------|
| **docx** | Tvorba/editace Word dokumentů | Vysoká — smlouvy, reporty, nabídky |
| **pdf** | Manipulace s PDF (merge, split, forms) | Vysoká — faktury, smlouvy |
| **pptx** | Tvorba prezentací | Vysoká — obchodní prezentace, pitche |
| **xlsx** | Tabulky, formule, grafy, analýza | Vysoká — finance, reporting |
| **doc-coauthoring** | Strukturovaný workflow pro tvorbu dokumentů | Vysoká — specs, proposals |
| **internal-comms** | Šablony firemní komunikace (status updaty, newslettery, FAQs, incident reporty) | Vysoká — týmová komunikace |
| **frontend-design** | Produkční UI/UX design | Střední — web, dashboard |
| **brand-guidelines** | Aplikace brand identity (barvy, fonty) | Střední — marketing materiály |
| **canvas-design** | Vizuální design (postery, art, PDF) | Střední — marketing, social |
| **theme-factory** | 10 profesionálních témat pro artefakty | Střední — konzistentní vizuál |
| **algorithmic-art** | Generativní umění (p5.js) | Nízká — kreativní projekty |
| **slack-gif-creator** | GIFy pro Slack | Nízká — týmová kultura |
| **mcp-builder** | Tvorba MCP serverů | Střední — integrace nástrojů |
| **skill-creator** | Průvodce tvorbou skills | Vysoká — rozšiřování hubu |
| **webapp-testing** | Testování webových aplikací (Playwright) | Střední — QA |
| **web-artifacts-builder** | Komplexní React+Tailwind artefakty | Nízká — claude.ai specifické |

#### Další dostupné zdroje

| Zdroj | Obsah | Relevance |
|-------|-------|-----------|
| **claude-plugins-official** | 48 pluginů (LSP, integrace, dev tools) | Střední — dle potřeby |
| **claude-code-plugins-plus** | 270+ pluginů (devops, testing, AI/ML, SaaS) | Selektivní — specifické potřeby |
| **Microsoft APM registry** | Skills distribuované přes apm.yml | Budoucí — po stabilizaci |
| **Skills.sh (Vercel)** | 83,627 skills, multi-platform | Budoucí — inspirace |
| **MCP Registry** | MCP servery pro nástroje | Doplňkové — nástroje |

### 2.3 Co chybí v hubu

| Gap | Popis | Řešení |
|-----|-------|--------|
| **Žádné externí závislosti** | Hub nemá mechanismus pro import a správu externích skills | → Vendor systém |
| **Žádná meta-skill kompozice** | Skills z různých zdrojů nelze kombinovat do workflow | → Meta-pack |
| **Chybí design capabilities** | Žádný vlastní pack pro vizuální design | → Import example-skills |
| **Chybí dokument capabilities** | Omezené na docs sync command | → Import example-skills (docx, pdf, pptx, xlsx) |
| **Chybí komunikační nástroje** | Žádné šablony pro interní komunikaci | → Import example-skills (internal-comms) |
| **Žádná ochrana proti zmizení upstreamu** | Pokud by superpowers repo zmizelo, žádná záchrana | → Vendoring |
| **Žádné quality gates** | Není validace kvality externích skills před importem | → Quality check skripty |

---

## 3. Architektura — Tři varianty

### 3.1 Varianta A: APM-First (Microsoft Agent Package Manager)

#### Princip

Technomaton-hub se stane zdrojem capabilities distribuovaným přes Microsoft APM. Externí skills (superpowers, example-skills) se deklarují jako závislosti v `apm.yml`. APM řeší dependency resolution, versioning, a instalaci automaticky.

#### Jak to funguje

**Manifest (`apm.yml`):**
```yaml
name: technomaton-hub
version: 1.0.0
description: "Curated AI capabilities for TECHNOMATON"

# Vlastní skills
skills:
  - path: ./packs/tm-dx/skills/commit-policy/SKILL.md
  - path: ./packs/tm-governance/skills/edpa-setup/SKILL.md
  - path: ./packs/tm-secure/skills/*/SKILL.md

# Externí závislosti — APM je stáhne automaticky
dependencies:
  superpowers:
    source: github.com/obra/superpowers
    version: "^5.0.0"      # Jakákoliv 5.x
  example-skills:
    source: github.com/anthropics/skills
    version: "^1.0.0"
  deep-plan:
    source: github.com/piercelamb/deep-plan
    version: "^1.0.0"
```

**Instalace uživatelem:**
```bash
# Instalace APM CLI
brew install apm

# Instalace celého hubu + všech závislostí
apm install technomaton-hub

# Co se stane:
# → Stáhne technomaton-hub
# → Automaticky stáhne superpowers 5.0.5
# → Automaticky stáhne example-skills (docx, pdf, xlsx, ...)
# → Automaticky stáhne deep-plan
# → Vyřeší konflikty verzí pokud existují
```

**Meta-skill příklad:**
```yaml
# packs/tm-meta/skills/full-dev-workflow/SKILL.md
---
name: full-dev-workflow
description: Use when starting a new feature from scratch
dependencies:
  - superpowers:brainstorming
  - superpowers:test-driven-development
  - tm-governance:edpa-setup
  - tm-dx:pr-review
---
# Full Development Workflow
1. superpowers:brainstorming → design
2. tm-governance:edpa-setup → capacity
3. superpowers:test-driven-development → implementace
4. tm-dx:pr-review → review
```

**Security audit:**
```bash
apm audit
# → Skenuje všechny závislosti na zranitelnosti
# → Kontroluje skrytý Unicode v skill souborech
# → Hlásí kompromitované balíky
```

#### Výhody

| # | Výhoda | Detail |
|---|--------|--------|
| 1 | **Transitivní dependency resolution** | APM automaticky vyřeší celý strom závislostí — pokud superpowers závisí na něčem dalším, APM to stáhne |
| 2 | **Multi-platform** | Funguje s Claude Code, Cursor, Copilot, Windsurf, Codex (30+ agentů) — tvoji lidé můžou používat různé nástroje |
| 3 | **Security audit** | `apm audit` skenuje závislosti na zranitelnosti a skrytý Unicode — důležité pro bezpečnost |
| 4 | **Jeden příkaz** | `apm install technomaton-hub` nainstaluje vše — snadný onboarding nových lidí |
| 5 | **MIT licence** | Můžeš forknout kdykoliv — pojistka proti zmizení APM projektu |
| 6 | **Zralý projekt** | 753 commitů, 32 releases, 17 kontributorů, Microsoft backing |
| 7 | **Nemigruješ externí skills** | Superpowers a example-skills jen deklaruješ jako dependency, nemusíš je kopírovat |
| 8 | **Standardní formát** | `apm.yml` je rozpoznávaný formát v ekosystému |

#### Nevýhody

| # | Nevýhoda | Detail |
|---|----------|--------|
| 1 | **Závislost na APM projektu** | Co když Microsoft APM ukončí nebo změní API? Musíš forknout nebo migrovat |
| 2 | **Extra toolchain** | Uživatelé musí nainstalovat `apm` CLI (Homebrew/pip/Scoop) — další nástroj ke správě |
| 3 | **Verze 0.8.3** | Ještě ne 1.0 — API může mít breaking changes mezi verzemi |
| 4 | **Marketplace.json redundantní** | Duplikace s apm.yml — dva manifesty popisují to samé |
| 5 | **Bez vendoringu** | Pokud upstream zmizí, APM to nezachrání — nemá lokální cache |
| 6 | **Omezená kontrola** | Co nainstaluje APM, nemůžeš validovat předem (žádné quality gates) |
| 7 | **Bez offline podpory** | Instalace vyžaduje síťové připojení k GitHub/registry |
| 8 | **Složitější debugging** | Problémy s deps → musíš rozumět APM resolution algoritmu |

#### Rizika

| Riziko | Pravděpodobnost | Dopad | Mitigace |
|--------|----------------|-------|----------|
| APM projekt ukončen | Nízká (Microsoft) | Vysoký | Fork MIT repa, migrace na jiný PM |
| APM breaking change v0.x→v1.0 | Střední | Střední | Pin APM verzi, testovat upgrady |
| Upstream skill zmizí (např. superpowers repo smazáno) | Střední | **Vysoký — žádná ochrana** | Musíš ručně vendorovat, APM to neřeší |
| Nekompatibilní verze dependencies | Nízká | Střední | APM audit, pin verze |
| Uživatel nemá APM nainstalovaný | Vysoká (nový tool) | Nízký | Dokumentace, onboarding skript |

#### Kdy zvolit variantu A

- Cílíš na **multi-platform** (ne jen Claude Code) — tvoji lidé používají Cursor, Copilot atd.
- Je OK **záviset na externím package manageru** (APM)
- APM je **ve verzi 1.0+** se stabilním API
- **Vendoring není priorita** — důvěřuješ, že upstream repos zůstanou dostupné
- Chceš **nejjednodušší onboarding** (jeden příkaz)

---

### 3.2 Varianta B: Claude Code Marketplace + Smart Vendoring

#### Princip

Zůstat čistě v Claude Code ekosystému. Externí skills (superpowers, example-skills) se vendorují jako snapshoty do `vendor/` adresáře v repu. Meta-pack orchestruje workflow přes vendored + vlastní skills. Skripty automatizují import, validaci a monitoring upstreamu.

#### Jak to funguje

**Struktura projektu:**
```
technomaton-hub/
├── .claude-plugin/marketplace.json    # CC registr (rozšířen o meta-pack)
│
├── packs/                             # Tvoje capabilities (beze změn)
│   ├── tm-dx/
│   ├── tm-governance/
│   ├── tm-secure/
│   ├── ...                            # (15 existujících packů)
│   └── tm-meta/              # NOVÝ — meta-pack
│       ├── .claude-plugin/plugin.json
│       ├── skills/
│       │   ├── full-dev-workflow/SKILL.md
│       │   ├── document-workflow/SKILL.md
│       │   └── secure-dev-workflow/SKILL.md
│       ├── README.md, CHANGELOG.md, LICENSE
│       └── hooks/hooks.json
│
├── vendor/                            # Vendored external skills
│   ├── superpowers-5.0.5/
│   │   ├── _vendor.json               # Import metadata
│   │   ├── LICENSE                     # Kopie MIT licence z originálu
│   │   └── skills/
│   │       ├── brainstorming/SKILL.md
│   │       ├── test-driven-development/SKILL.md
│   │       ├── systematic-debugging/SKILL.md
│   │       └── writing-plans/SKILL.md
│   └── example-skills-1.0.0/
│       ├── _vendor.json
│       ├── LICENSE
│       └── skills/
│           ├── docx/SKILL.md
│           ├── pdf/SKILL.md
│           ├── pptx/SKILL.md
│           ├── xlsx/SKILL.md
│           ├── internal-comms/SKILL.md
│           ├── doc-coauthoring/SKILL.md
│           ├── brand-guidelines/SKILL.md
│           ├── frontend-design/SKILL.md
│           └── canvas-design/SKILL.md
│
├── imports.lock                       # Version pinning + content hashes
│
├── scripts/
│   ├── validate.sh                    # (existující — rozšířen)
│   ├── vendor-skill.sh                # NOVÝ — import s quality gates
│   ├── validate-vendor.sh             # NOVÝ — integrita check
│   └── check-upstream.sh              # NOVÝ — weekly monitoring
│
├── docs/
│   ├── vendor-guide.md                # NOVÝ — dokumentace vendor workflow
│   └── ...                            # (existující docs)
│
├── Makefile                           # (rozšířen o nové targety)
├── NOTICE                             # (rozšířen o atribuci)
└── .github/workflows/
    └── check-upstream.yml             # NOVÝ — CI weekly monitoring
```

**imports.lock — co to je a k čemu slouží:**

Lock file je soubor v kořeni repa, který přesně dokumentuje: "tyhle verze těhle externích skills používáme, tohle jsou jejich hashe." Jako `package-lock.json` v npm — zajišťuje reprodukovatelnost.

```yaml
# imports.lock — NEEDITOVAT RUČNĚ, generován scripts/vendor-skill.sh
schema_version: 1
last_updated: "2026-03-21T10:00:00Z"

vendors:
  - name: superpowers
    version: "5.0.5"
    source: "https://github.com/obra/superpowers"
    commit: "abc123def456789"
    content_hash: "sha256:e3b0c44298fc1c149afbf4c8996fb924"
    vendor_path: "./vendor/superpowers-5.0.5"
    license: "MIT"
    quality_check:
      passed: true
      checked_at: "2026-03-21"
      maintainers: 3
      last_upstream_commit: "2026-03-15"
      github_stars: 1200
    skills:
      - name: brainstorming
        path: "skills/brainstorming/SKILL.md"
        hash: "sha256:a1b2c3..."
      - name: test-driven-development
        path: "skills/test-driven-development/SKILL.md"
        hash: "sha256:d4e5f6..."
      - name: systematic-debugging
        path: "skills/systematic-debugging/SKILL.md"
        hash: "sha256:g7h8i9..."
      - name: writing-plans
        path: "skills/writing-plans/SKILL.md"
        hash: "sha256:j0k1l2..."

  - name: example-skills
    version: "1.0.0"
    source: "https://github.com/anthropics/skills"
    commit: "def789ghi012345"
    content_hash: "sha256:..."
    vendor_path: "./vendor/example-skills-1.0.0"
    license: "MIT"
    quality_check:
      passed: true
      checked_at: "2026-03-21"
      maintainers: 5
      last_upstream_commit: "2026-03-18"
      github_stars: 2500
    skills:
      - name: docx
        path: "skills/docx/SKILL.md"
        hash: "sha256:..."
      - name: pdf
        path: "skills/pdf/SKILL.md"
        hash: "sha256:..."
      # ... další skills
```

**_vendor.json — metadata per balík:**

Každý vendored balík má svůj metadata soubor, který říká odkud pochází, kdy byl importován, a jaká byla kvalita v době importu.

```json
{
  "name": "superpowers",
  "version": "5.0.5",
  "source": "https://github.com/obra/superpowers",
  "commit": "abc123def456789",
  "vendored_at": "2026-03-21T10:00:00Z",
  "content_hash": "sha256:e3b0c44...",
  "license": "MIT",
  "skills_imported": [
    "brainstorming",
    "test-driven-development",
    "systematic-debugging",
    "writing-plans"
  ],
  "quality_check": {
    "passed": true,
    "checked_at": "2026-03-21",
    "maintainers": 3,
    "last_upstream_commit": "2026-03-15",
    "github_stars": 1200,
    "checklist": {
      "license_compatible": true,
      "bus_factor_gt_1": true,
      "active_last_12_months": true,
      "valid_skill_frontmatter": true,
      "no_security_issues": true
    }
  }
}
```

**Meta-skill příklad (`full-dev-workflow/SKILL.md`):**

Meta-skill neobsahuje obsah jiných skills — pouze je orchestruje. Říká v jakém pořadí a za jakých podmínek se mají vyvolat. Obsah skills zůstává na jednom místě (buď v packs/ nebo ve vendor/).

```yaml
---
name: full-dev-workflow
description: >
  Use when starting a new feature from scratch — orchestrates
  complete cycle from design through governance, implementation,
  and review using skills from multiple sources
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Bash
metadata:
  author: Technomaton Team
  version: 1.0.0
  tier: community
  source: original
  composed-from:
    - vendor: superpowers/brainstorming
    - vendor: superpowers/test-driven-development
    - pack: tm-governance/edpa-setup
    - pack: tm-dx/pr-review
---

# Full Development Workflow

Orchestruje kompletní vývojový cyklus kombinací skills z různých zdrojů.

## Fáze 1: Design (superpowers:brainstorming)

Invoke the superpowers:brainstorming skill. Follow its complete workflow:
- Explore project context
- Ask clarifying questions (one at a time)
- Propose 2-3 approaches with trade-offs
- Present design for user approval
- Write design spec to docs/

**Exit condition:** Design spec approved by user.

## Fáze 2: Capacity Planning (technomaton:edpa-setup)

After design approval, invoke tm-governance:edpa-setup to:
- Initialize EDPA configuration for the new feature
- Set up capacity registry entries
- Configure evidence detection rules
- Establish reporting cadence

**Exit condition:** capacity.yaml configured and committed.

## Fáze 3: Implementation (superpowers:test-driven-development)

Implement the approved design using strict TDD discipline:
- RED: Write a failing test that describes the expected behavior
- GREEN: Write minimal production code to make the test pass
- REFACTOR: Clean up while keeping tests green

Use superpowers:writing-plans to break implementation into tasks.
Use superpowers:systematic-debugging if issues arise.

**Exit condition:** All tests pass, implementation complete.

## Fáze 4: Review (technomaton:pr-review)

Before merging, invoke tm-dx:pr-review to:
- Validate commit policy (conventional commits)
- Run PR review checklist
- Ensure documentation is updated
- Verify test coverage

**Exit condition:** PR approved and merged.
```

**Import workflow — krok za krokem:**

```bash
# 1. Import nového externího skills setu
make vendor-skill \
  source=https://github.com/obra/superpowers \
  version=5.0.5 \
  skills="brainstorming,test-driven-development,systematic-debugging,writing-plans"

# Co se stane:
# a) Klonuje https://github.com/obra/superpowers do /tmp
# b) Checkoutne tag v5.0.5
# c) QUALITY GATE — automaticky zkontroluje:
#    - Má repo licenci? → Ano, MIT ✓
#    - Je licence kompatibilní? → MIT je OK ✓
#    - Kolik maintainerů? → 3 (bus factor > 1) ✓
#    - Poslední commit? → 2026-03-15 (< 12 měsíců) ✓
#    - Mají SKILL.md validní frontmatter? → Ano ✓
# d) Kopíruje vybrané skills do vendor/superpowers-5.0.5/
# e) Kopíruje LICENSE do vendor/superpowers-5.0.5/LICENSE
# f) Generuje vendor/superpowers-5.0.5/_vendor.json
# g) Aktualizuje imports.lock s verzemi a hashi
# h) Aktualizuje NOTICE s atribucí
# i) Vytiskne: "✓ Vendored 4 skills from superpowers@5.0.5"

# 2. Validace integrity
make validate-vendor
# → Ověří, že každý soubor ve vendor/ odpovídá hashi v imports.lock
# → Ověří, že NOTICE obsahuje atribuci pro každý vendor
# → Výstup: "✓ Vendor integrity check passed (2 vendors, 13 skills)"

# 3. Update existujícího vendored skillu
make update-vendor name=superpowers version=5.1.0
# → Stáhne novou verzi
# → Porovná diff s aktuální
# → Spustí quality gate
# → Aktualizuje vendor/ a imports.lock
# → Výstup: "✓ Updated superpowers 5.0.5 → 5.1.0 (3 files changed)"

# 4. Weekly monitoring (spouští CI automaticky)
make check-upstream
# → Pro každý vendor v imports.lock:
#    - Zjistí aktuální verzi na GitHubu
#    - Porovná s vendored verzí
#    - Pokud nová verze: vytvoří GitHub issue
#    - Pokud repo nedostupné: vytvoří WARNING issue
# → Výstup:
#    "superpowers: 5.1.0 available (vendored: 5.0.5) → issue #42 created"
#    "example-skills: up to date (1.0.0)"
```

**Instalace uživatelem (kolega ve firmě):**
```bash
# V Claude Code:
/plugin marketplace add https://github.com/technomaton/technomaton-hub
/plugin install tm-meta@technomaton-hub

# Co se stane:
# → Claude Code stáhne celé repo (včetně vendor/)
# → Nainstaluje tm-meta pack
# → vendor/ skills jsou dostupné jako součást repa
# → Uživatel může okamžitě použít meta-skills
```

#### Výhody

| # | Výhoda | Detail |
|---|--------|--------|
| 1 | **Plná ochrana proti zmizení upstreamu** | vendor/ je v tvém repu, commitnutý v gitu. I kdyby superpowers repo zítra zmizelo, máš funkční kopii. |
| 2 | **Žádné externí závislosti** | Nepotřebuješ APM ani žádný jiný package manager. Vše funguje s existujícím Git + Claude Code. |
| 3 | **Offline funkčnost** | Po instalaci vše funguje lokálně. Nepotřebuješ síť pro runtime. |
| 4 | **Nativní CC integrace** | Používáš marketplace.json, standardní Claude Code plugin formát. Žádné extra tooling. |
| 5 | **Plná kontrola nad kvalitou** | Quality gate před každým importem — ty rozhoduješ, co se vendoruje. |
| 6 | **Auditovatelnost** | Git historie ukazuje přesně kdy a co se importovalo. imports.lock je source of truth. |
| 7 | **Jednoduchý mental model** | "vendor/ = kopie toho, na čem závisíme." Každý to pochopí. |
| 8 | **Rozšiřuje existující infrastrukturu** | Používá stávající validate.sh, Makefile, NOTICE. Minimální nové koncepty. |

#### Nevýhody

| # | Nevýhoda | Detail |
|---|----------|--------|
| 1 | **Jen Claude Code** | Nefunguje s Cursor, Copilot, Windsurf. Pokud tým začne používat jiný AI tool, vendor/ mu nepomůže. |
| 2 | **Žádné transitivní deps** | Musíš ručně vendorovat vše. Pokud superpowers závisí na něčem dalším, musíš to zjistit sám. |
| 3 | **Repo roste** | vendor/ přidává soubory do repa. Ale skills jsou malé (5-50KB per skill), takže dopad je minimální. |
| 4 | **Manuální orchestrace** | Meta-skill musí explicitně popsat workflow textově. Nemůže "importovat" jiný skill jako modul. |
| 5 | **Drift riziko** | Vendored verze se může rozejít s upstreamem. Monitoring zmírňuje, ale neodstraňuje. |
| 6 | **Potenciální duplikace** | Pokud uživatel má superpowers nainstalované jako Claude Code plugin + vendored v hubu, má dvě kopie. |
| 7 | **Proprietární formát** | _vendor.json a imports.lock jsou vlastní formát — žádný standard, žádný tooling od třetích stran. |

#### Rizika

| Riziko | Pravděpodobnost | Dopad | Mitigace |
|--------|----------------|-------|----------|
| Upstream zmizí (repo smazáno) | Střední | **Žádný** — máš vendor/ | Vendoring = kompletní ochrana |
| Breaking change v upstreamu | Střední | Nízký | Pinned verze, update jen přes review |
| Drift vendor vs upstream | Vysoká | Nízký | Weekly CI monitoring (check-upstream.yml) |
| Vendor/ roste příliš | Nízká | Nízký | Skills jsou malé (~5-50KB), celkem ~500KB |
| CC plugins přidá nativní deps (#9444) | Střední | Pozitivní | Migrace na nativní = jednodušší systém |
| Duplikace s uživatelskými pluginy | Střední | Nízký | Dokumentace: "vendor/ je fallback, preferuj svůj plugin" |

#### Kdy zvolit variantu B

- Cílíš **primárně na Claude Code** — tvůj tým používá Claude Code jako hlavní AI nástroj
- Chceš **maximální stabilitu a kontrolu** — žádné závislosti na externích package managerech
- Priorita je **"nikdy se nerozbije kvůli externímu zdroji"** — vendoring jako pojistka
- Máš **menší rozsah** (desítky, ne stovky skills) — overhead vendoringu je přijatelný
- Chceš **nejnižší složitost** setupu a maintenance

---

### 3.3 Varianta C: Hybrid (APM + Marketplace + Vendoring)

#### Princip

Dual-manifest přístup: `apm.yml` pro dependency management a multi-platform distribuci, `marketplace.json` pro Claude Code nativní discovery, `vendor/` jako safety net pro kritické závislosti. Synchronizační skripty zajišťují konzistenci mezi manifesty.

#### Jak to funguje

**Struktura:**
```
technomaton-hub/
├── apm.yml                            # APM — deps + multi-platform distribuce
├── .claude-plugin/marketplace.json    # CC — nativní discovery
├── packs/                             # Tvoje capabilities
├── vendor/                            # Safety net (JEN kritické deps)
│   └── superpowers-5.0.5/             # Vendored — kritická závislost
│   # (example-skills NEJSOU vendorovány — ne-kritické)
├── imports.lock                       # Hash verification
├── scripts/
│   ├── vendor-skill.sh                # Import (jako v B)
│   ├── validate-vendor.sh             # Integrita (jako v B)
│   ├── check-upstream.sh              # Monitoring (jako v B)
│   └── sync-manifests.sh              # NOVÝ — sync apm.yml ↔ marketplace.json
└── .github/workflows/
    ├── check-upstream.yml             # Weekly monitoring
    └── sync-check.yml                 # NOVÝ — CI ověření sync manifestů
```

**Dual manifest:**

```yaml
# apm.yml — pro APM uživatele (Cursor, Copilot, Windsurf, ...)
name: technomaton-hub
version: 1.0.0
skills:
  - path: ./packs/tm-dx/skills/*/SKILL.md
  - path: ./packs/tm-governance/skills/*/SKILL.md
  - path: ./packs/tm-meta/skills/*/SKILL.md
dependencies:
  superpowers:
    source: github.com/obra/superpowers
    version: "^5.0.0"
    vendor: true          # Vendorovat jako fallback
  example-skills:
    source: github.com/anthropics/skills
    version: "^1.0.0"
    vendor: false         # Jen reference, ne-kritické
```

```json
// .claude-plugin/marketplace.json — pro CC uživatele
{
  "plugins": [
    { "name": "tm-dx", "source": "./packs/tm-dx" },
    { "name": "tm-governance", "source": "./packs/tm-governance" },
    { "name": "tm-meta", "source": "./packs/tm-meta" }
    // ... ostatní packy
  ]
}
```

**Synchronizace:**
```bash
# CI workflow: pokud přidáš skill do apm.yml, musí být i v marketplace.json
make sync-check
# → PASS: Manifesty jsou konzistentní
# → FAIL: "tm-meta je v marketplace.json ale ne v apm.yml"
```

**Multi-platform instalace:**
```bash
# Claude Code uživatel:
/plugin marketplace add https://github.com/technomaton/technomaton-hub
/plugin install tm-meta@technomaton-hub

# Cursor/Copilot uživatel (přes APM):
apm install technomaton-hub

# Oba dostanou stejné skills — jen jiným kanálem
```

#### Výhody

| # | Výhoda | Detail |
|---|--------|--------|
| 1 | **Multi-platform** | CC uživatelé i APM uživatelé (Cursor, Copilot, ...) dostanou to samé |
| 2 | **Safety net pro kritické** | Kritické deps (superpowers) vendorovány — ochrana proti zmizení |
| 3 | **Transitivní deps přes APM** | Kde to dává smysl, APM vyřeší strom závislostí |
| 4 | **Nativní CC integrace** | marketplace.json zůstává funkční — CC uživatelé nic nemění |
| 5 | **Nejrobustnější ochrana** | Vendoring + APM + CC marketplace — trojitá ochrana |
| 6 | **Future-proof** | Pokud CC přidá nativní deps (#9444), snadná migrace |
| 7 | **Flexibilní vendoring** | Vendoruješ jen kritické deps, ne vše — menší overhead |

#### Nevýhody

| # | Nevýhoda | Detail |
|---|----------|--------|
| 1 | **Nejvyšší složitost** | Dva manifesty, synchronizace, více konceptů ke správě |
| 2 | **Riziko driftu manifestů** | apm.yml a marketplace.json se mohou rozejít — CI musí hlídat |
| 3 | **Vyšší maintenance** | CI workflows, sync skripty, dva install doku — více práce |
| 4 | **Uživatelé musí pochopit dva systémy** | Ale jen maintaineré — end-users vidí jen jeden kanál |
| 5 | **Over-engineering pro 15 packů** | Pro současný rozsah je to příliš komplexní |
| 6 | **Závislost na APM** | Stejné riziko jako varianta A pro APM část |
| 7 | **Duplikace dokumentace** | Dva instalační postupy — pro CC a pro APM |

#### Rizika

| Riziko | Pravděpodobnost | Dopad | Mitigace |
|--------|----------------|-------|----------|
| Drift mezi manifesty | Vysoká | Střední | CI sync-check workflow |
| Upstream zmizí (kritický, vendored) | Střední | **Žádný** (vendor/) | Vendoring = ochrana |
| Upstream zmizí (ne-kritický, jen APM ref) | Střední | Střední | APM fallback nebo ex-post vendoring |
| APM breaking change | Střední | Střední | Pin APM verzi, testovat upgrady |
| Maintenance overhead | Vysoká | Nízký | Automatizace, CI, skripty |
| Konfuze u onboardingu | Střední | Nízký | Jasná dokumentace: "CC→marketplace, ostatní→APM" |

#### Kdy zvolit variantu C

- Máš **větší projekt** (50+ skills) s **multi-platform ambicemi**
- Tvůj tým používá **různé AI nástroje** (Claude Code + Cursor + Copilot)
- APM je **ve verzi 1.0+** (stabilní API)
- Máš **dedikovaného maintainera** pro dependency management
- Chceš **maximální dosah** — dostat capabilities ke komukoli, na jakémkoliv toolu

---

## 4. Srovnávací matice

### Funkční srovnání

| Kritérium | A: APM-first | B: CC + Vendor | C: Hybrid |
|-----------|:---:|:---:|:---:|
| Transitivní dependency resolution | ✅ Ano | ❌ Ne | ⚠️ Částečně (přes APM) |
| Multi-platform (30+ agentů) | ✅ Ano | ❌ Ne (jen CC) | ✅ Ano |
| Ochrana proti zmizení upstreamu | ❌ Ne | ✅ Ano (vendor/) | ⚠️ Částečně (jen kritické) |
| Offline funkčnost | ❌ Ne | ✅ Ano | ⚠️ Částečně |
| Quality gates při importu | ❌ Omezené (apm audit) | ✅ Plné (vlastní skripty) | ✅ Plné |
| Nativní CC integrace | ❌ Ne | ✅ Ano | ✅ Ano |
| Security audit | ✅ Ano (apm audit) | ⚠️ Vlastní skripty | ✅ Kombinace |
| Meta-skill orchestrace | ✅ Deklarativní (deps) | ✅ Textová (SKILL.md) | ✅ Obojí |

### Provozní srovnání

| Kritérium | A: APM-first | B: CC + Vendor | C: Hybrid |
|-----------|:---:|:---:|:---:|
| Složitost setupu | Střední | **Nízká** | Vysoká |
| Ongoing maintenance | Nízká | Střední | Vysoká |
| Extra toolchain potřeba | Ano (apm CLI) | **Ne** | Ano (apm CLI) |
| Velikost repa | Malá | Střední (+vendor ~500KB) | Střední (+vendor) |
| Počet manifestů ke správě | 1 (apm.yml) | **1** (marketplace.json) | 2 + sync |
| Nové CI workflows | 0 | 2 | 3 |
| Onboarding nového člověka | Nejjednodušší (1 příkaz) | Snadný (/plugin install) | Záleží na toolu |

### Rizikové srovnání

| Riziko | A: APM-first | B: CC + Vendor | C: Hybrid |
|--------|:---:|:---:|:---:|
| Upstream repo zmizí | 🔴 VYSOKÉ | 🟢 ŽÁDNÉ | 🟡 NÍZKÉ |
| APM zmizí/breaking change | 🔴 VYSOKÉ | 🟢 ŽÁDNÉ | 🟡 STŘEDNÍ |
| CC přidá nativní deps | Migrace nutná | 🟢 Bonus | 🟢 Bonus |
| Over-engineering | 🟢 Ne | 🟢 Ne | 🔴 Ano (pro 15 packů) |
| Vendor drift | N/A | 🟡 STŘEDNÍ (monitoring) | 🟡 STŘEDNÍ |

### Shrnutí jednou větou

| Varianta | Shrnutí |
|----------|---------|
| **A** | "Nejjednodušší instalace, nejslabší ochrana proti zmizení" |
| **B** | "Maximální ochrana a kontrola, jen pro Claude Code" |
| **C** | "Všechno ze všeho, ale nejsložitější na správu" |

---

## 5. Doporučení: B teď → C později

### Proč začít s B

1. **Vendoring vždy** — zvolená priorita je maximální ochrana proti zmizení upstreamu
2. **15 packů** — pro tenhle rozsah je Hybrid (C) over-engineering
3. **APM v0.8.3** — ještě ne stabilní, riskantní stavět na tom teď
4. **Tým do 5 lidí + CC** — multi-platform pravděpodobně není akutní potřeba
5. **CC plugins FR #9444** — nativní dependency support může přijít, pak B → nativní je jednodušší než C → nativní
6. **Nulové extra závislosti** — funguje hned, bez instalace dalších nástrojů
7. **Nejnižší riziko** — vendor/ + monitoring + quality gates = robustní základ

### Kdy přejít na C

- APM vydá **v1.0** se stabilním API
- Tým začne používat **různé AI nástroje** (ne jen CC)
- Hub naroste na **50+ skills** a multi-platform poptávka se objeví
- CC plugins přidá **dependency support (#9444)** — pak možná přechod rovnou na nativní řešení místo C
- Přibude **dedikovaný maintainer** pro dependency management

### Evoluce: B → nativní CC deps (pokud #9444 implementováno)

Pokud Anthropic implementuje dependency support v CC plugins, přechod z B bude jednoduchý:
```json
// plugin.json — budoucí format (spekulace dle FR #9444)
{
  "name": "tm-meta",
  "dependencies": {
    "superpowers": "^5.0.0",
    "example-skills": "^1.0.0"
  }
}
```
vendor/ zůstane jako fallback, ale primární dep resolution přejde na CC.

---

## 6. Implementační kroky (Varianta B)

### Krok 1: Vendor infrastruktura

**Nové soubory:**
| Soubor | Účel |
|--------|------|
| `vendor/.gitkeep` | Prázdný vendor adresář v gitu |
| `imports.lock` | Version pinning + content hashes |
| `scripts/vendor-skill.sh` | Import skript s quality gates |
| `scripts/validate-vendor.sh` | Ověření integrity vendor/ vs imports.lock |
| `scripts/check-upstream.sh` | Monitoring upstream změn |
| `docs/vendor-guide.md` | Dokumentace vendor workflow |

**Úpravy existujících:**
| Soubor | Změna |
|--------|-------|
| `Makefile` | Nové targety: `vendor-skill`, `update-vendor`, `check-upstream`, `validate-vendor` |
| `scripts/validate.sh` | Přidat volání `validate-vendor.sh` |
| `CLAUDE.md` | Přidat sekci o vendor workflow |

### Krok 2: Vendor superpowers + example-skills

```bash
# Superpowers — vývojové workflow
make vendor-skill \
  source=https://github.com/obra/superpowers \
  version=5.0.5 \
  skills="brainstorming,test-driven-development,systematic-debugging,writing-plans"

# Example-skills — dokumenty, design, komunikace
make vendor-skill \
  source=https://github.com/anthropics/skills \
  version=latest \
  skills="docx,pdf,pptx,xlsx,internal-comms,doc-coauthoring,brand-guidelines,frontend-design,canvas-design"
```

### Krok 3: Meta-pack

Nový pack `packs/tm-meta/` s:
- `plugin.json` — manifest
- `skills/full-dev-workflow/SKILL.md` — brainstorming → governance → TDD → review
- `skills/document-workflow/SKILL.md` — doc-coauthoring → docx/pdf/pptx → brand-guidelines
- `skills/secure-dev-workflow/SKILL.md` — threat model → implement → audit
- README, CHANGELOG, LICENSE, hooks.json, .mcp.json
- Rozšíření `marketplace.json` o nový pack entry

### Krok 4: CI/CD

- `.github/workflows/check-upstream.yml` — weekly cron pro monitoring
- Rozšíření existující `ci.yml` o `make validate-vendor`

### Krok 5: Dokumentace & NOTICE

- `docs/vendor-guide.md` — jak importovat, aktualizovat, monitorovat
- `CONTRIBUTING.md` — rozšířit o vendor workflow pro kontributory
- `CLAUDE.md` — přidat vendor konvence
- `NOTICE` — rozšířit o atribuci superpowers a example-skills

### Verifikace

1. `make validate` — full suite projde (včetně vendor validace)
2. `make vendor-skill` — úspěšný import superpowers i example-skills
3. `make check-upstream` — zjistí aktuální verze upstreamů
4. `make validate-vendor` — ověří integritu vendor/ vs imports.lock
5. Meta-skill test — manuální test v Claude Code session: vyvolat `full-dev-workflow` a ověřit orchestraci

---

## 7. Stav ekosystému — referenční zdroje

### Kde hledat skills

| Zdroj | URL | Typ |
|-------|-----|-----|
| Anthropic Official Plugins | github.com/anthropics/claude-plugins-official | Kurátorované (48 pluginů) |
| Anthropic Agent Skills | github.com/anthropics/skills | Kurátorované (17 skills) |
| Superpowers | github.com/obra/superpowers | Community (14 skills) |
| Claude Plugins Plus | github.com/jeremylongshore/claude-code-plugins | Community (270+ pluginů) |
| Microsoft APM | github.com/microsoft/apm | Package manager |
| Skills.sh (Vercel) | skills.sh | Registry (83,627 skills) |
| SkillsMP | skillsmp.com | Registry (351,349 skills) |
| MCP Registry | registry.modelcontextprotocol.io | MCP servery |

### Klíčové články a dokumentace

- [Claude Code Plugins Docs](https://code.claude.com/docs/en/plugins) — oficiální dokumentace
- [Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) — marketplace system
- [Feature Request #9444](https://github.com/anthropics/claude-code/issues/9444) — plugin dependencies
- [Microsoft APM](https://github.com/microsoft/apm) — agent package manager
- [Skills vs MCP](https://layered.dev/mcp-vs-agent-skills/) — architektonické rozdíly
