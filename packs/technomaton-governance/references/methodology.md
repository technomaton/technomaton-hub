# EDPA — Evidence-Driven Proportional Allocation

*Capacity derivation from delivery evidence*

**Projekt: Medical Platform a Datový e-shop (CZ.01.01.01/01/24_062/0007440)**
**Verze 2.2 · Březen 2026 · Jaroslav Urbánek, Lead Architect**

---

## 1. Shrnutí

Čas se neměří, odvozuje se. Nikdo neloguje hodiny. Nikdo nevyplňuje timesheets.

Člověk deklaruje kapacitu na období. Systém identifikuje work items, na nichž se prokazatelně podílel. Kapacita se ex post rozpadá poměrově mezi relevantní items podle Job Size a míry contribution.

Výsledkem je výkaz, který je vedlejším produktem dodávky, ne separátní administrativní aktivitou.

Model poskytuje dva komplementární pohledy na stejná data:

- **Per-person pohled**: jak se kapacita člověka rozloží mezi jeho items → výkazy, timesheets
- **Per-item pohled**: jak se práce na itemu rozloží mezi lidi → nákladová alokace, audit per deliverable

---

## 2. Terminologie

| Pojem | Definice | Konfigurace |
|---|---|---|
| **Iterace** | Delivery cyklus. Stories se plánují, dodávají a uzavírají. | 1 týden (AI-native) nebo 2 týdny (klasický) |
| **Planning Interval** | Plánovací cyklus. Features se plánují, koordinují a vyhodnocují. | 5 týdnů (4+1 IP) nebo 10 týdnů (8+2 IP) |
| **IP Iterace** | Innovation & Planning iterace na konci Planning Intervalu. | Poslední iterace v Planning Intervalu |
| **Job Size (JS)** | Relativní odhad velikosti work itemu. Upravená Fibonacci: 1, 2, 3, 5, 8, 13, 20. | Per úroveň nezávisle |
| **WSJF** | Prioritizační skóre: (BV + TC + RR) / Job Size | Per úroveň nezávisle |
| **Contribution Weight (CW)** | Míra zapojení osoby na work itemu. Nezávislé per osoba. | 0.15–1.0, z evidence nebo manuální override |
| **Evidence Score** | Surový součet signálů aktivity osoby na itemu z GitHub dat. Detekční vrstva. | Automaticky |
| **Relevance Signal (RS)** | Normalizovaný signál relevance odvozený z Evidence Score. Matematický vstup. | Automaticky |
| **Derived Hours** | Odvozené hodiny, výstup modelu. | Automaticky po Iteration Close |

---

## 3. Architektura modelu

### 3.1 Tři oddělené vrstvy

| Vrstva | Účel | Kde žije |
|---|---|---|
| **Operational Metadata Layer** | Živá delivery data | GitHub Issues + GitHub Projects |
| **Capacity Registry Layer** | Kapacita lidí, role, FTE, availability | YAML / JSON config v repo |
| **Evidence & Reporting Layer** | Frozen snapshoty, výkazy, Excel, podpisy | `/snapshots`, `/reports`, `/signed` |

### 3.2 Co je a není GitHub source of truth pro

**GitHub je source of truth pro:** issue hierarchy, ownership, status práce, zařazení do Planning Intervalu a Iterace, Job Size, WSJF inputs, review a merge trail, delivery audit trail.

**GitHub není primární source of truth pro:** hodinovou kapacitu osoby, FTE evidenci, derived hours za uzavřené období, podpisové stavy. Tyto informace vznikají a žijí v evidence vrstvě.

---

## 4. Hierarchie work items

```text
Initiative (celý projekt, business case)
  └── Epic (strategický cíl, 6–9 měsíců)
       └── Feature (musí se vejít do Planning Intervalu)
            └── Story (dodáváno v Iteraci)
                 └── Task (technická práce, volitelné)
```

Každá úroveň má vlastní nezávislý Job Size a WSJF. Feature WSJF se nepočítá ze Stories pod ní.

Pravidla granularity: Story max 8 SP (2/10) nebo 5 SP (1/5), Feature max 13, Epic max 20. Nad limitem se item rozpadá.

---

## 5. Model: Evidence-Driven Proportional Allocation

### 5.1 Vstupy

Pro osobu **P** a Iteraci **I**:

| Vstup | Zdroj | Příklad |
|---|---|---|
| `Capacity[P, I]` | Potvrzeno při Iteration Planning | 40h |
| `RelevantItems[P, I]` | Automaticky z GitHub evidence | 6 items přes 3 úrovně |
| `JobSize[item]` | Custom field na issue | Fibonacci 1–20 |
| `ContributionWeight[P, item]` | Z evidence / manuální override | 0.15–1.0 |
| `RelevanceSignal[P, item]` | Normalizováno z Evidence Score | 0.25–1.0 |

### 5.2 Evidence detection

| GitHub signál | Evidence body | Typický CW |
|---|---:|---:|
| Assignee na issue | +4 | 1.0 |
| Explicitní `/contribute` příkaz | +3 | 0.6 |
| PR author referencující item | +2 | 0.6 |
| Commit author s S-XXX / F-XXX / E-XXX v message | +1 | 0.25 |
| PR reviewer na PR referencujícím item | +1 | 0.25 |
| Issue / PR comment v design diskusi | +0.5 | 0.15 |

Pravidla:
- Threshold relevance: Evidence Score ≥ 1.0
- Heuristika CW: nejsilnější signál určuje výchozí CW
- Manuální override: `/contribute @osoba weight:0.6`
- Commit count se nepřevádí na čas, jen pomáhá potvrdit relevanci

### 5.3 Výpočet — dvě varianty

**Varianta metodicky čistá (auditní):**
```text
Score[P, item] = JobSize[item] × ContributionWeight[P, item] × RelevanceSignal[P, item]
DerivedHours[P, item] = (Score[P, item] / SumScores[P, I]) × Capacity[P, I]
```

**Zjednodušená provozní varianta:**
```text
Score[P, item] = JobSize[item] × ContributionWeight[P, item]
DerivedHours[P, item] = (Score[P, item] / SumScores[P, I]) × Capacity[P, I]
```

Doporučení: začít provozní variantou. Evidence Score a Relevance Signal zachovat ve snapshotu pro auditní obhajobu.

### 5.4 Matematická garance

```text
Σ DerivedHours[P, item] = Capacity[P, I]
```

Součet odvozených hodin je přesně kapacita osoby na Iteraci, pokud existuje alespoň jeden relevantní item. Platí pro obě varianty výpočtu.

---

## 6. Dual-view CW: dvě otázky, jeden dataset

### 6.1 Problém

CW = 0.25 pro reviewera na Story může znamenat dvě věci:

- **Per-person pohled:** "tenhle item zabral 25 % pozornosti oproti jeho dalším items" → rozpad kapacity
- **Per-item pohled:** "udělal 25 % práce na tomto itemu" → rozpad nákladů per deliverable

Jsou to dvě různé otázky. Jedna sada CW obě nepokryje. Model řeší obě — ze stejných dat, dvěma normalizacemi.

### 6.2 Per-person normalizace (výkazy)

Odpovídá na: **Jak se kapacita člověka P rozloží mezi jeho items?**

```text
DerivedHours[P, item] = (Score[P, item] / Σ Score[P, *]) × Capacity[P, I]

Garance: Σ DerivedHours[P, *] = Capacity[P, I]
```

Výstup: **výkaz per osoba** — kolik hodin P strávil na kterém itemu.

### 6.3 Per-item normalizace (nákladová alokace)

Odpovídá na: **Jak se práce na itemu X rozloží mezi lidi?**

```text
ItemShare[P, item] = DerivedHours[P, item] / Σ DerivedHours[*, item]

Kde Σ běží přes všechny kontributory itemu.
```

Výstup: **nákladová karta per item** — kolik hodin kdo investoval do tohoto deliverable.

### 6.4 Příklad: Story S-200 (OMOP parser impl., JS: 8)

**Per-person pohled** (každý ze SVÉ kapacity):

| Kontributor | CW | Score | Jeho ΣScores | Jeho kapacita | Hodiny na S-200 |
|---|---:|---:|---:|---:|---:|
| Turyna (Dev, owner) | 1.0 | 8.0 | 42.3 | 60h | 11.3 h |
| Tůma (DevSecOps, CI/CD) | 0.6 | 4.8 | 58.1 | 80h | 6.6 h |
| Urbánek (Arch, review) | 0.25 | 2.0 | 28.6 | 40h | 2.8 h |

**Per-item pohled** (jak se 20.7h na S-200 rozloží):

| Kontributor | Hodiny na S-200 | Podíl na itemu |
|---|---:|---:|
| Turyna | 11.3 h | 54.6 % |
| Tůma | 6.6 h | 31.9 % |
| Urbánek | 2.8 h | 13.5 % |
| **Celkem** | **20.7 h** | **100 %** |

Per-person: každý má S-200 ve svém výkazu. Per-item: S-200 "stál" 20.7h tří lidí, z toho Turyna dominuje (55 %).

### 6.5 Kdy co použít

| Pohled | Otázka | Výstup | Garance |
|---|---|---|---|
| Per-person | Kolik hodin P strávil na čem? | Výkaz, timesheet, OP TAK | Σ = kapacita |
| Per-item | Kolik lidí a hodin stál item X? | Nákladová alokace, audit per deliverable | Σ podílů = 100 % |

Oba pohledy se generují ze stejných dat (CW, JS, Capacity) — žádná duplikace, žádný konflikt.

---

## 7. Konfigurace kadence

### Varianta A: Klasická (2/10)

| Cyklus | Délka | Kapacita 1.0 FTE | 0.5 FTE | 0.25 FTE |
|---|---|---:|---:|---:|
| Iterace | 2 týdny | 80h | 40h | 20h |
| Planning Interval | 10 týdnů (4+1 IP) | 400h | 200h | 100h |

### Varianta B: AI-Native (1/5)

| Cyklus | Délka | Kapacita 1.0 FTE | 0.5 FTE | 0.25 FTE |
|---|---|---:|---:|---:|
| Iterace | 1 týden | 40h | 20h | 10h |
| Planning Interval | 5 týdnů (4+1 IP) | 200h | 100h | 50h |

Doporučení: začít na A, po prvním PI vyhodnotit přechod na B na základě dat.

---

## 8. Učící smyčka

### 8.1 Velocity tracking
```text
Story_Velocity[tým, iterace] = Σ JobSize uzavřených Stories
Feature_Velocity[tým, PI] = Σ JobSize uzavřených Features
Accuracy = Actual / Planned × 100 %
```

### 8.2 CW kalibrace
Po 2–3 Iteracích vyhodnotit: odpovídá heuristika realitě, není PM podhodnocen, není Arch nadhodnocen.

### 8.3 Job Size kalibrace
Referenční Story "3" je jiná než referenční Feature "3". Každá úroveň se kalibruje nezávisle.

### 8.4 Role AI
AI generuje kód i dokumentaci. Vykazuješ čas na dodání itemu, ne minuty psaní kódu. AI se projeví ve velocity, ne ve výkazech.

### 8.5 Auto-kalibrace CW heuristiky (po 1. PI)

Po prvním Planning Intervalu vznikne dostatečná ground truth: manuálně potvrzené CW za 4–5 uzavřených iterací. Od tohoto okamžiku se CW heuristika může automaticky kalibrovat optimalizační smyčkou inspirovanou Karpathyho autoresearch patternem.

Princip: one file, one metric, one loop.

```text
Target:     cw_heuristics.yaml (pravidla mapování evidence → CW)
Metric:     mean_absolute_deviation (průměrná odchylka auto-CW od ground truth)
Direction:  lower
Eval:       python scripts/evaluate_cw.py --ground-truth last_pi
Budget:     50–100 experimentů, ~2h overnight
Memory:     git log na calibration branchi
```

Smyčka:
1. Agent načte historii experimentů a aktuální výsledky
2. Navrhne jednu změnu v heuristice (threshold, váha signálu)
3. Commitne změnu
4. Spustí evaluaci proti ground truth
5. Pokud MAD klesla → keep. Pokud ne → revert.
6. Opakuje.

Bezpečnostní constraint: agent nesmí editovat evaluate_cw.py (evaluátor). Oddělení optimalizátoru od cílové funkce zabraňuje gaming.

Kdy aktivovat: nejdříve po 1. PI (10 týdnů), kdy existuje ≥ 20 manuálně potvrzených CW záznamů.

Očekávaný přínos: přesnější CW bez manuální diskuse na retrospektivě, snížení odchylky o 15–30 % oproti statické heuristice.

---

## 9. Implementace v GitHub

### 9.1 Custom fields

| Field | Typ | Hodnoty |
|---|---|---|
| Issue Type | Issue type | Initiative, Epic, Feature, Story, Task, Bug |
| Job Size | Number | Fibonacci 1–20 |
| Business Value | Number | Fibonacci 1–20 |
| Time Criticality | Number | Fibonacci 1–20 |
| Risk Reduction | Number | Fibonacci 1–20 |
| WSJF Score | Number | Auto |
| Planning Interval | Iteration | 5 nebo 10 týdnů |
| Iteration | Iteration | 1 nebo 2 týdny |
| Team | Single select | Týmové hodnoty |
| Primary Owner | Assignee | Accountable owner |
| Confidence | Single select | Low / Medium / High |

Co nedržet jako GitHub field: Iteration Capacity, Derived Hours, FTE, podpisový stav.

### 9.2 GitHub Actions

| # | Action | Trigger | Funkce |
|---|---|---|---|
| 1 | WSJF Calculator | Field change (BV/TC/RR/JS) | Auto-výpočet WSJF |
| 2 | Contributor Detector | PR merge, review, issue activity | Detekce kontributorů a evidence |
| 3 | Iteration Close | Manuální dispatch | Snapshot + výkazy (MD/JSON/XLSX) + per-item alokace |
| 4 | PI Close | Manuální dispatch | Agregace iterací |
| 5 | Velocity Tracker | Iteration/PI close | Velocity JSON + dashboard |

### 9.3 Branch naming
```text
feature/S-200-omop-parser
bugfix/S-215-upload-validation
feature/F-102-anon-engine
```
CI check blokuje PR bez reference na issue (S-XXX, F-XXX, E-XXX).

### 9.4 Definition of Ready
Žádný item nejde do delivery bez: Issue Type, Parent, Job Size, BV+TC+RR, Owner. Contributor je povinný nejpozději při vstupu do reálné delivery evidence.

---

## 10. Výkazy a audit

### 10.1 Pipeline
```text
Iteration Close → per osoba:
  /reports/iteration-{I}/vykaz-{osoba}.md
  /reports/iteration-{I}/vykaz-{osoba}.json
  /reports/iteration-{I}/summary.xlsx
  /reports/iteration-{I}/item-costs.xlsx    ← per-item pohled

PI Close → agregace:
  /reports/planning-interval-{PI}/summary.xlsx

Rok:
  /reports/2026/annual.xlsx
```

### 10.2 Freeze rule
Po Iteration Close: vznikne snapshot, je frozen, evidence se nepřepisuje in-place, každá oprava je nová revize. Zásadní pro auditní obhajobu.

### 10.3 Auditní princip
Průkaznost stojí na: GitHub delivery evidence + capacity registry + frozen snapshot + reprodukovatelný výpočet + podepsaný výstup (BankID).

---

## 11. Předpoklady a rizika

| Předpoklad | Detail |
|---|---|
| Všechny items se uzavírají | Nedodané se přesouvají, nemazou |
| Kapacita potvrzena při Iteration Planning | Každý člen potvrdí dostupnost |
| Branch naming dodržen | CI check vynucuje S-/F-/E-XXX |
| Job Size konzistentní per úroveň | Planning Poker, referenční items |
| CW se kalibruje po prvních Iteracích | Retrospektiva vyhodnotí heuristiku |

| Riziko | Dopad | Mitigace |
|---|---|---|
| Auditor neuzná model | Vysoký | Metodika, frozen snapshoty, reprodukovatelnost, BankID |
| CW heuristika neodpovídá | Střední | Override + kalibrace |
| Commit bez S-/F-/E-XXX | Střední | CI check blokuje PR |
| PM/Arch práce bez commitů | Střední | Comments + /contribute |
| 0 relevantních items | Nízký | Procesní eskalace |

---

## 12. Srovnání s alternativami

| Vlastnost | Fixed Split v1 | Evidence-Driven v2.2 | Ruční timesheets |
|---|---|---|---|
| Předem fixované koše | Ano | Ne | Ne |
| Prázdné úrovně | Problém | Neexistují | N/A |
| Per-person pohled | Ano | Ano (primární) | Ano |
| Per-item pohled | Ne | Ano (dual-view) | Ne |
| Cross-funkční spolupráce | Omezená | Plná | Plná |
| Automatizace | Střední | Vysoká | Žádná |
| Matematická garance | Složitější | Nativně | Ne |

---

## 13. Implementační plán

| Fáze | Čas | Obsah |
|---|---|---|
| Den 1 | 6h | GitHub org, Projects setup, custom fields |
| Týden 1 | 3 dny | Actions 1–2 (WSJF + Contributor Detector) |
| Týden 2 | 2 dny | Actions 3–5 (Iteration Close + PI Close + Velocity) |
| Iterace 1 | 1–2 týdny | Pilotní provoz, první výkazy, kalibrace CW |
| Retro po 1. PI | 1 den | Kadence, CW accuracy, velocity, dual-view validace |

---

## 14. Závěr

Finální metodika v2.2 stojí na principu:

> **Člověk deklaruje kapacitu za období.**
> **Systém identifikuje work items, na kterých se prokazatelně podílel.**
> **Kapacita se rozpadne poměrně podle Job Size a contribution relevance.**

Jádro modelu:

> **Derived Time = Capacity × poměr score work itemu vůči celku**
> **Score = Job Size × Contribution Weight × Relevance Signal**
> **Bez LevelFactoru.**

Dva komplementární pohledy:

> **Per-person:** Σ DerivedHours[P, *] = Capacity[P, I] → výkazy
> **Per-item:** Σ DerivedHours[*, item] = celková investice do itemu → nákladová alokace
