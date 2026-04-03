<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->
<!-- Sources: [jaffer-course], [jaffer-prd] — see AI_PMF_BIBLIOGRAPHY.md -->

# AI Product-Market Fit — AI PRD Template

> **Purpose:** Agent-readable reference for creating AI Product Requirements Documents with AI-specific considerations.
> **Usage:** Lookup by PRD section, non-functional requirement type, or case study reference.

---

## 1. AI PRD as Alignment Tool

### Three Core Functions

The AI PRD serves three interdependent purposes that together ensure alignment across the entire product lifecycle:

| Function | What It Covers | Who It Aligns |
|----------|---------------|---------------|
| **Strategic Context** | Market opportunity, strategic fit, competitive position | Leadership, investors, strategy team |
| **Product & Technical Excellence** | User needs, scope, NFRs, AI-specific requirements | Engineering, design, data science, QA |
| **Go-to-Market** | Launch phases, adoption targets, growth metrics | Marketing, sales, customer success |

### Living Document / Continuous PRM

The AI PRD is not a one-time artifact. It functions as a **Continuous Product Requirements Model (PRM)** — a living document that evolves as:

- Model capabilities shift (foundation model updates, new architectures)
- User expectations compound (ChatGPT benchmark effect)
- Market conditions change (regulatory shifts, competitor launches)
- Usage data reveals new patterns (emergent use cases, failure modes)

**Review cadence:** Re-evaluate every model upgrade, every quarter, and every time a competitor ships a significant update.

### Key Insight

> "The AI PRD isn't just documentation, it's a forcing function for thinking through all the ways AI can fail."
> — Miqdad Jaffer

---

## 2. Quick AI PRD (4 Questions)

### When to Use

Use the Quick AI PRD for rapid triage before committing to a full PRD. Suitable for:

- Hackathon ideas that need a sanity check
- Feature requests from stakeholders that involve AI
- Early-stage exploration before resource commitment

### The Four Questions

| # | Question | What a Good Answer Looks Like | Red Flag |
|---|----------|-------------------------------|----------|
| 1 | **What task are we automating?** | Specific, bounded task with clear start/end (e.g., "generating product descriptions from attributes") | Vague scope ("making things smarter") |
| 2 | **How painful is that task today?** | Quantified pain: hours spent, error rates, cost per task, user complaints | No data, just assumptions ("users probably hate it") |
| 3 | **What does success look like?** | Measurable target (e.g., 50% repeat usage within 30 days, 3x speed improvement) | Vanity metrics ("lots of users try it") |
| 4 | **What are our most significant risks?** | Named and ranked risks (e.g., hallucinations in medical context, bad UX causing abandonment, zero trust from enterprise buyers) | "No major risks" or hand-waving |

### Decision Rule

- **All 4 answered credibly** → Proceed to full AI PRD
- **Questions 1-2 strong, 3-4 weak** → Research phase needed before PRD
- **Question 2 weak** → Stop. No pain means no product.

---

## 3. Full AI PRD Template — 9 Sections

### 3.1 Executive Summary

**Purpose:** One-paragraph alignment anchor. Anyone reading only this section should understand the initiative, its success criteria, and the timeline.

**Key Questions:**
- What are we building and why?
- What does success look like in measurable terms?
- What is the timeline and key milestones?

**Recommended Tools:** None — this is pure synthesis of the sections below.

**Example of Good Response:**
> "We are building an AI-powered product description generator for Shopify merchants, targeting a 60% reduction in time-to-publish and 15% improvement in conversion rates. Launch to beta in Q3 2023, GA by Q4 2023. Success = 15% weekly active usage among target merchants within 180 days."

**Example of Bad Response:**
> "We want to add AI to our platform to help merchants. The AI will generate content. We expect good results."

**Common Traps:**
- Writing the executive summary first instead of last
- Including technical implementation details
- Omitting measurable success criteria

**Advice:** Write this section last. It should be a distillation, not a starting point. If you cannot summarize the initiative in one paragraph, the initiative is not well-understood.

---

### 3.2 Market Opportunity

**Purpose:** Establish that the market is large enough, growing, and receptive to AI-powered solutions. Ground the initiative in economic reality.

**Key Questions:**
- What growth stage is this market in? (emerging, growth, mature, declining)
- What is the CAGR and projected TAM?
- Are there regulatory tailwinds or headwinds?
- How is AI adoption trending in this market segment?

**Recommended Tools:**
- Industry Lifecycle Model (identify growth stage)
- Technology Adoption Lifecycle (identify adopter segment)

**Example of Good Response:**
> "The e-commerce content generation market is in growth stage with 23% CAGR. TAM estimated at $4.2B by 2025. Regulatory environment is favorable — no content-specific AI regulations affect this use case. AI adoption among SMB merchants is at early majority phase."

**Example of Bad Response:**
> "E-commerce is a big market. AI is trending. Lots of opportunity."

**Common Traps:**
- Confusing TAM with SAM or SOM
- Ignoring regulatory risks (especially for AI in regulated industries)
- Assuming current growth rates continue indefinitely

**Advice:** Always cite sources for market data. If you cannot find reliable data, state assumptions explicitly and flag them for validation.

---

### 3.3 Strategic Alignment

**Purpose:** Connect the initiative to company vision, strategy, and current objectives. Ensure the AI initiative is not an isolated experiment.

**Key Questions:**

For **AI Product** (standalone AI offering):
- How does this create a new revenue stream or market position?
- Does it align with the company's 3-year vision?
- What strategic bets does this represent?

For **AI Feature** (AI capability within existing product):
- Which existing product objective does this accelerate?
- Does this strengthen or dilute the core product value?
- What is the opportunity cost of building this vs. other features?

**Recommended Tools:**
- Lean Canvas (for new AI products)
- Product Strategy Canvas (for AI features within existing products)

**Example of Good Response:**
> "Shopify's 2023 strategy prioritizes merchant efficiency. Auto Write directly supports OKR-3: 'Reduce merchant operational burden by 30%.' This is an AI Feature play — enhancing Shopify Magic, our AI feature suite, not a standalone product."

**Example of Bad Response:**
> "AI is the future and we need to be in this space. Our competitors are doing it."

**Common Traps:**
- Justifying with competitive pressure rather than strategic fit
- Conflating "AI Product" and "AI Feature" strategies
- Missing opportunity cost analysis

**Advice:** If strategic alignment requires more than two sentences to explain, the alignment is probably weak.

---

### 3.4 Customer & User Needs

**Purpose:** Ground the initiative in validated user pain. Identify segments, personas, jobs-to-be-done, and constraints.

**Key Questions:**
- Who are the target customer segments?
- What are the key personas within each segment?
- What jobs are they trying to get done?
- What are their current pain points and workarounds?
- What constraints do they operate under (budget, skill, time, compliance)?

**Recommended Tools:**
- Opportunity Score (importance vs. satisfaction gap analysis)
- JTBD Framework (jobs-to-be-done mapping)

**Example of Good Response:**
> "Segment: SMB merchants with <50 products. Persona: Solo operator, non-native English speaker, managing inventory + marketing. JTBD: 'Create compelling product descriptions that drive conversions.' Pain: Spends 2+ hours daily on manual writing. Workaround: Copy-pasting competitor descriptions (compliance risk). Constraint: Cannot afford copywriters ($500+/month)."

**Example of Bad Response:**
> "Our users want AI features. Merchants need help with content."

**Common Traps:**
- Describing demographics instead of behaviors and needs
- Assuming pain without validation (surveys, interviews, usage data)
- Ignoring constraints that affect adoption

**Advice:** Every pain point should have evidence. State the source: "n=47 survey respondents," "support ticket analysis (Q2 2023)," or "user interview cohort." If the evidence is thin, say so.

---

### 3.5 Value Proposition & Messaging

**Purpose:** Articulate what problems the AI solution addresses per segment, what capabilities it provides, how users benefit, and how it differentiates from alternatives.

**Key Questions:**
- What specific problems does this address for each segment?
- What capabilities does the AI provide?
- What measurable benefits do users gain?
- How does this differentiate from alternatives (including non-AI solutions)?

**Recommended Tools:**
- Value Proposition Template (problem → capability → benefit → differentiation)
- Value Curve (visual comparison against alternatives on key dimensions)

**Example of Good Response:**
> "Problem: Manual product descriptions take 2+ hours/day. Capability: LLM-generated descriptions from product attributes + images. Benefit: Cuts writing time by 80%, improves SEO score by 25%, increases conversion rate by 15%. Differentiation: Only solution integrated into Shopify's product editor with access to merchant's own sales data for personalization."

**Example of Bad Response:**
> "We use AI to help merchants write better. It's faster and smarter than doing it manually."

**Common Traps:**
- Listing features instead of benefits
- Claiming differentiation that is easily replicable
- Not segmenting the value proposition by user type

**Advice:** Test value propositions with real users before finalizing. The words users use to describe the value are more important than the words you write in the PRD.

---

### 3.6 Competitive Advantage

**Purpose:** Establish why the AI advantage is durable and defensible. AI alone is not a moat — the question is what makes *your* AI implementation hard to replicate.

**Key Questions:**
- What makes this advantage defensible?
- How long will this advantage last?
- What would it take for a competitor to replicate this?

**Recommended Tools:**
- Competitive Advantage MOATs (see AI_PMF_MOATS.md for full taxonomy)

**Example of Good Response:**
> "Defensibility rests on three layers: (1) Platform integration — embedded in Shopify's product editor, zero-friction activation; (2) Proprietary data — trained on anonymized conversion data from 4M+ merchants; (3) Network effect — each merchant's usage improves recommendations for similar merchants. Replication cost: 3+ years of platform data + deep commerce domain expertise."

**Example of Bad Response:**
> "We're first to market. Our team is experienced. We use the latest models."

**Common Traps:**
- Claiming "first mover advantage" (historically weak in AI)
- Confusing model selection with competitive advantage
- Ignoring how fast the competitive landscape moves in AI

**Advice:** If your moat is "we use GPT-4" or "we have a great team," you do not have a moat. See AI_PMF_MOATS.md for defensible moat categories.

---

### 3.7 Product Scope and Use Cases

**Purpose:** Define what the AI product or feature actually does, its key capabilities, success criteria, and highest-risk assumptions to test.

**Key Questions:**
- What are the key capabilities in scope for this release?
- What prototypes or proofs-of-concept exist?
- What are the desired outcomes and success metrics?
- What are the highest-risk assumptions to validate?

**Recommended Tools:**
- Flowcharts (user journey mapping)
- User Flows (step-by-step interaction design)
- Prototypes (interactive mockups for user testing)
- Usability Testing (structured validation of key flows)

**Example of Good Response:**
> "Scope: Single-product description generation from title + attributes + image. Capabilities: (1) Generate 3 description variants per product, (2) Adjust tone (professional/casual/luxury), (3) Include SEO keywords. Success: 15% WoW usage growth, 80% positive feedback on generated content. High-risk assumption: Merchants trust AI-generated content enough to publish without editing."

**Example of Bad Response:**
> "The AI will generate product descriptions. Users can edit them. We'll add more features later."

**Common Traps:**
- Scope creep ("while we're at it, let's also add...")
- Missing success criteria for individual capabilities
- Not identifying assumptions that could invalidate the entire initiative

**Advice:** Every capability should have a testable success criterion. If you cannot define how to test it, you do not understand it well enough to build it.

---

### 3.8 Non-Functional Requirements

#### 3.8.1 General Requirements

**Purpose:** Define performance, scalability, security, and reliability targets with measurable thresholds.

| Requirement Category | What to Specify | Example Target |
|---------------------|-----------------|----------------|
| **Performance** | Response time, throughput | P95 latency < 2s for description generation |
| **Scalability** | Concurrent users, data volume growth | Support 10K concurrent generation requests |
| **Security** | Data protection, access control, compliance | SOC 2 Type II, encrypted at rest and in transit |
| **Reliability** | Uptime, recovery time, data durability | 99.9% uptime, RTO < 15 min, RPO < 1 hour |

**Key Questions:**
- What are the performance SLAs users expect?
- What scale do we need to support at launch vs. 12 months post-launch?
- What security and compliance standards apply?
- What is the acceptable failure mode? (graceful degradation vs. hard stop)

#### 3.8.2 AI-Specific Requirements (LLMs)

**Purpose:** Define AI-specific quality, safety, and operational requirements that traditional NFRs do not cover.

| Requirement | What to Specify | Example Target |
|-------------|-----------------|----------------|
| **Accuracy** | Task-specific accuracy metric | >= 90% factual accuracy on product attributes |
| **Hallucination Rate** | Maximum acceptable hallucination rate | < 2% hallucination rate on verifiable claims |
| **Bias Audits** | Audit frequency, dimensions, thresholds | Quarterly bias audit across gender, ethnicity, age |
| **Drift Monitoring** | Quality degradation detection | Alert if accuracy drops > 5% over rolling 7-day window |
| **AI Architecture** | Model choice, retrieval strategy, prompting | GPT-4 with RAG over product catalog; chain-of-thought for complex descriptions |
| **Output Guardrails** | Content filtering, safety boundaries | Block generation of medical/legal claims; profanity filter |
| **Evaluation Metrics** | Automated + human evaluation pipeline | Weekly automated eval on 500-sample test set + monthly human review |

**Key Questions:**
- What accuracy target is required for the use case to be viable?
- What hallucination rate would damage user trust or cause legal risk?
- How will we detect and respond to model drift?
- What content should the AI never generate?

**Recommended Tools:**
- AI evaluation metrics (BLEU, ROUGE, task-specific metrics)
- Bias audits (fairness metrics across protected categories)
- RAG (Retrieval-Augmented Generation for grounding outputs in facts)
- Chain-of-thought prompting (for complex reasoning transparency)

**Common Traps:**
- Setting accuracy targets without defining the evaluation methodology
- Ignoring hallucination risk because "the model is good enough"
- No plan for drift monitoring post-launch
- Treating bias as a one-time audit rather than ongoing monitoring

**Advice:** AI-specific NFRs are where most AI PRDs fail. If this section is thin, the product will ship problems. Every AI NFR should have: a numeric target, a measurement method, a monitoring plan, and an escalation path.

---

### 3.9 Go-to-Market Approach

**Purpose:** Define how the product reaches users, in what phases, targeting which segments, with what evidence of growth.

**Key Questions:**
- What are the build/release phases? (alpha → beta → GA)
- Which segments are targeted first and why?
- What evidence will trigger progression to the next phase?
- What are the growth metrics per phase?

**Recommended Tools:**
- Crossing the Chasm (segment sequencing strategy)
- AARRR Metrics (acquisition, activation, retention, referral, revenue)

**Example of Good Response:**
> "Phase 1 (alpha, 4 weeks): 500 merchants, internal invite. Success gate: 60% generate at least 5 descriptions. Phase 2 (beta, 8 weeks): 5,000 merchants, waitlist. Success gate: 15% WoW usage growth. Phase 3 (GA): All merchants. Success gate: 10% monthly active merchant adoption within 90 days."

**Example of Bad Response:**
> "We'll launch to everyone and see what happens. Marketing will handle adoption."

**Common Traps:**
- Launching to everyone at once without a pilot phase
- No success gates between phases
- Measuring adoption by sign-ups rather than active usage
- Ignoring churn as a signal

**Advice:** Every phase needs a kill criterion. Define what would cause you to stop, pivot, or restructure — not just what success looks like.

---

## 4. AI PRD Section Summary Table

| # | Section | Purpose | Key Tools |
|---|---------|---------|-----------|
| 1 | Executive Summary | One-paragraph alignment anchor | — |
| 2 | Market Opportunity | Validate market size and growth | Industry Lifecycle Model, Technology Adoption Lifecycle |
| 3 | Strategic Alignment | Connect to company vision and objectives | Lean Canvas, Product Strategy Canvas |
| 4 | Customer & User Needs | Ground initiative in validated user pain | Opportunity Score, JTBD Framework |
| 5 | Value Proposition & Messaging | Articulate differentiated benefits per segment | Value Proposition Template, Value Curve |
| 6 | Competitive Advantage | Establish durable defensibility | Competitive Advantage MOATs |
| 7 | Product Scope and Use Cases | Define capabilities, outcomes, and assumptions | Flowcharts, User Flows, Prototypes, Usability Testing |
| 8a | Non-Functional Requirements (General) | Performance, scalability, security, reliability | SLA frameworks, compliance checklists |
| 8b | Non-Functional Requirements (AI-Specific) | Accuracy, hallucination, bias, drift | AI eval metrics, Bias audits, RAG, Chain-of-thought |
| 9 | Go-to-Market Approach | Phased launch with evidence-based progression | Crossing the Chasm, AARRR Metrics |

---

## 5. AI PRD with Cost & Adoption Sections

Every AI PRD requires two additional analyses before greenlighting. These are not optional appendices — they are decision gates.

### Cost Analysis

| Question | Why It Matters | Example |
|----------|---------------|---------|
| What is the estimated cost per user per month? | Unit economics must work at scale | $0.12/user/month at current usage patterns |
| At 10K users with 200 queries/month, what is the raw inference cost? | Reveals whether the business model survives scale | 2M queries/month x $0.003/query = $6,000/month raw inference |
| Can we reduce costs through cheaper models or caching? | Margin improvement pathway | Cache frequent product categories (est. 40% hit rate) → $3,600/month; switch to fine-tuned smaller model → $2,100/month |

**Key Considerations:**
- Compute costs scale linearly with usage; revenue often does not
- Model pricing changes frequently — build in flexibility
- Caching, distillation, and fine-tuning are cost levers, not afterthoughts
- Include infrastructure costs (vector DB, monitoring, evaluation pipeline)

### Adoption Analysis

| Question | Why It Matters | Example |
|----------|---------------|---------|
| Is this a one-time novelty or embedded in daily workflow? | Novelty drives trials; workflow embedding drives retention | Product description generation is a daily task — high workflow embedding potential |
| Does this feature reinforce the moat (data, trust, distribution)? | Features that strengthen the moat compound over time | Every generated description improves the product catalog model — data flywheel |

### Decision Rule

> **If you cannot answer both Cost Analysis and Adoption Analysis credibly, do not greenlight the initiative.**

- Cost unclear → Run a 2-week spike to measure actual inference costs at realistic load
- Adoption unclear → Run a 4-week pilot with usage tracking before committing to full build
- Both unclear → Return to Quick AI PRD (Section 2) and validate fundamentals

---

## 6. Case Study — Shopify Auto Write

### Context

Shopify Auto Write is an AI-powered product description generator for merchants, designed to reduce the time and skill required to create compelling product listings. This case study shows all 9 PRD sections applied to a real-world AI feature.

### 6.1 Executive Summary

Shopify will leverage large language models to automatically generate product descriptions for merchants, targeting small-to-medium merchants who lack copywriting resources. Planned for Q3 2023 launch within Shopify Magic (the platform's AI feature suite). Success criteria: 15% weekly active usage among target merchants within 180 days, 80% positive user feedback on generated content.

### 6.2 Market Opportunity

- Shopify reported 17% GMV growth to $55B in Q2 2023
- E-commerce content creation market growing at 23% CAGR
- SMB merchants (target segment) represent 78% of Shopify's merchant base
- AI content tools adoption is at early majority phase for e-commerce
- No regulatory barriers for AI-generated product descriptions in target markets

### 6.3 Strategic Alignment

- Aligns with Shopify's merchant-first strategy: reduce operational burden
- Directly supports efficiency focus: "make commerce better for everyone"
- AI Feature play (not AI Product): enhances existing Shopify Magic suite
- Strengthens platform stickiness — more AI features = higher switching cost

### 6.4 Customer & User Needs

- **Segment:** SMB merchants with < 100 products
- **Persona:** Solo operator managing all aspects of their store
- **JTBD:** "Create product descriptions that drive conversions without hiring a copywriter"
- **Pain:** 2+ hours daily spent on manual product description writing
- **Frequency:** Daily task, high severity — directly impacts sales
- **Workaround:** Copy-pasting generic descriptions or competitor content (compliance risk)
- **Constraint:** Cannot afford professional copywriting ($500+/month)

### 6.5 Value Proposition & Messaging

> "Cuts writing time from hours to seconds, improves conversions through data-informed copy, and boosts SEO with keyword-optimized descriptions."

| Dimension | Auto Write | Manual Writing | Freelance Copywriter |
|-----------|-----------|----------------|---------------------|
| Time to publish | Seconds | 15-30 min/product | 24-48 hours |
| Cost per description | ~$0.01 | Merchant's time | $25-100 |
| SEO optimization | Automated | Inconsistent | Variable |
| Consistency | High | Low | Medium |

### 6.6 Competitive Advantage

- **Platform integration:** Embedded in Shopify's product editor — zero-friction activation
- **Proprietary data:** Trained on anonymized conversion data from 4M+ merchants
- **Distribution moat:** Instant access to entire Shopify merchant base
- **Data flywheel:** Each merchant's usage improves the model for similar merchants

### 6.7 Product Scope and Use Cases

- **Capabilities:** Generate 3 description variants per product from title, attributes, and images; adjustable tone; SEO keyword integration
- **Success target:** 15% week-over-week usage growth during beta
- **Quality target:** 80% positive feedback on generated descriptions
- **High-risk assumption:** Merchants trust AI-generated content enough to publish without heavy editing
- **Prototype:** Internal prototype tested with 200 merchants; 72% published AI-generated descriptions with minor edits

### 6.8 Non-Functional Requirements

**General NFRs:**
- Model: GPT-3 Davinci-003 (cost-optimized for high-volume generation)
- Output: Streaming output for perceived speed (first token < 500ms)
- Content moderation: Automated filtering for prohibited content categories
- Platform compliance: iOS App Store compliance for in-app AI features
- Latency: Full description generated in < 5 seconds (P95)
- Availability: 99.9% uptime aligned with Shopify platform SLA

**AI-Specific NFRs:**
- Accuracy: >= 90% factual accuracy on product attributes (measured against product catalog data)
- Hallucination: < 2% hallucination rate on verifiable claims, enforced via RAG over merchant's product catalog
- Bias: Quarterly audit for tone bias across product categories and merchant demographics
- Drift: Monthly human review of 500 randomly sampled outputs; automated quality score tracking
- Guardrails: Block generation of medical claims, legal guarantees, and competitor disparagement

### 6.9 Go-to-Market

- **Phase 1 (pilot):** Launched with minimal features within Shopify Magic
- **Phase 2 (beta):** Expanded to waitlist merchants with feedback loop
- **Phase 3 (GA):** Full rollout to all eligible merchants
- **Adoption target:** 15% monthly active merchant adoption within 180 days
- **Growth evidence:** Track weekly active usage, description publish rate, and merchant retention
- **Kill criterion:** If < 5% adoption at 90 days, restructure value proposition and re-pilot

---

## 7. PRD Quality Checklist

Use this checklist to validate completeness and quality of any AI PRD before review.

| # | Section | Quality Check | Pass Criteria |
|---|---------|--------------|---------------|
| 1 | Executive Summary | Does it fit in one paragraph? | Single paragraph with initiative, success criteria, and timeline |
| 2 | Market Opportunity | Is it backed by data, not opinions? | At least 2 cited data points (TAM, growth rate, or adoption metrics) |
| 3 | Strategic Alignment | Does it connect to specific company objectives? | References a named strategy, OKR, or company goal |
| 4 | Customer & User Needs | Are needs validated with evidence? | States evidence source (e.g., n=X survey, interview cohort, usage data) |
| 5 | Value Proposition | Does it specify measurable outcomes? | At least one quantified benefit per segment |
| 6 | Competitive Advantage | Is the advantage hard to replicate? | Replication would require 12+ months or proprietary assets |
| 7 | Product Scope | Does it include testable success criteria? | Every capability has a measurable success metric |
| 8a | General NFRs | Do they have specific numeric targets? | Every requirement has a number (latency, uptime, throughput) |
| 8b | AI-Specific NFRs | Do they address accuracy, hallucination, bias, and drift? | All four dimensions present with numeric targets and measurement methods |
| 9 | GTM | Does it define phased rollout with metrics? | At least 2 phases with success gates between them |

### Scoring

- **10/10 checks pass:** PRD is ready for review
- **7-9 pass:** Address gaps before scheduling review
- **< 7 pass:** PRD needs significant rework — return to Quick AI PRD (Section 2) to validate fundamentals
