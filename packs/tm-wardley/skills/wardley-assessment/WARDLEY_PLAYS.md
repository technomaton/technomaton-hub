<!-- Source: Simon Wardley, "Wardley Maps" book, CC-BY-SA-4.0 -->
<!-- Adapted for AI agent consumption by TECHNOMATON -->

# Wardley Strategic Gameplay -- Context-Specific Moves

## 1. What is Gameplay?

Gameplay is the set of **context-specific strategic actions** you choose based on your position on the map. Unlike doctrine (always apply), a gameplay move is only valid in certain configurations. A play that generates enormous value in one position can be actively destructive in another. Position determines which plays are available.

### Gameplay vs. Doctrine vs. Climate

| Category | Definition | Nature | Dependency |
|----------|-----------|--------|------------|
| **Climate** | Forces that act on the landscape | Unavoidable. Happens *to* you. | None -- climate is input. |
| **Doctrine** | Universal principles of good practice | Advisable. What you *should* always do. | Climate awareness improves application. |
| **Gameplay** | Context-specific strategic moves | Optional. What you *choose* given position. | Requires climate reading and doctrine competence. |

**The sequence matters.** Read the climate to understand active forces. Apply doctrine to ensure organizational competence. Then select gameplay. Skipping climate reading leads to plays that fight unavoidable forces. Weak doctrine leads to fumbled execution of even brilliant plays.

### Core Principle

Every play specifies a **map configuration** -- the arrangement of components, evolution stages, and competitive positions that make it viable. If your map does not match, the play does not apply. Do not force plays onto maps that do not support them.

---

## 2. Offensive Plays

Offensive plays change the competitive landscape in your favor -- creating new advantages, undermining competitors, or accelerating evolution to benefit your positioning.

---

### Play 1 -- Tower

**Build a vertical integration tower from commodity infrastructure up through user-facing innovation.**

Control components at multiple evolution stages simultaneously. Lower layers (Commodity) provide cost advantages and independence from suppliers. Upper layers (Genesis/Custom-Built) provide differentiation. The strategic logic is self-reinforcement: controlling commodity layers eliminates external margins while controlling upper layers ensures competitors on the same infrastructure cannot match integration quality.

**When to use:** You have engineering depth across evolution stages. Commodity components are overpriced or unreliable from external providers. User-facing components benefit from tight integration with lower layers.

**Risks:** Overextension across too many stages. Uniform management applied to layers needing different approaches. Capital intensity.

**Counter-plays:** Best-of-breed focused competitors. Open-source commoditizing middle layers. Ecosystem plays outflanking a closed stack.

**Example:** Apple -- silicon, OS, hardware, and services. Tight vertical integration enables optimization no single-layer competitor can match.

---

### Play 2 -- Exploit

**Use commoditized components to build higher-order value at lower cost than competitors who build those components themselves.**

Consume Commodity or late Product components as inputs, redirecting all engineering effort to Custom-Built and Genesis layers where differentiation lives. Most powerful when a component has recently commoditized but competitors have not adjusted -- you build on the commodity while they maintain their custom version.

**When to use:** Key components have evolved to Commodity/late Product. Competitors still operate those components as Custom-Built (inertia). You can identify higher-order capability to build on top.

**Risks:** Dependency on commodity providers. Low barrier to entry -- others can exploit the same layer.

**Counter-plays:** Commodity providers integrate upward (Tower). Competitors adopt the commodity layer too.

**Example:** Netflix exploited AWS (commodity compute/storage) to build proprietary recommendation and delivery. Competitors running own data centers could not match scaling speed or cost.

---

### Play 3 -- Open Approaches

**Open-source a component to accelerate its commoditization, undermining competitors who profit from it at Product stage.**

Release an open-source alternative to erode a competitor's Product-stage revenue. This is not altruistic -- you profit from the component's commoditization elsewhere in your value chain. Open-sourcing removes the profit motive sustaining the Product stage and drives it toward Commodity faster than natural forces.

**When to use:** A competitor profits from a Product-stage component. You do not depend on it for revenue. Commoditizing it strengthens your position on a different layer.

**Risks:** Maintenance cost. Community governance challenges. May accidentally commoditize a layer you depend on.

**Counter-plays:** Incumbents differentiate through enterprise features/support. Acquire the project. Lobby for regulation favoring commercial products.

**Example:** Google open-sourced Android to commoditize mobile OS, undermining proprietary OS differentiation. Google profited not from Android but from the services layer above it.

---

### Play 4 -- ILC (Innovate-Leverage-Commoditize)

**Three-phase cycle: innovate at Genesis, leverage at Custom-Built, commoditize to create the next platform layer.**

In Innovate, invest in Genesis experimentation (high failure rate). In Leverage, build successes into Custom-Built/Product offerings, extracting value through differentiation. In Commoditize, drive those offerings to Commodity, creating platforms that enable the next Genesis round. Each cycle raises the commodity base, making the next cycle faster and cheaper.

**When to use:** Organizational capacity to run all three phases simultaneously. Long time horizon (years to decades). Platform business model or aspiration.

**Risks:** Capital-intensive. Requires three different management cultures in parallel. Inertia at the Commoditize phase wastes the cycle.

**Counter-plays:** Competitors skip Leverage, wait for Commodity, build Genesis on top. Faster innovators out-explore at Genesis.

**Example:** Amazon/AWS -- internal infrastructure innovation (Genesis), leveraged into internal tooling (Custom-Built), commoditized as cloud services. Each new AWS service repeats the cycle at higher abstraction.

*For the full ILC model, see WARDLEY_ILC.md when available.*

---

### Play 5 -- Signal Distortion

**Misdirect competitor attention. Announce in one direction while building in another.**

Exploit the fact that competitors infer strategy from public signals. Deliberately misleading announcements -- investment in one area, patents in another, leaked plans for products you will not build -- cause competitors to misallocate resources defending against threats that never materialize.

**When to use:** You need time or space to execute your real strategy. Competitors react to your public signals. You can maintain operational secrecy while projecting false intent.

**Risks:** Legal liability (market manipulation, fraud). Reputation damage. Internal confusion. Competitor intelligence may see through distortion.

**Counter-plays:** Ignore signals, focus on own map. Invest in intelligence that reads actions over announcements. Diversify responses.

**Example:** FUD campaigns in enterprise software. Microsoft's "Longhorn" feature announcements years before Vista caused competitors to redirect resources toward capabilities never delivered as described.

---

### Play 6 -- Constraint Manipulation

**Control supply of a critical component to create artificial scarcity or dependency.**

Target components on critical dependency paths. If you control a component many others depend on, regulate availability, set pricing, and influence the evolution of everything above it. Works best when the component has few substitutes and high switching costs.

**When to use:** You control a critical dependency point. Few viable substitutes. High switching costs for consumers. Component is at Custom-Built/Product stage (Commodity is harder to constrain).

**Risks:** Regulatory intervention. Incentivizing alternatives. Reputational damage and ecosystem defection.

**Counter-plays:** Open-source alternatives. Industry consortia establishing open standards. Collective migration.

**Example:** Nvidia's GPU supply control plus CUDA ecosystem lock-in. Limited hardware availability combined with deep software ecosystem makes switching expensive even when alternatives exist.

---

### Play 7 -- Ecosystem Play

**Become the platform others build on. Create standards, APIs, and developer tools that attract a community extending your value chain.**

Shift from selling products to hosting a platform where others create value. Provide Commodity/Product infrastructure (compute, APIs, identity) and attract developers who build Custom-Built and Genesis innovations on top. Capture value through platform fees, data, and network effects.

**When to use:** You operate Commodity/Product components others need as building blocks. You can invest in developer experience. The value chain above your layer supports diverse third-party innovation.

**Risks:** Governance failures alienating ecosystem. Extracting too much value too early. Participants commoditizing your platform layer.

**Counter-plays:** Competing ecosystems with better terms. Vendor-neutral open-source alternatives. Key participants vertically integrating past you.

**Example:** AWS -- commodity infrastructure with excellent APIs and developer tools. The ecosystem of companies building on AWS creates lock-in and network effects transcending any individual service.

---

### Play 8 -- Land and Expand

**Enter with a narrow wedge, then expand into adjacent value chain positions once established.**

Rather than competing across an entire value chain, enter at one point where you have clear advantage or incumbents are weakest. Once you have a foothold -- users, data, integration points -- expand horizontally and vertically. The initial wedge should be small enough that incumbents dismiss it and large enough to provide genuine value.

**When to use:** Incumbents are established across the value chain. You have a specific advantage at one component. Adjacent positions are accessible from the beachhead. Incumbents will likely underestimate a narrow entrant.

**Risks:** Aggressive incumbent reaction once expansion is recognized. Initial wedge too narrow to sustain business during expansion.

**Counter-plays:** Incumbents integrate/replicate the wedge. Lock in customers through bundling. Acquire the entrant.

**Example:** Slack entered enterprise communication as team messaging (narrow wedge), then expanded into integrations, workflows, and platform capabilities across a much broader value chain.

---

## 3. Defensive Plays

Defensive plays protect existing advantages, slow competitors, or extract maximum value from current positions.

---

### Play 1 -- Fortress

**Build deep defensibility around Custom-Built/Product advantage through patents, proprietary data, regulatory moats, and switching costs.**

Concentrate investment on making your current position as difficult to attack as possible. Mechanisms include intellectual property, exclusive data assets, regulatory certifications, and deep customer integrations. Most effective at Custom-Built or Product stage -- Genesis has too little to defend, Commodity has already evolved past defensibility.

**When to use:** Strong position at Custom-Built/Product stage. Competitors approaching. Access to defensible assets (IP, data, regulation). Evolution slow enough for the fortress to remain relevant.

**Risks:** Inertia -- defending a position past its strategic value. Market evolves around you. Diverts resources from offense.

**Counter-plays:** Flanking. Open Approaches commoditizing your layer. Leapfrogging through next-generation innovation.

**Example:** Oracle database -- decades of enterprise integration, certifications, contractual lock-in. Competitors offer superior technology, but switching costs for large enterprises are measured in years and hundreds of millions.

---

### Play 2 -- Differentiation

**Stay ahead on the evolution curve by continuously innovating faster than competitors can follow.**

Accept that competitors will replicate current capabilities, so invest in continuously producing new ones. By the time they catch up, you have moved further. Requires sustained R&D and fast iteration. Critical nuance: differentiate on things users actually value -- the map tells you where differentiation matters.

**When to use:** Competitive advantage at Custom-Built/early Product stage. Competitors actively evolving toward your position. Strong R&D capability. Users perceive and value the differences.

**Risks:** Unsustainable R&D burn rate. Differentiating on features users do not value. Competitors shifting the basis of competition entirely.

**Counter-plays:** Exploit (commodity layers reduce cost, matching investment). Ecosystem Play (platform attracts distributed innovation). Buying Time.

---

### Play 3 -- Standards Game

**Establish your approach as the industry standard. Control the standard to control the ecosystem.**

Convert Product-stage market leadership into persistent influence by embedding your approach into the industry's shared infrastructure. Once your format, protocol, or interface is the standard, all ecosystem participants interact on your terms -- even if the component itself commoditizes.

**When to use:** Market leader at Product stage. Industry needs interoperability. Standards bodies not yet dominated by a competitor.

**Risks:** Standards bodies co-opted by competitors. Open standards reduce your differentiation. Standard becomes irrelevant if component evolves past it.

**Counter-plays:** Rival standards. Vendor-neutral open-source alternatives. Rapid evolution making the standard obsolete.

**Example:** Microsoft Office document formats (.doc, .xls, .ppt) -- compatibility remained a non-negotiable requirement for decades, reinforcing the product even as alternatives emerged.

---

### Play 4 -- Buying Time

**Slow competitor evolution through patents, regulation, legal challenges, or exclusive contracts.**

Explicitly temporary. Evolution cannot be stopped permanently. The play is valuable only when the delay creates a window to execute another strategy -- pivoting, completing an ILC cycle, establishing a fortress, or exiting gracefully. Buying Time without a follow-up plan is waste.

**When to use:** A revenue component is evolving faster than your ability to adapt. You have legal/regulatory mechanisms to slow competitors. You have a concrete follow-up plan.

**Risks:** Reputational damage. Legal costs. Delay shorter than expected. Competitors find paths around barriers.

---

### Play 5 -- Harvesting

**When a component reaches Commodity, maximize profit extraction while minimizing investment. Redirect savings elsewhere.**

Stop investing in innovation for the component, reduce costs to minimum viable, extract cash flow. Redeploy capital to Genesis/Custom-Built components. The danger is emotional attachment -- success inertia around components that were once primary value drivers but are no longer strategic.

**When to use:** Component at late Product/Commodity. Differentiation minimal. Competitors offer equivalents. R&D yields diminishing returns. Higher-value positions identified for capital redeployment.

**Risks:** Degrading below minimum viable quality, accelerating customer loss. Brand damage from aggressive harvesting.

---

### Play 6 -- Talent Acquisition

**Acquire companies or teams for their Genesis/Custom-Built capabilities and talent, not revenue.**

When critical capabilities are at Genesis/Custom-Built stage, knowledge is tacit -- held by specific people. Acquiring the team is faster than recruiting or replicating. Acceleration rather than organic development is the value proposition.

**When to use:** Needed capability at Genesis/Custom-Built. Knowledge concentrated in a small team. Organic development would exceed your strategic window. Acquisition cost justified by acceleration.

**Risks:** Acquired talent leaves post-acquisition. Cultural integration failure. Overpaying for capabilities that will soon commoditize.

---

## 4. Positional Plays

Positional plays are meta-decisions about where and how to engage -- determining your stance rather than directly attacking or defending a component.

---

### Play 1 -- First Mover vs. Fast Follower

**Select entry timing based on evolution stage. First-mover advantage varies dramatically by stage.**

| Stage | First Mover | Fast Follower | Recommended |
|-------|-------------|---------------|-------------|
| **Genesis** | High risk, high reward. Define the category. Extreme failure rate. | Difficult -- nothing to follow yet. | First mover if you can absorb failures. |
| **Custom-Built** | Moderate risk. Establish dominant approach. | Viable. Learn from first mover's mistakes. | Either, depending on resources. |
| **Product** | Risky. Incumbents have head start. | Often superior. Observe what market values, execute better. | Fast follower advantage strongest here. |
| **Commodity** | Irrelevant. | Speed to scale matters. Be low-cost, high-reliability. | Operational excellence wins. |

---

### Play 2 -- Build vs. Buy vs. Outsource

**Align sourcing to evolution stage. Build what differentiates. Buy what is productized. Outsource what is commoditized.**

| Stage | Strategy | Rationale |
|-------|----------|-----------|
| **Genesis / Custom-Built** | **Build** | Competitive advantage. Control the capability. Accumulate tacit knowledge. |
| **Product** | **Buy** | Well understood, feature-rich, multiple vendors. Focus engineering on higher-value work. |
| **Commodity** | **Outsource** | No differentiation. Operating it yourself adds cost without value. |

**Common mistake:** Building components that should be bought or outsourced, driven by inertia or "not invented here" syndrome.

---

### Play 3 -- Market Shaping

**Actively influence evolution direction through thought leadership, developer relations, partnerships, and standards participation.**

While general evolution direction (Genesis to Commodity) is inevitable, the specific path -- which features become standard, which interface wins -- is influenced by active participants. Shape the market to favor your strengths.

**When to use:** Component at Custom-Built/Product where evolution path is unlocked. Multiple viable approaches. You have credibility and resources to influence market perception.

**Risks:** Expensive and uncertain. Competitors may outspend you. Market may evolve unpredictably.

---

### Play 4 -- Strategic Retreat

**Deliberately exit a position becoming untenable. Free resources for higher-value positioning.**

Not failure -- resource reallocation. When a position is unsustainable (commodity pricing, dominant platforms), continuing to invest is waste. Exit cleanly and redeploy resources where you have or can build advantage.

**When to use:** Component has evolved past your ability to compete profitably. Maintaining position requires increasing investment with decreasing returns. Alternative positions identified.

**Risks:** Revenue loss during transition. Customer confusion. Organizational morale impact.

---

### Play 5 -- Flanking

**Attack a competitor's weak point rather than their strength. Enter the value chain at an undefended layer.**

Avoid direct confrontation. Enter at a point the incumbent neglects or considers non-strategic. Often the incumbent does not recognize the threat until the flanking position connects to a viable expansion path.

**When to use:** Incumbent dominant on specific components but has neglected adjacent layers. Undefended layer is accessible and provides growth path.

**Risks:** Flanking position may not be valuable enough. Incumbents may react quickly. No viable expansion path.

**Example:** Google entered enterprise through email and documents -- layers Microsoft considered peripheral. Once established, Google expanded into broader enterprise services.

---

### Play 6 -- Bundling and Unbundling

**Bundle commodity components into Product offerings, or unbundle Products to deliver focused solutions.**

When commodity components are fragmented, bundling them creates Product-stage value through integration and convenience. When a monolithic Product is bloated, unbundling to offer focused excellence captures overserved customers.

**When to use:**
- **Bundle** when users currently assemble commodity components themselves.
- **Unbundle** when a dominant Product underperforms on specific components users care about.

**Risks:** Bundling collapses if a component commoditizes faster than expected. Unbundling fails if the incumbent improves the targeted component.

---

## 5. Play Selection Protocol

How the wardley-gameplay agent should evaluate and recommend plays.

### Step 1: Read the Map

For each component, confirm evolution stage and value chain position. Note components in transition between stages.

### Step 2: Determine Available Plays by Stage

| Stage | Offensive | Defensive | Positional |
|-------|-----------|-----------|------------|
| **Genesis** | Land and Expand, ILC (Innovate) | Differentiation, Talent Acquisition | First Mover, Build |
| **Custom-Built** | Tower, ILC (Leverage), Ecosystem | Fortress, Differentiation, Standards Game | First/Fast Follower, Build, Market Shaping |
| **Product** | Exploit, Open Approaches, Signal Distortion | Standards Game, Buying Time, Fortress | Fast Follower, Buy, Bundling/Unbundling |
| **Commodity** | Constraint Manipulation, Ecosystem | Harvesting | Outsource, Strategic Retreat, Flanking |

### Step 3: Cross-Reference Climatic Patterns

Identify active climatic patterns (from WARDLEY_CLIMATE.md). Certain patterns create windows for specific plays.

| Pattern | Enables |
|---------|---------|
| Rapid component evolution | Exploit, Open Approaches |
| Visible competitor inertia | Flanking, Land and Expand |
| Co-evolution creating new layer | ILC, Tower extension |
| Infrastructure commoditization | Ecosystem Play, Exploit |
| Emerging user need | Land and Expand, First Mover |

### Step 4: Assess Competitive Landscape

Identify likely competitor plays. Design counter-strategies:
- Competitor running Tower: consider Flanking or Open Approaches against their weak layer.
- Competitor running Fortress: consider Flanking to bypass or Open Approaches to commoditize underneath.
- Competitor running Ecosystem: decide whether to join (build on platform) or counter (build alternative).

### Step 5: Evaluate Risk and Reward

For each candidate play assess: (1) prerequisites met, (2) resource requirements, (3) time horizon, (4) reversibility, (5) counter-play exposure.

### Step 6: Recommend Top 3 Plays

1. **Primary** -- highest impact, prerequisites clearly met, acceptable risk.
2. **Secondary** -- reinforcing play that compounds the primary's effect.
3. **Contingency** -- alternative direction if primary encounters resistance.

For each: target components, supporting map configuration, expected outcome, primary risk, counter-play preparation.

---

## 6. Play Interaction Matrix

### Reinforcing Combinations

| Play A | Play B | Interaction |
|--------|--------|-------------|
| Tower | ILC | Build the stack, commoditize lower layers, innovate at higher layers. Each ILC loop strengthens the tower. |
| Open Approaches | Ecosystem Play | Open-source seeds the ecosystem. Ecosystem creates lock-in the open-source alone does not. |
| Land and Expand | Exploit | Low-cost commodity entry (Exploit) enables rapid beachhead iteration (Land), supporting efficient expansion. |
| Fortress | Standards Game | Standard creates external lock-in. Fortress creates internal defensibility. Compound moat. |
| Harvesting | ILC | Cash from mature components funds the Innovate phase. Declining component finances emerging one. |
| Differentiation | Talent Acquisition | Acquired Genesis capabilities sustain the differentiation engine. Organic R&D supplemented by inorganic injection. |

### Conflicting Combinations

| Play A | Play B | Conflict |
|--------|--------|----------|
| Fortress | Open Approaches | Cannot simultaneously wall off and open up the same component. |
| Harvesting | Differentiation | Minimizing investment and maximizing investment on the same component are opposing allocations. |
| First Mover | Buying Time | First movers are chased, not chasing. If buying time, you are behind, not first. |
| Constraint Manipulation | Ecosystem Play | Constraining supply repels participants. Ecosystems require attracting them. |
| Strategic Retreat | Fortress | Retreating from and fortifying a position are opposite actions. |

### Sequencing Patterns

| First | Then | Logic |
|-------|------|-------|
| Land and Expand | Tower or Ecosystem | Establish beachhead, then build stack or platform. |
| Talent Acquisition | Differentiation | Acquire capability, then use it to differentiate. |
| Buying Time | Retreat or ILC | Buy window to exit gracefully or complete pivot. |
| Open Approaches | Ecosystem Play | Commoditize the layer, then platform-ify it. |
| Exploit | Tower | Build on commodity, then progressively control more stack. |

---

## 7. Plays for AI Products

AI-specific gameplay driven by rapid inference commoditization and defensibility concentrating in context, data, and evaluation layers.

---

### AI Play 1 -- Context Tower

**Build a proprietary context pipeline (Custom-Built) on commodity LLM inference.**

Inference is commoditizing -- multiple providers, falling prices, comparable capabilities. The context pipeline (retrieval, ranking, prompt construction, memory, guardrails, domain grounding) remains Custom-Built and is where quality differentiation resides. Treat the model as interchangeable infrastructure and the UI as standard delivery. Invest in the middle layer.

**Map configuration:** LLM inference at III-IV. Context pipeline at II. UI at III. Competitive advantage in the context layer.

**Working signal:** You can swap LLM providers with minimal quality degradation. Your context pipeline produces measurably better outputs than competitors on the same base model.

---

### AI Play 2 -- Data Flywheel

**Use interactions to generate proprietary data that improves the product, creating a compounding behavioral moat.**

Every interaction generates data -- queries, preferences, corrections, usage patterns. Design the product so this data flows back to improve retrieval, refine ranking, and expand the knowledge base. Each user makes the product better for all users, compounding over time.

**Map configuration:** Interaction data at I-II (novel asset). Feedback infrastructure at II. The flywheel converts Genesis data into a Custom-Built moat.

**Critical requirement:** Design the flywheel from the start. Retrofitting feedback loops onto products not designed for them is expensive and often fails.

---

### AI Play 3 -- Wrapper Avoidance

**Recognize when you are a thin UX layer on commodity components. Go deeper or accept thin margins.**

A UI on an LLM API with nothing proprietary in between is a wrapper. Defensible only until the provider (or competitor) builds equivalent UX. Strategic discipline: identify when you are a wrapper and either deepen your value chain or consciously operate as low-margin, high-volume UX.

**Map configuration:** User-facing product with thin or no Custom-Built layer between you and commodity inference. If removing the API leaves nothing proprietary, you are a wrapper.

**Escape paths:** Context Tower (proprietary pipeline). Data Flywheel (proprietary data asset). Evaluation Advantage (proprietary quality measurement). If none are viable, compete on distribution and UX speed.

---

### AI Play 4 -- Model Agnosticism

**Design the application layer to consume LLM inference as commodity. Swap providers without rebuilding.**

Treat the model layer as utility. No dependency on provider-specific features or proprietary APIs beyond standard inference. When better/cheaper providers emerge, switch with configuration changes. Abstraction layers mediate between application logic and model providers.

**Map configuration:** Inference at III-IV. Application deliberately decoupled from any provider. Adapter patterns enable multi-model strategies.

**Strategic value:** Preserves optionality during rapid model evolution. Prevents vendor lock-in. Enables cost/latency/capability optimization per use case.

---

### AI Play 5 -- Evaluation Advantage

**Invest in custom evaluation systems (Genesis stage). Evaluation is where quality differentiation lives in AI products.**

AI quality is probabilistic, not deterministic. Systematically measuring output quality, detecting regressions, evaluating new models, and quantifying improvement is itself a competitive advantage. Most teams evaluate manually or not at all. Automated, domain-specific evaluation compounds over time.

**Map configuration:** Evaluation at I. Competitors have no systematic evaluation or rely on generic benchmarks. Your pipeline measures what your users care about.

**Strategic value:** Enables every other AI play. Context Tower improvements are validated. Flywheel effectiveness is quantified. Model Agnosticism decisions are grounded in data. Without evaluation, every other play is flying blind.
