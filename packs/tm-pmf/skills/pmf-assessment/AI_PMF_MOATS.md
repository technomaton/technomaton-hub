<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->

# AI PMF Moats — Defensibility Framework

> **Purpose:** Agent-readable reference for assessing and building defensible moats in AI products.
> **Usage:** Lookup by moat type, score assessments, growth engine analysis.

---

## Section 1: Five-Moat Taxonomy

### Core Moats

| Moat Type | Definition | How to Build | How to Measure | Time to Build |
|-----------|-----------|--------------|----------------|---------------|
| Data Moat | Proprietary training data competitors can't replicate | User interactions generate unique dataset; domain-specific data partnerships; feedback loops that improve with usage | Data uniqueness score, coverage gap vs competitors, data freshness | 12-24 months |
| Behavioral Moat | Reinforcing user loops that compound | Habit formation (daily/weekly triggers), personalization that improves with use, switching costs from learned preferences | DAU/MAU ratio, session frequency trend, user-specific model improvement rate | 6-12 months |
| Workflow Moat | Deep embedding into critical business processes | Become the system of record, integrate into existing toolchains, handle edge cases competitors ignore | % of workflow dependent on product, integration depth score, replacement cost estimate | 12-18 months |
| Distribution Moat | Embedded so deeply into channels that access compounds; competitors can't easily reach the same users | Embed into existing user tools and workflows; create viral sharing mechanics; launch inside platforms where trust already exists | Channel reach, viral coefficient, cost of user acquisition vs. competitors | 6-12 months |
| Trust Moat | Reputation in high-stakes domains; once a brand becomes the "safe" choice, competitors face years of uphill battle | Consistent quality over time; transparency and citations; third-party validation; audit trails; graceful error handling | Brand trust surveys, consideration rate in enterprise procurement, repeat buyer rate | 18-36 months |

> "Trust cannot be bought. It must be earned slowly."

#### Distribution Moat Examples

- **GitHub Copilot** — embedded inside VS Code where developers already live; switching means leaving the IDE
- **Perplexity** — shareable citations create viral distribution; every answer is a potential share
- **Clay** — enrichment suggestions embedded in email/calendar; "No extra steps, no behavior change"

#### Trust Moat Examples

- **Perplexity** — clear citations for every answer build verifiable trust
- **Healthcare/Legal AI** — once a brand becomes the "safe" choice in regulated industries, competitors face years of compliance and reputation building

---

## Moat Assessment Checklist

### Scoring Rubric (per moat)

| Score | Meaning |
|-------|---------|
| 0 | Not present |
| 1 | Aspirational only — no evidence |
| 2 | Early signs — some data or behavior |
| 3 | Moderate — measurable advantage |
| 4 | Strong — difficult for competitors to replicate |
| 5 | Deep — compounding and self-reinforcing |

### Assessment Template

```
For each moat type, score 0-5:
- [ ] Data Moat: Do you have proprietary data that improves with usage?
- [ ] Behavioral Moat: Do users form habits around your product?
- [ ] Workflow Moat: Is your product embedded in critical processes?
- [ ] Distribution Moat: Do you have a channel advantage?
- [ ] Trust Moat: Do users trust your outputs enough to act on them?

Total: X/25
```

### Interpretation

| Score Range | Assessment | Implication |
|-------------|-----------|-------------|
| <10 | Critical | You're an "expensive demo that can be cloned overnight" |
| 10-15 | Fragile | One moat, vulnerable to fast followers |
| 16-20 | Defensible | Multiple reinforcing moats |
| 21-25 | Strong | Deep, compounding advantages |

---

## Key Principles

### The Commoditization Trap

> "AI itself isn't the moat. Everyone can access GPT-4o, Claude, Llama, Mistral."

### Feature-First vs Pain-First Distinction

The way you position your product determines whether you attract curiosity or budgets.

| Approach | Example Positioning | Outcome |
|----------|-------------------|---------|
| Feature-first | "We summarize meetings better than others." | Features invite curiosity |
| Pain-first | "We help sales teams recover 20% more pipeline by eliminating manual follow-ups." | Pain points drive budgets |

> "Features invite curiosity. Pain points drive budgets."

> "In SaaS, features might take years to copy. In AI, they're cloned in weeks."

> "Traction without moats is fragile. PMF without defensibility is a mirage."

### Moat Interaction Matrix

| Primary Moat | Reinforced By | Weakened By |
|-------------|--------------|-------------|
| Data | Behavioral (more usage = more data) | Low retention (data stops flowing) |
| Behavioral | Workflow (embedded habits) | Poor AI quality (habits break) |
| Workflow | Trust (users rely on outputs) | Integration fragility |
| Distribution | Behavioral (viral loops) | Commoditization of channel |
| Trust | Data (better outputs) | Hallucination incidents |

---

## Section 2: AI Growth Framework

### Three Engines of Sustainable AI Growth

| Engine | Mechanism | Flywheel | Key Metric |
|--------|-----------|----------|------------|
| Data Network Effects | Every user interaction improves AI for all users | More users -> more data -> better model -> more users | Model quality improvement per 1000 users |
| Intelligence Moats | AI performance as competitive advantage | Better performance -> higher retention -> more training signal -> better performance | Win rate vs. competitors on blind evaluation |
| Trust Compounding | User confidence driving organic growth | Trust -> usage -> demonstrated value -> referral -> new trust | NPS trend, organic growth %, referral rate |

### Engine Assessment

| Engine | Indicators Present | Indicators Absent |
|--------|-------------------|-------------------|
| Data Network Effects | Model improves measurably with usage; users notice quality gains over time | Static model quality; no feedback loop; improvements come only from vendor updates |
| Intelligence Moats | Wins blind evals vs competitors; users cite quality as reason to stay | Indistinguishable from competitors; users switch freely |
| Trust Compounding | High NPS; organic referrals; users defend product publicly | Low NPS; growth depends entirely on paid acquisition |

### Bootstrap Paradox

**Problem:** Data moats require scale to build, but differentiation is needed to achieve scale.

**Resolution strategy:**

| Phase | Focus | Moat Type |
|-------|-------|-----------|
| 1. Entry | Start with pain-point expertise | Workflow Moat |
| 2. Embed | Deep integration into critical processes | Workflow + Behavioral |
| 3. Scale | Graduate to data advantages as usage grows | Data + Network Effects |
| 4. Compound | All moats reinforce each other | Full moat stack |

### Growth Engine Diagnostic

```
For each engine, answer:

Data Network Effects:
- [ ] Does model quality improve measurably with more users?
- [ ] Is there a feedback loop from usage to model improvement?
- [ ] Can you quantify improvement per N users?

Intelligence Moats:
- [ ] Do you win blind evaluations vs competitors?
- [ ] Do users cite AI quality as primary retention driver?
- [ ] Is your performance gap widening or narrowing?

Trust Compounding:
- [ ] Is NPS trending upward?
- [ ] What % of growth is organic/referral?
- [ ] Do users increase their reliance on outputs over time?
```

---

## Moat Degradation Signals

| Signal | Indicates | Action |
|--------|----------|--------|
| Competitor launches similar feature in <30 days | No moat on that feature | Shift investment to defensible layers |
| DAU/MAU declining while new signups stable | Behavioral moat weakening | Investigate habit loop breakdown |
| Integration requests declining | Workflow moat plateauing | Expand to adjacent workflows |
| Referral rate dropping | Trust moat eroding | Audit output quality, investigate incidents |
| Data volume growing but quality flat | Data moat not converting | Fix feedback loop, improve data pipeline |

---

## Quick Reference: Moat Priority by Stage

| Company Stage | Primary Moat Focus | Secondary | Rationale |
|--------------|-------------------|-----------|-----------|
| Pre-PMF | Workflow | Trust | Embed first, earn trust |
| Early PMF | Behavioral | Data | Lock in habits, start data flywheel |
| Growth | Data | Distribution | Scale advantages, expand reach |
| Scale | All five | — | Reinforce full moat stack |

---

## Anti-Patterns

| Anti-Pattern | Description | Example |
|-------------|-------------|---------|
| Moat Mirage | Claiming a moat that doesn't exist | "We have a data moat" with 1K users and no feedback loop |
| Single Moat Dependency | Relying on one moat that can erode | Wrapper company with only a UX moat |
| Premature Moat Investment | Building moats before validating PMF | Investing in data infrastructure before confirming problem-solution fit |
| Moat Confusion | Mistaking features for moats | "Our prompt engineering is our moat" |
