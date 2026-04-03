<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->
<!-- Sources: [jaffer-strategic-lens], [jaffer-strategy-vc], [jaffer-course] — see AI_PMF_BIBLIOGRAPHY.md -->
<!-- Note: Section 4 (9 Shifts) is from the Maven course, not the published article [jaffer-9-shifts] -->

# AI Product-Market Fit — Strategy and Positioning

> **Purpose:** Agent-readable reference for strategic analysis, positioning, product management shifts, and feasibility assessment of AI products.
> **Usage:** Lookup by framework for pain point validation, positioning templates, strategic lens application, PM shift awareness, and feasibility checking.

---

## Section 1: 5-Question Pain Point Analysis (AI Lens)

Use these five questions to validate whether a pain point is AI-shaped before committing resources.

| # | Dimension | Question | AI Consideration | Green Signal | Red Signal |
|---|-----------|----------|-----------------|--------------|------------|
| 1 | **Magnitude** | How many people have this pain? | Does it exist across industries for horizontal AI application? | Pain appears in 3+ verticals | Pain is niche to one sub-segment |
| 2 | **Frequency** | How often is it experienced? | Frequent enough to generate training data? | Daily/weekly occurrence with rich data exhaust | Rare events with sparse data |
| 3 | **Severity** | How bad is it? | Involves cognitive load or pattern recognition where AI excels? | Requires judgment, synthesis, or interpretation | Requires physical action or simple lookup |
| 4 | **Competition** | Who else solves it? | Current solutions limited by human constraints AI could transcend? | Existing solutions bottlenecked by human throughput | Incumbent software already solves it well |
| 5 | **Contrast** | Big complaint against current solutions? | Users complain about lack of personalization, speed, or intelligence? | Users explicitly request smarter, faster, more adaptive tools | Users satisfied with current tooling |

### Scoring

Each question: Yes (2) / Partial (1) / No (0). **Total >= 7 = strong AI fit.**

---

## Section 2: AI Positioning Template

Five positioning questions every AI product must answer clearly before launch.

| # | Question | Positioning Type | What It Clarifies |
|---|----------|-----------------|-------------------|
| 1 | **Who is this for?** | Identity positioning | Target user segment and their self-image |
| 2 | **What job does it solve perfectly?** | JTBD positioning | Core job-to-be-done the product owns |
| 3 | **What fear or friction does it remove?** | Psychological positioning | Emotional barrier the product eliminates |
| 4 | **What emotional promise does it offer?** | Value positioning | Aspirational outcome users feel |
| 5 | **Who is this NOT for?** | Exclusion positioning | Deliberate exclusion that sharpens focus |

### Key Insight

> "Positioning is about who you are NOT serving."

### Positioning Diagnostic

```
For each question, write a one-sentence answer:

1. Who is this for? _______________
2. What job does it solve perfectly? _______________
3. What fear or friction does it remove? _______________
4. What emotional promise does it offer? _______________
5. Who is this NOT for? _______________

Clarity test: Can a stranger read all 5 and understand the product in 30 seconds?
```

---

## Section 3: AI Strategic Lens

Three lenses for AI product strategy — each answers a different strategic question.

### Market Lens — Where to Play

| Position | Description | Example |
|----------|-------------|---------|
| **Pioneer** | Create a new category that didn't exist before | OpenAI creating the "AI assistant" category |
| **Disruptor** | Replace an incumbent with an AI-native approach | Cursor disrupting traditional code editors |
| **Enhancer** | Augment existing products/workflows with AI capabilities | GitHub Copilot enhancing VS Code |

### Value Lens — How to Win

> Build moats with data you own, not features you ship.

Features are cloned in weeks. Proprietary data, user behavior loops, and workflow embedding create durable advantages. Focus investment on what compounds over time.

### Execution Lens — How to Deliver

**The AI Decision Triangle:** Cost vs. Capability vs. Speed — pick two, sacrifice one.

| Trade-off | What You Get | What You Sacrifice |
|-----------|-------------|-------------------|
| Capability + Speed | Powerful, fast product | High inference costs |
| Capability + Cost | Powerful, affordable product | Slower response times |
| Speed + Cost | Fast, cheap product | Limited AI capability |

### Strategic Lens Diagnostic

```
Market Lens: Are you a Pioneer / Disruptor / Enhancer?
  Position: _______________
  Evidence: _______________

Value Lens: What data do you own that competitors cannot replicate?
  Data asset: _______________
  Compounding mechanism: _______________

Execution Lens: Which two of Cost/Capability/Speed are you optimizing?
  Optimizing: _______________ + _______________
  Sacrificing: _______________
  Justification: _______________
```

---

## Section 4: Nine Shifts in AI Product Management

> **Attribution:** These operational shifts are from the Maven course [jaffer-course] via [aatir-course-summary]. The published article of the same name [jaffer-9-shifts] covers a different, futuristic set of transformations (Infinite Creation Capacity, Hyper-Personalization at Scale, etc.). The shifts below are more immediately actionable for AI PMs.

AI has fundamentally changed what it means to be a product manager. These nine shifts define the new landscape.

| # | Shift | Implication |
|---|-------|-------------|
| 1 | **AI makes product mistakes obvious and immediate** | Bad PM decisions surface faster; there is no hiding behind long release cycles |
| 2 | **Feature thinking -> System thinking** | PMs must think in systems (context, retrieval, reasoning, tools, UX) not isolated features |
| 3 | **Compressed timelines and expectations** | What took quarters now takes weeks; stakeholders expect AI-speed delivery |
| 4 | **Old product hierarchy is dead** | Traditional PM career ladders and org structures don't map to AI product work |
| 5 | **Two types of PMs: AI-Adjacent vs. AI-Native** | AI-Adjacent PMs add AI to existing products; AI-Native PMs build AI-first products — different skills required |
| 6 | **AI amplified judgment, not creativity** | AI didn't suddenly turn everyone into a brilliant PM; it made the cost of being a bad PM immediate and brutally visible |
| 7 | **Distribution became a PM responsibility** | In AI, distribution is PMF; PMs own go-to-market, not just product |
| 8 | **The middle disappears** | Mediocre products die faster; AI accelerates the gap between great and average |
| 9 | **PMs now manage trust, not features** | The core PM deliverable shifted from feature specs to trust architecture |

### Key Quotes

> "AI didn't suddenly turn everyone into a brilliant PM. AI simply made the cost of being a bad PM immediate and brutally visible."

> "Distribution isn't the sequel to PMF. In AI, distribution is PMF."

---

## Section 5: AI Product Feasibility Checklist

15 questions to assess whether an AI product idea is technically and strategically feasible. Answer all before committing to build.

| # | Question | What It Tests |
|---|----------|---------------|
| 1 | Is the task deterministic, probabilistic, or agentic? | Architecture choice — rules engine vs. LLM vs. agent framework |
| 2 | Do users need accuracy, speed, or both? | Model selection and latency budget |
| 3 | Does the workflow require context the system doesn't yet capture? | Context pipeline investment required |
| 4 | Does the system require memory? | Session vs. persistent state architecture |
| 5 | Is retrieval needed or is reasoning enough? | RAG infrastructure requirement |
| 6 | Chat interface or structured modal? | UX architecture — conversational vs. form-based |
| 7 | Worst-case scenario of autonomous actions? | Risk assessment and guardrail requirements |
| 8 | Should system ask clarifying questions before executing? | Interaction design — proactive vs. reactive |
| 9 | How will uncertainty be displayed? | Confidence UI and trust layer design |
| 10 | What constraints must be enforced at all times? | Safety rails and compliance requirements |
| 11 | Where does workflow break if context is missing? | Failure mode identification |
| 12 | What is the fallback behavior? | Graceful degradation design |
| 13 | What metrics distinguish success from instability? | Monitoring and evaluation strategy |
| 14 | What is the latency budget? | Infrastructure and model tier decisions |
| 15 | What is the minimum viable intelligence level? | MVP scoping — how smart must V1 be? |

### Feasibility Score

```
For each question, mark: Answered (2) / Partially answered (1) / Unknown (0)

Total: ___/30

>=24: Ready to build — clear technical understanding
16-23: Gaps exist — investigate unknowns before committing
<16: Too many unknowns — return to D1 Discover phase
```

---

## Section 6: 4D Strategy Framework

> **Important:** This is DIFFERENT from the 4D Method in AI_PMF_PRODUCT.md. The 4D Method (Discover/Design/Develop/Deploy) is about building products. The 4D Strategy (Direction/Differentiation/Design/Deployment) is about market positioning and survival.

| Dimension | 4D Method (Product) | 4D Strategy (Strategy) |
|-----------|-------------------|----------------------|
| Focus | How to BUILD an AI product | How to POSITION in the market |
| The 4 Ds | Discover → Design → Develop → Deploy | Direction → Differentiation → Design → Deployment |
| Input | User pain point | Market landscape |
| Output | Functional AI feature | Defensible market position |
| Audience | PM + Engineering | Founder + VC |
| Published in | creatoreconomy.so, productmanagement.ai | thevccorner.com (VC-oriented) |

### Decision 1: DIRECTION — Choosing the Moat That Compounds

Three defensible moats:

- **Data Moat** (most durable, grows with each user; example: Duolingo)
- **Distribution Moat** ("everything" in AI; example: Notion had millions of embedded users)
- **Trust Moat** (most underrated; example: Anthropic positioned on safety)

Key questions per moat type.

### Decision 2: DIFFERENTIATION — Surviving Commoditization

Core problem: If your product is "AI that does X," OpenAI eventually eats you.

Strategic questions:

- What specific failure mode of foundation models do I solve better?
- Where are general-purpose models overkill?
- How do workflow, UX, and integrations create stickiness?

Case studies table: Perplexity (retrieval-first), Runway (creator focus)

### Decision 3: DESIGN — Adoption + Cost Efficiency

**Adoption:** Kill friction, meet users where they work, Minimum Viable Intelligence

**Cost Efficiency Principles:**

- **Model Routing** (don't send everything to GPT-5)
- **Caching** (don't pay 1000x for identical queries)
- **Prompt Optimization** (every token costs money)
- **Batching** (combine requests)

### Decision 4: DEPLOYMENT — Scaling Without Blowing Up

- **Pricing Strategy** (usage-based/hybrid early, tie to value)
- **Infrastructure Strategy** (multi-model, play vendors against each other)
- **Team Strategy** (hire people who say "no" to beautiful demos destroying margins)

---

## Section 7: AI Strategy Death Spiral (3 Traps)

| Trap | Description | Case Study |
|------|-------------|-----------|
| **Red Ocean Trap** | AI amplifying competition in existing markets; startups crushed when leaders replicate | Chegg lost 90% value, Kite lost to Copilot |
| **"Cool Demo" Trap** | Easy to ship magic demos; die in "last 20%" — gap between demo and reliable product | Jasper raised $100M+, then ChatGPT commoditized it |
| **Platform Trap** | Building on foundation model APIs = building on quicksand | 3 harsh realities: differentiation evaporates, platform risk, no moat ownership |

> "If your product is 'AI that does X,' OpenAI eventually eats you."

---

## Section 8: 3 Non-Negotiable Dimensions of AI Strategy

1. **Probabilistic Outputs** — Designing for variability and trust in non-deterministic systems
2. **Compounding Loops** — Building proprietary data and feedback mechanisms that get smarter with use
3. **Economic Alignment** — Managing inference costs so AI scales profitably at 10x, 100x users

---

## Section 9: 7-Step AI Product Strategy Process

### Step 1: Start With Business Value, Not Models

Wrong: "What can GPT-4 do for us?" Right: "Where can AI unlock disproportionate business value?"

#### The Value Stack (3-Layer Pyramid)

| Layer | Content |
|-------|---------|
| Top | Core user pain points |
| Middle | Business outcomes tied to pains |
| Bottom | AI's ability to compress time/cost/effort |

### Step 2: Map Your Data Flows

#### The Data Map Exercise

| Layer | Question | Example (Figma AI) |
|-------|---------|-------------------|
| Input Data | What raw signals feed the AI? | Design files |
| Feedback Data | What corrections make it smarter? | Edits, overrides |
| Context Layer | What proprietary metadata makes output unique? | Team design patterns, brand guidelines |

### Step 3: Choose Your AI UX Paradigm

| Paradigm | Description | When to Use | Example |
|----------|-------------|-------------|---------|
| **Assistant** | Embedded helper | Trust needs to build gradually | Notion AI, GitHub Copilot |
| **Agent** | Autonomous task executor | Repetitive & structured workflows | Zapier AI Agents |
| **Autonomous** | Fully automated outcomes | Outputs are deterministic | — |
| **Embedded Intelligence** | Invisible AI improving workflows | AI augments without user disruption | Perplexity AI |

### Step 4: Build Domain-Specific Evals

Do NOT use foundation model benchmarks (MMLU). Define "Good" in your domain.

| Domain | "Good" Means | "Good" Does NOT Mean |
|--------|-------------|---------------------|
| Sales AI | Increased close rate | Perfect grammar |
| Coding AI | Reduced bug rate | Syntactic accuracy |
| Support AI | Faster resolution + CSAT | Token diversity |

### Step 5: Design Compounding Feedback Loops

| Layer | Type | What It Captures |
|-------|------|-----------------|
| Micro | Immediate correction | User edits AI output |
| Meso | Workflow signals | What users adopt or abandon |
| Macro | Business impact | ROI, retention |

### Step 6: Align Business Model With AI Economics

Checklist:

- [ ] Do you know your cost per inference?
- [ ] Do you have a model-mixing plan (GPT-4 → distilled → cached)?
- [ ] Is your pricing value-based or token-based?

### Step 7: Make Trust a Feature

Three Trust Levers:

| Lever | Description |
|-------|-------------|
| **Transparency** | Show confidence scores, sources, reasoning |
| **Control** | Easy undo/override mechanisms |
| **Progressive Autonomy** | Start with suggestions → earn the right to automate |

---

## Section 10: Founder's Playbook (5 Moves)

### Play 1: Stress-Test AI Unit Economics

Model at 10x and 100x scale. Danger zones:

- AI costs >20% of revenue = danger
- AI costs 40-50% = death spiral

### Play 2: Write AI PRDs With Cost & Adoption Sections

Every AI PRD requires: Cost Analysis (cost per user, at 10K users, reduction strategies) and Adoption Analysis (one-time novelty vs daily workflow, moat reinforcement).

### Play 3: Pressure-Test Differentiation

Quarterly audit: What do we do that foundation models cannot? Where do we win where LLMs fail? What creates stickiness despite feature replication?

### Play 4: Pitch Strategy to Investors/Leadership

Investors want: Moat, Unit economics at 10x, Commoditization defense, Positioning story.

### Play 5: Hire for AI Product Leadership

Required skill intersection: Product strategy + Economics + AI mindset.

---

## Section 11: 5 Silent Killers of AI Strategy

| # | Killer | Problem | De-Risking |
|---|--------|---------|-----------|
| 1 | **Chasing Features Instead of Moats** | Features copyable; moats not | Map every feature to a moat; deprioritize unconnected ones |
| 2 | **Blind API Reliance** | Margin collapse at scale | When API costs >20% of revenue, start infra investment |
| 3 | **Mispricing AI as "Free Add-on"** | Usage scales, revenue stays flat | Always tie pricing to usage or value; cap usage in tiers |
| 4 | **Ignoring Evals and Trust** | Hallucinations destroy trust | Build eval pipelines before scale; don't ship if accuracy <90% |
| 5 | **"Scale Will Fix Economics" Delusion** | Scale often WORSENS AI margins | Model costs at 10x and 100x before launch |

---

## Section 12: 4 Critical Strategic Questions (VC Lens)

1. What's your moat when GPT-5 launches?
2. How do you survive inference costs at 100M queries/month?
3. How will you monetize profitably when usage scales 10x?
4. How will you retain customers when models get better and cheaper monthly?

---

## Section 13: The 2Ps Framework

Pricing and Positioning as paired strategic levers:

- **Pricing** controls costs, behavior, and positioning
- **Positioning** is the narrative moat — the story the market repeats

### Pricing-Positioning Alignment

| Question | If Answer Is... | Then... |
|----------|----------------|---------|
| What's my moat? | Data-heavy | Usage-based pricing (infra positioning) |
| What's my moat? | Trust-based | Outcome-based pricing (partner positioning) |
| What's my moat? | Distribution-heavy | Hybrid pricing (consumer + pro monetization) |

### Four Positioning Mistakes

1. Copying SaaS (AI ≠ zero marginal cost)
2. Hiding Costs (transparency = trust)
3. Confused Signals (align pricing + narrative)
4. No Story (write the story before the deck)
