<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->
<!-- Sources: [jaffer-pmf], [jaffer-pmf-vc] — see AI_PMF_BIBLIOGRAPHY.md -->

# AI Product-Market Fit — Core Frameworks

## 1. The AI PMF Paradox

### Definition

AI PMF is simultaneously **easier** and **harder** than traditional PMF.

| Easier Because | Harder Because |
|----------------|----------------|
| Rapid prototyping — working demos in hours | Rising expectations — users compare everything to ChatGPT |
| Behavior analysis — usage data reveals intent | ChatGPT benchmark effect — every AI product measured against frontier models |
| Personalization — adaptive experiences at scale | Monthly bar reset — each model release raises the minimum acceptable quality |

### Key Insight

> "PMF is now a subscription that companies have to keep renewing."
> — Elena Verna, *The Product-Market Fit Treadmill* (2025)
>
> Note: Often paraphrased as "PMF is a treadmill — you re-earn it every month." The verified phrasing above is from her Substack article.

### Three Structural Forces That Break Traditional Linear PMF

Traditional PMF assumes: find problem → build solution → achieve fit → scale. AI breaks this linearity through three forces:

| Force | Description | Implication |
|-------|-------------|-------------|
| **1. Problem evolves as users learn** | AI unlocks use cases users didn't imagine; exposure to AI capability reshapes what users think is possible | Your target problem shifts under your feet |
| **2. Solution space is infinite** | Constrained by data, model capability, and prompting — not developer resources or feature scope | Traditional roadmap planning breaks down |
| **3. User expectations compound exponentially** | ChatGPT acts as a universal benchmark; every frontier model release resets the bar | PMF decays if you stand still |

### Diagnostic Questions

- Is your PMF based on a stable problem or an evolving one?
- Can a foundation model update commoditize your advantage overnight?
- Are you measuring PMF continuously or treating it as a milestone?

---

## 2. Pain x Frequency x AI Advantage Scoring Matrix

### Scoring Rubric

| Dimension | Score 1-3 | Score 4-6 | Score 7-10 |
|-----------|-----------|-----------|------------|
| **Pain** | Minor annoyance; users tolerate it easily | Costs time or money regularly; users seek workarounds | Critical: costs reputation, revenue, or compliance |
| **Frequency** | Quarterly or less; rare occurrence | Weekly; regular enough to matter | Daily or continuous; constant presence in workflow |
| **AI Advantage** | Marginal improvement over non-AI solutions | Significant (2-5x better than current approach) | Step-change (10x+ improvement or enables the previously impossible) |

### Combined Score Interpretation

**Total score range: 3-30**

| Zone | Pain | Frequency | AI Advantage | Verdict |
|------|------|-----------|-------------|---------|
| **"Just a SaaS opportunity"** | High (7-10) | High (7-10) | Low (1-3) | Build traditional software; AI adds no unique value |
| **"Just a demo"** | Low (1-3) | Any | High (7-10) | Impressive but no one pays; science project territory |
| **PMF Zone** | High (7-10) | High (7-10) | High (7-10) | AI PMF is born here; pursue aggressively |
| **Gray zone** | Medium (4-6) | Medium (4-6) | Medium (4-6) | Requires deeper investigation; may become PMF zone with focus |

### Decision Tree

```
START: Score Pain, Frequency, AI Advantage (each 1-10)
│
├─ Total < 12 → STOP: Not worth pursuing
├─ Total 12-17 → INVESTIGATE: Narrow the use case, rescore
├─ Total 18-21 → PROMISING: Validate with 10 conversations (see 4D Method)
└─ Total 22-30 → PMF ZONE: Move to Design phase immediately
    │
    └─ Check: AI Advantage ≥ 7?
        ├─ Yes → True AI opportunity
        └─ No  → Consider building as traditional SaaS
```

### Worked Examples

| Use Case | Pain | Frequency | AI Advantage | Total | Verdict |
|----------|------|-----------|-------------|-------|---------|
| Healthcare billing codes | 9 | 10 | 9 | 28 | **PMF Zone** — High cognitive load, massive volume, AI excels at pattern matching across coding systems |
| Email subject lines | 3 | 6 | 4 | 13 | **Demo territory** — Low pain, moderate frequency, marginal AI advantage over A/B testing |
| Legal contract review | 8 | 7 | 8 | 23 | **PMF Zone** — High stakes, regular occurrence, AI handles unstructured doc interpretation |
| Meeting scheduling | 5 | 8 | 3 | 16 | **Investigate** — High frequency but traditional calendar tools already solve most pain |

### 5-Question Pain Point Analysis (AI Lens)

Use these questions to validate whether a pain point is AI-shaped:

| # | Question | What You're Testing | Green Signal | Red Signal |
|---|----------|--------------------|--------------| -----------|
| 1 | **Magnitude:** Does pain exist across industries? | Horizontal potential; larger TAM | Pain appears in 3+ verticals | Pain is niche to one sub-segment |
| 2 | **Frequency:** Enough occurrence to generate training data? | Data flywheel viability | Daily/weekly occurrence with rich data exhaust | Rare events with sparse data |
| 3 | **Severity:** Involves cognitive load or pattern recognition where AI excels? | AI-shaped problem fit | Requires judgment, synthesis, or interpretation | Requires physical action or simple lookup |
| 4 | **Competition:** Current solutions limited by human constraints AI could transcend? | Competitive moat potential | Existing solutions bottlenecked by human throughput | Incumbent software already solves it well |
| 5 | **Contrast:** Users complain about lack of personalization, speed, or intelligence? | User pull signal | Users explicitly request smarter, faster, more adaptive tools | Users satisfied with current tooling |

**Scoring:** Each question = Yes (2) / Partial (1) / No (0). Total ≥ 7 = strong AI fit.

---

## 3. Invisible Pain Points

### Definition

Friction so deeply embedded in workflows that users don't recognize it as a problem. They describe it as "just part of the job."

### Discovery Methodology

| Method | How to Execute | What to Look For |
|--------|---------------|------------------|
| **Shadow workflows** | Watch what users actually do, not what they say; record screen sessions, sit beside them | Steps users skip explaining; actions they consider "obvious" |
| **Time allocation analysis** | Map where 40%+ of time goes on tasks described as routine | High-volume activities users never question |
| **Workaround detection** | Catalog elaborate processes that exist because automation didn't | Spreadsheets-as-databases, copy-paste pipelines, manual data reconciliation |
| **Zero-creativity tasks** | Identify high-volume actions requiring zero human judgment | Tasks where humans are acting as slow, expensive routers |

### Discovery Checklist

```
- [ ] Observed 5+ users performing actual work (not demos)
- [ ] Identified at least 3 tasks consuming >30 min/day
- [ ] Found at least 1 workaround involving copy-paste or manual data transfer
- [ ] Documented at least 1 zero-creativity task with >50 daily occurrences
- [ ] Validated that users describe the pain as "normal" or "just how it works"
```

### Example: Klarna's Invisible Pain

- **Surface problem:** Customer support wait times
- **Invisible pain:** 11-minute waits for simple payment queries requiring zero creativity
- **Why invisible:** Both customers and agents accepted it as normal
- **AI solution:** AI agent handles zero-creativity queries instantly
- **Result:** Equivalent work of 700 full-time agents; resolution time from 11 minutes to 2 minutes

### Anti-Pattern: Feature Augmentation

> "Taking an existing workflow and adding AI on top" = feature augmentation, not innovation.

| Feature Augmentation (Bad) | Invisible Pain Solve (Good) |
|---------------------------|----------------------------|
| Add AI autocomplete to existing form | Eliminate the form entirely — AI infers intent |
| Add AI summary button to long document | AI surfaces the relevant paragraph before user searches |
| Add chatbot to existing help center | AI resolves the issue before user reaches help center |

### AI-Shaped Pain Test

> "Can this pain **only** be solved through AI's unique capabilities?"

| AI Unique Capability | Example Application |
|---------------------|-------------------|
| Cognitive load reduction | Summarizing 50-page contracts into 3 decision points |
| Pattern recognition at scale | Detecting billing anomalies across 10M transactions |
| Unstructured data interpretation | Extracting structured data from handwritten forms |
| Real-time personalization | Adapting interface and recommendations per-user per-session |

If the answer is "a rules engine or traditional software could do this" — it is not an invisible pain that needs AI.
