<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->

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
