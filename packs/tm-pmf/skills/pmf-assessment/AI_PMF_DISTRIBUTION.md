<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->
<!-- Sources: [jaffer-distribution], [jaffer-distribution-vc] — see AI_PMF_BIBLIOGRAPHY.md -->

# AI Product-Market Fit — Distribution

> **Purpose:** Agent-readable reference for AI product distribution strategy, PLG loops, moat flywheels, and distribution plays.
> **Usage:** Lookup by distribution layer, loop type, play number, or archetype.

---

## Section 1: The 3-Layer Distribution System

Every AI product that survives follows a three-layer progression:

| Layer | Name | Focus | Purpose |
|-------|------|-------|---------|
| 1 | GTM Wedge | Entry point | Get noticed; acquire first users with a sharp, painful problem |
| 2 | PLG Loop | Growth engine | Retain and expand; make usage self-reinforcing so you stop bleeding cash |
| 3 | Moat Flywheel | Defensibility | Compound advantage; ensure clones cannot displace you |

**Core Principle:**

> "Without the wedge, no one notices you. Without the loop, you bleed cash. Without the moat, users churn when clones appear."

The layers are sequential but overlapping. You cannot skip a layer. Most failed AI startups stall at Layer 1 — they ship a demo, not a wedge.

---

## Section 2: The GTM Wedge

### Why AI Wedges Differ from SaaS

AI wedges must be sharper than SaaS wedges for three structural reasons:

| # | Reason | Implication |
|---|--------|-------------|
| 1 | **Costs punish vague wedges** | Every API call costs money. Broad positioning means expensive, low-conversion usage. You must target a narrow pain point where willingness-to-pay exceeds inference cost from day one. |
| 2 | **Commoditization collapses broad positioning** | Foundation model improvements can replicate broad features overnight. Only wedges rooted in specific workflow pain survive commoditization waves. |
| 3 | **Speed compresses entry windows** | The time from "novel capability" to "table stakes" is months, not years. Your wedge must land before the window closes. |

### Five Advanced Wedge Characteristics

| Characteristic | Definition | Test Question |
|---------------|------------|---------------|
| **Asymmetry of Pain vs Cost** | The pain you solve is disproportionately large relative to your cost to solve it | "Does solving this $10K problem cost us $0.10 in inference?" |
| **Proof on First Use** | Users experience undeniable value in the first session, not after onboarding | "Can a new user see the magic in under 60 seconds?" |
| **Obvious Storytelling Handle** | The wedge is so clear that users can explain it in one sentence to a colleague | "Can a user describe this at lunch without a demo?" |
| **Expansion Optionality** | The wedge opens a door to adjacent problems without requiring a pivot | "Does solving this problem give us permission to solve the next three?" |
| **Resistance to Displacement** | The wedge creates switching costs or data lock-in that grow with usage | "If OpenAI ships this feature tomorrow, do our users still stay?" |

### Four Archetypes of AI Wedges

| # | Archetype | Description | Example | Why It Works |
|---|-----------|-------------|---------|--------------|
| 1 | **Painkiller Wedge** | Solves a single, acute, measurable pain point that users already spend time or money on | **Granola** — AI meeting notes that auto-capture action items without requiring a bot in the call | Users were already spending 15+ min/meeting on manual notes. Granola eliminates that pain with zero behavior change. |
| 2 | **Workflow Piggyback Wedge** | Attaches to an existing high-frequency workflow rather than creating a new one | **Figma AI** — generative design tools inside the canvas designers already use daily | No new app to adopt. AI appears exactly where designers already work. Friction is near zero. |
| 3 | **Domain-Specific Wedge** | Goes deep into a vertical where general-purpose AI cannot compete on accuracy or trust | **Harvey** — legal AI trained on case law, firm-specific precedent, and jurisdiction-specific rules | General LLMs hallucinate legal citations. Harvey's domain depth makes it the only option law firms trust. |
| 4 | **Community-Centric Wedge** | Enters through a passionate community that becomes the distribution channel itself | **Midjourney** — launched inside Discord where digital artists already gathered | The community creates, shares, and evangelizes. Every image posted is an ad. No marketing spend required. |

### Why Most Wedges Fail

| # | Failure Mode | Description |
|---|-------------|-------------|
| 1 | **Too broad** | "AI for productivity" targets everyone and convinces no one. Vague wedges produce vague growth. |
| 2 | **Too expensive to serve** | The inference cost per user exceeds the willingness-to-pay, creating negative unit economics from day one. |
| 3 | **No storytelling handle** | If a user cannot explain the value in one sentence, they will not refer others. Word-of-mouth dies at the first retelling. |

### Wedge Finder Canvas

A five-step process to identify your optimal wedge:

| Step | Name | Action |
|------|------|--------|
| 1 | **Workflow Mapping** | Map the user's full daily workflow. Identify every tool, handoff, and waiting period. |
| 2 | **Friction Heatmap** | Score each step for pain (time wasted, errors, cost). Highlight the top 3 friction points. |
| 3 | **Obviousness Test** | For each friction point, ask: "Can I show value in 60 seconds without explanation?" Eliminate anything that requires onboarding. |
| 4 | **Defensibility Stress-Test** | For each remaining candidate, ask: "If a foundation model provider ships this as a feature, do we still win?" Keep only wedges with domain depth, data, or workflow lock-in. |
| 5 | **Narrative Handle** | Write the one-sentence pitch. If you cannot make it compelling in one sentence, the wedge is too complex. |

---

## Section 3: The 7 PLG Loops for AI Products

### Loop 1: Viral Output Loops

**Principle:** "Every Output Is Distribution"

The product's output is inherently shareable. Each use creates an artifact that attracts new users.

- **Midjourney** — every generated image shared on social media is a free ad with a watermark
- **Perplexity** — shareable answer pages with citations become reference links others click
- **Runway** — AI-generated videos are shared across creative communities, each tagged with Runway branding

**4-Step Design Playbook:**

| Step | Action |
|------|--------|
| 1 | Identify the primary output artifact (image, document, video, answer) |
| 2 | Make the output inherently shareable (embed branding, add share buttons, optimize for social preview) |
| 3 | Ensure the output demonstrates the product's value without explanation |
| 4 | Create a frictionless path from "I saw this" to "I made my own" |

### Loop 2: Collaborative Workflow Loops

**Principle:** "One User Exposes Another"

One user's adoption of the tool naturally brings collaborators into the product.

- **Figma AI** — a designer generates AI layouts and shares them with PMs and engineers, who then use AI features themselves
- **Notion AI** — one team member uses AI summaries in shared docs; teammates see the value and adopt

**Cross-Team Loops:** The most powerful collaborative loops cross team boundaries. When a designer shares an AI-generated prototype with an engineer, the product bridges two departments that previously used separate tools.

### Loop 3: Data Flywheel Loops

**Principle:** "Every User Makes It Smarter"

Each user interaction generates data that improves the model, which improves the product for all users.

- **Duolingo** — learner responses train the difficulty calibration model, improving lesson quality for future learners
- **GitHub Copilot** — code acceptance/rejection signals refine suggestion quality across all users
- **Harvey** — every lawyer's correction to a generated brief improves the legal model's accuracy

**Critical Design Choice:** The data flywheel only works if you have a feedback mechanism. Passive usage is not enough — you need explicit or implicit signals (accept/reject, edit, rating) that flow back into training.

### Loop 4: Embedded Distribution Loops

**Principle:** "Piggyback on Existing Platforms"

Instead of acquiring users directly, embed inside platforms where users already spend time.

- **Notion AI** — launched inside Notion's existing 30M+ user base; no separate acquisition needed
- **SlackGPT** — AI features embedded into Slack workflows; every Slack workspace is a distribution channel
- **Adobe Firefly** — generative AI inside Photoshop; Adobe's existing user base of 30M+ Creative Cloud subscribers

### Loop 5: Community Loops

**Principle:** "Users Are the Distribution"

Users form a community that generates content, tutorials, and evangelism that attracts new users.

- **Midjourney** — Discord community shares prompts, techniques, and results; new users join to learn from the community
- **Hugging Face** — open-source community contributes models, datasets, and tutorials; the community is the product
- **Cursor** — developer community shares configurations, extensions, and workflows; peer recommendation drives adoption

### Loop 6: Consumption-to-Conversion Loops

**Principle:** "Usage Forces Monetization"

Free usage naturally hits a ceiling where the user's own behavior drives them to pay.

- **ChatGPT** — free tier limits push power users to Plus subscription once they depend on the tool
- **Midjourney** — free generations create attachment; users pay when they need more volume or quality
- **Canva AI** — free AI features hook users; premium AI features (background removal, Magic Resize) convert at the moment of need

### Loop 7: Hybrid Trust Loops

**Principle:** "Scale Builds Confidence"

As more users adopt and validate the product, trust compounds — making the product safer for risk-averse adopters.

- **Perplexity** — citations and source links build verifiable trust; every accurate answer reinforces the brand
- **Anthropic** — safety-first positioning attracts enterprise buyers who need responsible AI; enterprise adoption validates the positioning for more enterprises
- **Grammarly** — years of consistent quality across billions of suggestions create trust that new AI writing tools cannot match

### PLG Loop Comparison Table

| Loop Type | Mechanism | Strength | Primary Risk |
|-----------|-----------|----------|--------------|
| Viral Output | Output artifacts attract new users | Low CAC, high reach | Output quality must be consistently impressive |
| Collaborative Workflow | One user's adoption pulls in collaborators | Organic expansion within orgs | Requires multi-user workflows |
| Data Flywheel | Usage improves the product for all users | Compounding quality advantage | Cold start problem; needs critical mass |
| Embedded Distribution | Piggyback on existing platform user base | Massive instant reach | Platform dependency; platform can clone you |
| Community | Users generate content and evangelism | Self-sustaining growth | Community management overhead; toxicity risk |
| Consumption-to-Conversion | Usage naturally drives payment | High intent conversion | Free tier must be generous enough to hook |
| Hybrid Trust | Scale validates safety for new adopters | Enterprise unlock | Slow to build; one failure can destroy it |

**Key Principle:**

> "Most successful AI products stack 2-3 loops."

Midjourney stacks Viral Output + Community + Consumption-to-Conversion. GitHub Copilot stacks Data Flywheel + Embedded Distribution + Collaborative Workflow. Single-loop products are fragile.

---

## Section 4: The Three Defensible Moats

### Data Moat

**4-Step Build Process:**

| Step | Action |
|------|--------|
| 1 | Identify the unique data your product generates that competitors cannot access |
| 2 | Build feedback loops that capture user corrections, preferences, and domain-specific signals |
| 3 | Create a data pipeline that continuously retrains or fine-tunes your models on proprietary data |
| 4 | Measure data uniqueness score: what percentage of your training data is unavailable to competitors? |

**Example — GitHub Copilot:** Every code suggestion accepted or rejected across millions of developers creates a proprietary dataset of "what good code looks like in context." No competitor can replicate this without equivalent scale.

### Workflow Moat (Expansion Ladder)

**4-Step Build Process:**

| Step | Action |
|------|--------|
| 1 | Map the user's end-to-end workflow and identify where your product touches it |
| 2 | Expand from a single touch point to multiple steps in the workflow |
| 3 | Become the system of record — the place where critical data lives |
| 4 | Integrate with adjacent tools so deeply that ripping you out breaks the workflow |

**Checklist:**

- [ ] Product handles 3+ steps in the user's core workflow
- [ ] Users store critical data inside the product (not just pass-through)
- [ ] Integrations with adjacent tools create bidirectional dependencies
- [ ] Replacement cost estimate exceeds 6 months of subscription value

**Example — Notion AI:** Started as AI writing assistance in docs. Expanded to AI summaries across databases, project management, and wikis. Now embedded in the full knowledge management workflow. Removing Notion AI means restructuring how the entire team manages information.

### Trust Moat

**4-Step Build Process:**

| Step | Action |
|------|--------|
| 1 | Establish transparency mechanisms: citations, confidence scores, audit trails |
| 2 | Build a track record of consistent quality over months and years |
| 3 | Earn third-party validation: certifications, compliance standards, enterprise procurement approvals |
| 4 | Handle errors gracefully — trust is built more by how you fail than how you succeed |

**Example — Perplexity:** Every answer includes inline citations. Users can verify claims. This transparency compounds into trust that generic chatbots cannot match, because Perplexity's entire UX is designed around verifiability.

### The Moat Flywheel

**Equation:**

```
Moat Flywheel = Data Moat + Workflow Moat + Trust Moat → Compounding Advantage
```

**6-Step Compounding Cycle:**

| Step | What Happens |
|------|-------------|
| 1 | Users adopt the product (GTM Wedge pulls them in) |
| 2 | Usage generates proprietary data (Data Moat strengthens) |
| 3 | Product improves, expanding into more workflow steps (Workflow Moat deepens) |
| 4 | Consistent quality over time builds reputation (Trust Moat compounds) |
| 5 | Trust attracts more users (especially risk-averse enterprise buyers) |
| 6 | More users generate more data → cycle repeats with increasing velocity |

**Flywheel Test:**

> "If growth stops tomorrow, does your moat still strengthen?"

If yes, you have a true flywheel. If no, you have a growth dependency, not a moat.

---

## Section 5: 6 Laws of AI Distribution

| # | Law | Case Study | Insight |
|---|-----|-----------|---------|
| 1 | **Technical Scaffolding as Distribution Wedges** | **Perplexity** — built a search engine with citations that made answers verifiable and shareable | Technical infrastructure choices (citations, source links) can become the distribution mechanism itself. The scaffold is the wedge. |
| 2 | **Shrinking Markets Expands Defensibility** | **Runway** — focused on professional video editors (small market) and became indispensable before expanding | Owning a small, high-value market completely is more defensible than partially serving a large one. Shrink to expand. |
| 3 | **Leverage Existing Daily Environments** | **GitHub Copilot** — embedded inside VS Code, the IDE developers already use 8+ hours/day | Don't ask users to come to you. Go where they already live. The best distribution is invisible. |
| 4 | **Positioning as Distribution Channel** | **Anthropic** — "safety-first AI" positioning attracts enterprise buyers who need responsible AI for procurement approval | Your brand narrative is a distribution channel. Positioning that aligns with buyer anxieties sells itself. |
| 5 | **Data Exhaust Creates Virality** | **Clay** — enrichment data flowing through email and CRM creates visible value that colleagues notice and want | The byproducts of usage (data artifacts, enriched records, shared outputs) become organic distribution. |
| 6 | **Virality Taps Controversy** | **Cluely** — AI interview assistant that generated debate about AI ethics, creating massive organic awareness | Controversy is a distribution lever. Products that provoke discussion get free distribution through debate. |

---

## Section 6: The 15 AI Distribution Plays

| # | Play Name | Core Principle | Example / Test |
|---|-----------|---------------|----------------|
| 1 | **Find Your Only** | Be the only product that solves a specific, painful problem for a specific user | Test: "We are the only AI that _____ for _____." If you cannot fill both blanks, you haven't found your only. |
| 2 | **Workflow Embedding** | Embed into the user's existing workflow so deeply that removing you breaks the process | Test: "If we disappeared, which step of the user's daily workflow would break?" If the answer is "none," you are a nice-to-have. |
| 3 | **Output-as-Distribution** | Make every product output a shareable artifact that demonstrates value | Test: "Does our output get shared on social media, Slack, or email without us asking?" If not, redesign the output format. |
| 4 | **User Status Loops** | Using your product signals status, taste, or expertise that users want to display | Test: "Do users brag about using our product?" Midjourney users share creations as creative identity. |
| 5 | **Community Flywheels** | Build a community where users teach, share, and recruit other users | Test: "Do users create content about our product without being paid?" If yes, the community flywheel is spinning. |
| 6 | **Category Naming** | Name and own the category so that competitors are compared to you, not the reverse | Test: "When people describe what we do, do they use our name as the reference point?" Perplexity owns "AI search." |
| 7 | **Partner Distribution** | Leverage partners who already have access to your target users | Test: "Which partner has 10x our reach and would benefit from our capability embedded in their product?" |
| 8 | **Influencer & Agency Rails** | Equip influencers and agencies with tools that showcase your product through their reach | Test: "Can an agency build a service offering on top of our product?" If yes, they become a sales channel. |
| 9 | **Prestige Anchors** | Land a marquee customer whose name de-risks adoption for everyone else | Test: "If [Fortune 500 name] uses us, does that unlock 50 similar companies?" Enterprise trust cascades. |
| 10 | **Provocative Narratives** | Take a bold, contrarian stance that generates debate and awareness | Test: "Does our positioning make some people angry?" If everyone agrees, you are invisible. |
| 11 | **Educational Moats** | Create the definitive educational content for your domain so that learning means using your product | Test: "When someone wants to learn about [our domain], do they find our content first?" |
| 12 | **Creator-Native Adoption** | Design for creators who will showcase your product to their audiences as part of their content | Test: "Can a YouTuber make a compelling video using our product?" If yes, every video is distribution. |
| 13 | **Data Flywheels** | Every user interaction improves the product, creating a compounding advantage | Test: "Is our product measurably better today than 6 months ago because of user data?" |
| 14 | **Trust & Reliability** | In high-stakes domains, be the product that is trusted enough to act on | Test: "Would a user stake their job on our output?" In legal, medical, and financial AI, trust is the product. |
| 15 | **Economic Alignment** | Align your pricing with the value created so that paying feels like an investment, not a cost | Test: "Can users calculate a clear ROI from using our product?" If yes, the sale closes itself. |

---

## Section 7: Three Distribution Archetypes

### Archetype 1: Bundling

**Core Idea:** Combine multiple AI capabilities into a single, integrated product that is worth more together than apart.

**Example — Legal AI Contract Review:**

| Layer | Component | Description |
|-------|-----------|-------------|
| 1 | **GTM Wedge** | AI clause extraction — instantly identifies risky clauses in uploaded contracts (proof on first use) |
| 2 | **PLG Loop** | Collaborative review: one lawyer shares AI-annotated contracts with colleagues, who adopt the tool |
| 3 | **Moat Layer 1** | Data moat: every contract reviewed trains the model on firm-specific language and risk tolerance |
| 4 | **Moat Layer 2** | Workflow moat: expands from clause review to full contract lifecycle (drafting, negotiation, compliance) |

### Archetype 2: Embedding

**Core Idea:** Embed AI into an existing product or workflow so deeply that it becomes invisible infrastructure.

**Example — AI Negotiation Coach:**

| Layer | Component | Description |
|-------|-----------|-------------|
| 1 | **GTM Wedge** | Real-time negotiation prompts during video calls — AI whispers suggestions as the conversation happens |
| 2 | **PLG Loop** | Every coached negotiation creates a shareable post-meeting summary; recipients see AI insights and want their own |
| 3 | **Moat Layer 1** | Data moat: each negotiation interaction builds a proprietary dataset of successful tactics by industry and deal type |
| 4 | **Moat Layer 2** | Trust moat: consistent improvement in deal outcomes builds a track record that new competitors cannot match |

### Archetype 3: Unfair Access

**Core Idea:** Gain distribution through a channel, community, or controversy that competitors cannot replicate.

**Example — Cluely:**

- Launched as an AI interview assistant that provides real-time answers during job interviews
- Generated massive controversy: "Is this cheating?"
- The controversy itself became the distribution channel — every debate about AI ethics in hiring mentioned Cluely by name
- Competitors who launched similar products were compared to Cluely, reinforcing its category ownership
- Unfair access = owning the narrative so thoroughly that competition amplifies your brand

---

## Section 8: Distribution Infrastructure

### Distribution-First PRD Framework

Every product requirement document for an AI product must include three distribution non-negotiables:

| # | Non-Negotiable | Question to Answer | Failure Mode If Skipped |
|---|---------------|-------------------|------------------------|
| 1 | **Distribution Mechanism** | "How does this feature spread to new users without marketing spend?" | You build features that require paid acquisition to grow — unsustainable at AI cost structures |
| 2 | **Feedback Loop** | "How does usage of this feature generate data that improves the product?" | You ship static features that do not compound — competitors catch up with every foundation model update |
| 3 | **Switching Cost** | "What would a user lose if they stopped using this feature?" | You build features with zero lock-in — users leave the moment a free alternative appears |

### Weekly Distribution Audit

| # | Check | Question | Action If Failing |
|---|-------|----------|-------------------|
| 1 | **Loop Health** | "Is our primary PLG loop still growing week-over-week?" | Diagnose the break point: is it awareness, activation, or retention? |
| 2 | **Moat Depth** | "Has our moat measurably deepened this week?" | If not, your moat is eroding. Prioritize data capture or workflow expansion. |
| 3 | **Cost Efficiency** | "Is our cost-per-acquired-user decreasing as we scale?" | If CAC is flat or rising, your loops are not compounding. Redesign the loop. |
| 4 | **Competitive Distance** | "Could a well-funded competitor replicate our current distribution in 6 months?" | If yes, you do not have a moat. Accelerate defensibility investments. |

### 5 Silent Killers of AI Distribution

| # | Killer | Description | Antidote |
|---|--------|-------------|----------|
| 1 | **Treating AI Like SaaS** | Applying SaaS growth playbooks to AI products ignores the cost structure and commoditization speed of AI | Design for AI economics from day one: high-value wedge, fast payback, data flywheel |
| 2 | **Playing Fair** | Waiting for "fair" distribution channels while competitors use controversy, community, and unconventional channels | Distribution is a contact sport. Use every legal lever: partnerships, embeds, provocative positioning |
| 3 | **Confusing Features With Moats** | Believing that a better model or more features constitutes a moat; features are commoditized within months | Features attract users. Moats keep them. Build the moat before competitors clone the features. |
| 4 | **Ignoring Economics** | Scaling usage without understanding unit economics; negative-margin growth is not growth | Model cost vs. virality for every feature. Kill features where inference cost exceeds lifetime value. |
| 5 | **Waiting to Own Narrative** | Letting the market define your category instead of naming it yourself | Name your category early. The first product to define the narrative owns it. |

> "In AI, features don't last."

---

## Section 9: AI vs SaaS Distribution

| Dimension | SaaS Distribution | AI Distribution |
|-----------|-------------------|-----------------|
| **Marginal Cost** | Near-zero per additional user; infrastructure scales predictably | Every API call / inference has real cost; usage-based economics change the growth equation fundamentally |
| **Time Windows** | Feature advantages last 12-24 months; competitors need time to build | Feature advantages last 3-6 months; foundation model updates commoditize features overnight |
| **Distribution ≠ Reach** | Reach (awareness) often converts to distribution (adoption) predictably | Reach without embedding is worthless; users must experience value inside their workflow, not just hear about it |
| **Commoditization** | Defensibility comes from network effects and integrations over years | Defensibility must be built from day one; the moat must compound faster than commoditization erodes features |

> "Distribution isn't the sequel to PMF. In AI, distribution is PMF."

---

## Section 10: 7-Step Distribution Strategy Playbook

| Step | Name | Questions / Actions |
|------|------|-------------------|
| 1 | **Identify the Wedge** | What is the single, sharp pain point we solve? Can we demonstrate value in 60 seconds? Does the user have budget for this pain today? |
| 2 | **Map the Workflow** | Where does this pain occur in the user's daily workflow? What tools surround it? Can we embed into the existing flow rather than creating a new one? |
| 3 | **Stress-Test the PLG Loop** | Three critical questions: (1) "Does usage naturally expose non-users to the product?" (2) "Does the product improve with more users?" (3) "Can a free user convert to paid through their own behavior, not our sales team?" |
| 4 | **Model Cost vs. Virality** | What is the inference cost per user per month? What is the viral coefficient (how many new users does each user bring)? At what scale do unit economics become positive? |
| 5 | **Layer in the Moat** | Which moat type (data, workflow, trust) can we build earliest? What is the 90-day plan to deepen it? How will we measure moat depth quarterly? |
| 6 | **Pilot, Measure, Cut Weak Loops** | Launch with 2-3 PLG loops active. Measure each loop independently. Cut any loop that is not compounding after 90 days. Double down on the strongest loop. |
| 7 | **Narrate Distribution to Leadership** | Frame distribution as a strategic asset, not a marketing tactic. Show the flywheel diagram. Report moat depth alongside revenue. Make distribution a board-level metric. |

---

## Section 11: 9 Advanced Distribution Tactics

| # | Tactic | Core Principle |
|---|--------|---------------|
| 1 | **Partner Motion** | Identify partners whose existing distribution reaches your target users; embed your AI inside their product so their sales team sells for you |
| 2 | **Marketplace Leverage** | Launch inside existing marketplaces (Slack App Directory, Salesforce AppExchange, VS Code Extensions) where users already browse for solutions |
| 3 | **Ecosystem Design** | Build an ecosystem of plugins, integrations, and third-party developers that expands your distribution surface area beyond what you could build alone |
| 4 | **Narrative Distribution** | Own the intellectual narrative around your category through research, thought leadership, and bold public positions; the narrative becomes the distribution channel |
| 5 | **Temporal Arbitrage** | Move faster than competitors during capability windows (new model release, regulatory change, platform shift); first-mover advantage in AI distribution is measured in weeks, not years |
| 6 | **Embedded Distribution (B2B2C)** | Sell to businesses who embed your AI into their consumer-facing product; your distribution multiplies through their user base without direct consumer acquisition |
| 7 | **Regulatory Moats** | In regulated industries (healthcare, finance, legal), obtain certifications and compliance approvals that take competitors 12-18 months to replicate |
| 8 | **Distribution by Default** | Design the product so that the default usage pattern inherently spreads the product; sharing is the path of least resistance, not an extra step |
| 9 | **Distribution Through Evangelists** | Identify and empower your most passionate users with tools, content, and recognition that make them effective advocates; 100 true evangelists outperform a $1M ad budget |

---

> "Stop asking 'What can AI do?' Start asking 'How will AI spread in ways competitors cannot copy?'"
