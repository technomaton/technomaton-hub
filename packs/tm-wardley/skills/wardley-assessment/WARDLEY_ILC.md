<!-- License: CC-BY-SA-4.0 — Attribution: Simon Wardley, "Wardley Maps" book -->
<!-- Source: https://medium.com/wardleymaps — adapted for AI agent consumption by TECHNOMATON -->

# Wardley Mapping -- Innovate-Leverage-Commoditize (ILC)

## 1. What Is ILC?

Innovate-Leverage-Commoditize is a three-phase strategic cycle where a company deliberately manages the evolution of components through its value chain. Rather than waiting for market forces to push components along the evolution axis, the company actively drives that movement and captures compounding value at each stage.

**Core principle:** Commoditizing one layer creates the platform for innovation on the layer above. Each time a capability becomes a commodity, it removes cost and complexity for everyone building on top of it. That reduction in friction opens new design space where novel things become possible. The cycle is self-reinforcing -- each pass compounds the infrastructure available to the next.

**How ILC differs from organic evolution:** All components evolve naturally through market competition (Genesis to Commodity). This is organic evolution. ILC is the deliberate, strategic acceleration and direction of that evolution. A company practicing ILC does not merely observe evolution -- it drives it, harvests each phase, and positions itself for the next. The difference is between watching weather and seeding clouds.

| Aspect | Organic Evolution | Deliberate ILC |
|--------|------------------|----------------|
| **Driver** | Market competition, supply and demand | Strategic intent and execution |
| **Speed** | Variable, depends on market forces | Accelerated through investment and focus |
| **Beneficiary** | Whoever happens to be well-positioned | The company orchestrating the cycle |
| **Predictability** | Observable but not controlled | Planned and directed |
| **Compounding** | Incidental | Intentional -- each cycle builds the foundation for the next |

---

## 2. The Three Phases

### Phase 1 -- Innovate (Genesis)

Create new capabilities at the Genesis stage. Explore the adjacent possible, experiment broadly, and expect most experiments to fail. The goal is not efficiency -- it is discovery.

**Characteristics:**

- High uncertainty in both the problem and the solution space
- Many parallel experiments running simultaneously
- Small, autonomous teams with high tolerance for ambiguity
- No established best practices -- the team is creating the first instances
- High failure rate is expected and acceptable (70-90% of experiments fail)

**Role of the company:** Create the conditions for innovation rather than prescribing outcomes. Fund experiments with small budgets and short time horizons. Celebrate learning from failure. Hire and retain pioneers -- people who thrive in chaos and novelty. Protect innovators from the efficiency-oriented culture required in Phase 3.

**Investment profile:** Many small bets. Each individual experiment is low cost. Aggregate spend on innovation is high. Portfolio thinking applies -- the value comes from the few winners, not from any single bet.

**Success signal:** A small number of experiments demonstrate strong, repeatable user demand. These candidates show enough traction to justify concentrated investment. They are ready to move to Phase 2.

**Warning signs of failure:** All experiments are too similar (not enough diversity). Experiments run too long without kill criteria. The organization punishes failure, chilling genuine exploration.

---

### Phase 2 -- Leverage (Custom-Built to Product)

Take successful innovations from Phase 1 and scale them. Build competitive advantage through superior execution, process discipline, and feature development. This is where the company captures direct market value.

**Characteristics:**

- Increasing certainty about what works and what users want
- Growing user base with quantifiable demand
- Feature-based competition with other providers
- Scaling challenges dominate -- hiring, process, quality, reliability
- The component moves from Custom-Built toward Product stage on the evolution axis

**Role of the company:** Industrialize the innovation. Introduce process, repeatability, and measurement. Hire settlers -- people who excel at taking a rough prototype and building a reliable, scalable product. Optimize unit economics. Build competitive moats through execution quality.

**Investment profile:** Concentrated investment in the winners from Phase 1. Resources shift from breadth (many experiments) to depth (scaling the proven ones). Marketing, sales, and distribution receive funding. Engineering focus moves from prototyping to production hardening.

**Success signal:** The capability reaches Product stage with clear market demand, repeatable delivery, multiple customers, and a defensible position. Revenue and usage grow predictably. The product has established good practices (not yet best practices).

**Warning signs of failure:** Scaling a product nobody wants (skipping demand validation). Over-investing in a single winner too early. Applying Genesis-phase thinking (constant pivoting) to what needs stability.

---

### Phase 3 -- Commoditize (Product to Commodity/Utility)

Deliberately drive successful products toward Commodity or Utility status. Standardize, automate, and make the capability available as a platform for others to build on. This is counterintuitive -- you are intentionally reducing the margin on something profitable -- but the strategic payoff is the next innovation cycle.

**Characteristics:**

- Standardization of interfaces, APIs, and delivery models
- Volume operations with aggressive cost reduction
- Ecosystem formation -- third parties begin building on your commodity layer
- Best practices become established and widely known
- Differentiation between providers becomes negligible; competition shifts to price and reliability

**Role of the company:** Industrialize aggressively. Automate everything possible. Create APIs, SDKs, and standards that make it trivially easy for others to build on top. Shift to utility pricing (pay-per-use, subscription). Hire town planners -- people who excel at operational efficiency, standardization, and scale.

**Investment profile:** Operational efficiency investment dominates. Automation, platform engineering, and developer experience. Margins compress on the commodity layer, but volume increases and the strategic value shifts to ecosystem capture.

**Success signal:** An ecosystem of third-party innovation emerges on top of your commodity layer. Customers and partners are building novel things you did not anticipate. This is the Genesis phase of the next cycle -- happening at a higher abstraction level, on your platform.

**Warning signs of failure:** Commoditizing too early (before the product has captured enough value in Phase 2). Commoditizing without building ecosystem tools (APIs, docs, SDKs). Resisting commoditization to protect margins -- leaving the opportunity for a competitor.

---

## 3. The ILC Flywheel

The power of ILC comes from its cyclical, compounding nature. Each turn of the cycle builds on the previous one.

```
Cycle N:    Innovate --> Leverage --> Commoditize
                                         |
                                         v
                                    [New Platform Layer]
                                         |
                                         v
Cycle N+1:  Innovate --> Leverage --> Commoditize
                                         |
                                         v
                                    [Higher Platform Layer]
                                         |
                                         v
Cycle N+2:  Innovate --> ...
```

**Step-by-step flywheel mechanics:**

1. **Innovate** creates new value at the Genesis stage. Small experiments explore what is possible on the current platform.
2. **Leverage** scales the winners into Products. The company captures direct market value through superior execution.
3. **Commoditize** standardizes the Product into a Commodity or Utility. APIs and platforms emerge. Margins compress but volume explodes.
4. **Platform enables new Genesis.** The commodity layer removes cost and complexity, opening new design space. Third parties (and your own innovators) begin experimenting at a higher abstraction level.
5. **Cycle repeats.** Each generation has more infrastructure to build on and can therefore move faster and reach higher.

**Compounding effect:** The first cycle might take a decade. The second takes five years. The third takes two. Each cycle accelerates because the platform underneath is richer, the ecosystem is larger, and the company has learned the ILC pattern itself.

**Critical insight:** The company practicing ILC does not just profit from each phase -- it profits from the *transitions* between phases. The transition from Innovate to Leverage captures first-mover advantage. The transition from Leverage to Commoditize captures ecosystem lock-in. The transition from Commoditize to the next Innovate captures optionality on the entire next generation.

---

## 4. Case Study: Amazon Web Services

AWS is the canonical example of ILC executed deliberately and repeatedly.

### Cycle 1: Compute and Storage

| Phase | What Happened | Timeline |
|-------|--------------|----------|
| **Innovate** | Amazon built custom infrastructure (compute, storage, networking) for its own e-commerce platform. Genesis stage -- nobody had built elastic, API-driven infrastructure at this scale. Internal teams experimented with service-oriented architecture. | 2000-2004 |
| **Leverage** | Recognized that internal infrastructure capabilities could serve external customers. Launched S3 (March 2006) and EC2 (August 2006). Moved from Custom-Built to Product. Iterated rapidly on features based on customer demand. | 2004-2010 |
| **Commoditize** | Drove compute and storage to Commodity/Utility pricing. Created standardized APIs. Pay-per-use billing. Massive economies of scale. Open ecosystem for anyone to build on. | 2008-present |

### Cycle 2: Higher-Level Services

AWS customers built databases on raw EC2 instances. AWS observed this pattern and commoditized it:

- **RDS** (2009): Managed relational databases -- commoditized what customers were custom-building on EC2
- **DynamoDB** (2012): Managed NoSQL -- commoditized a pattern customers had pioneered
- **Redshift** (2012): Managed data warehousing -- same cycle, different domain
- **ElastiCache** (2011): Managed caching layer

Each of these followed the same ILC pattern: customers innovated on the platform, AWS observed what worked, then leveraged and commoditized it.

### Cycle 3: Application Services and Machine Learning

- **Lambda** (2014): Serverless compute -- commoditized the deployment and scaling patterns customers had built
- **SageMaker** (2017): Managed ML -- commoditized the ML pipeline patterns emerging on EC2
- **Bedrock** (2023): Managed foundation model access -- commoditizing AI infrastructure

### Key Insights from the AWS Case

**Risk transfer:** Customers take the high-risk innovation gamble (most fail). AWS observes what works across millions of customers, then commoditizes the winning patterns with near-zero risk. The information asymmetry is enormous -- AWS sees all the experiments.

**Ecosystem lock-in:** Each commoditization layer increases switching costs. A customer using EC2 might switch. A customer using EC2 + RDS + Lambda + SageMaker + S3 is deeply embedded.

**Self-perpetuating cycle:** Each new commodity service makes AWS a better platform for innovation, attracting more customers, generating more observable patterns, creating more commoditization opportunities.

---

## 5. ILC for AI Products

The ILC model is particularly relevant to the current AI landscape, where evolution is happening at unprecedented speed.

### Current AI ILC Cycle (2024-2026)

| Layer | ILC Phase | Evidence |
|-------|-----------|----------|
| **Foundation models** (GPT, Claude, Llama) | Commoditizing | Multiple providers, API standardization, open-source alternatives, price competition, declining per-token costs |
| **Inference infrastructure** (GPU clouds, serving) | Late Leverage / Early Commoditize | Consolidation around a few providers, serverless inference emerging, standard APIs |
| **Application frameworks** (agent orchestration, RAG) | Leverage | LangChain, CrewAI, and similar frameworks scaling. Feature competition. Not yet standardized. |
| **Domain-specific AI** (legal AI, medical AI, coding AI) | Early Leverage | Successful experiments being scaled. Vertical-specific products emerging. |
| **Context engineering and evaluation** | Innovate / Early Leverage | High uncertainty. Many approaches. No standard. Active experimentation. |
| **Autonomous multi-agent systems** | Genesis | Novel, poorly understood. High failure rate. Experimental. |

### Implications for AI Startups

**The wrapper trap:** Do not build your core value on a layer that is actively commoditizing. If your product is a thin wrapper around a foundation model API, your value proposition evaporates as the model layer commoditizes further. The "GPT wrapper" critique is an ILC argument -- you are building at the Leverage stage on a layer entering Commoditize, leaving no room for margin.

**Build at the highest Genesis/Custom-Built layer:** The most defensible position is at the frontier of innovation -- where components are still in Genesis or early Custom-Built stages. Currently, these are: context engineering, evaluation frameworks, domain-specific reasoning chains, and multi-agent coordination.

**Commoditization signals to watch for:**

- Open-source alternatives appear for something you charge for
- Multiple providers offer similar capabilities with standardizing APIs
- Price competition intensifies and margins compress
- Customers begin comparing providers on price and reliability, not features
- "Good enough" alternatives emerge that satisfy most use cases

**Plan your leverage phase before entering it.** Know in advance: what metrics indicate you should shift from innovating to scaling? What does your team and process need to look like in each phase? When will you deliberately commoditize your own product to capture the next cycle?

### ILC Assessment Framework for AI Products

For each component in the value chain, answer:

1. **Is this in Innovate phase?** Novel capability, high uncertainty, experimental. Your advantage is being first and learning fastest.
2. **Is this in Leverage phase?** Scaling a proven capability, building competitive advantage through execution. Your advantage is operational excellence.
3. **Is this in Commoditize phase?** Standardizing, creating platform value. Your advantage is ecosystem and scale.
4. **Where is the NEXT cycle?** What innovation does your commoditization enable? What will third parties build on your platform?

---

## 6. ILC vs. Traditional Strategy Models

| Model | Focus | Core Limitation | How ILC Differs |
|-------|-------|----------------|-----------------|
| **Porter's Value Chain** | Activities that create and capture value | Static snapshot -- does not account for how activities evolve over time | ILC adds temporal dynamics: every activity evolves, and that evolution is strategically manageable |
| **Christensen's Disruption Theory** | How incumbents are displaced by entrants | Focuses on disruption as an event or class of events, not as a continuous cycle | ILC is a continuous, repeatable cycle. Disruption is one possible outcome of failing to practice ILC |
| **Blue Ocean Strategy** | Creating uncontested market space through value innovation | Focuses on market creation but says little about what happens after the blue ocean is found | ILC covers the full lifecycle: create the ocean (Innovate), dominate it (Leverage), pave it over as infrastructure (Commoditize) |
| **S-Curve / Technology Adoption Models** | How technologies are adopted over time | Descriptive -- explains adoption patterns but does not prescribe strategy | ILC is prescriptive: do this in Genesis, do this in Product, do this in Commodity |
| **BCG Growth-Share Matrix** | Portfolio allocation across business units | Classifies units by growth and share but misses evolution dynamics | ILC explains why "cash cows" should be deliberately commoditized to fund and enable the next "question marks" |

**Key difference from all traditional models:** ILC treats evolution as the fundamental strategic variable. Other models either ignore evolution (Porter), describe it passively (S-Curve), or treat it as a threat (Christensen). ILC treats it as the primary lever.

---

## 7. ILC Assessment Protocol

When agents assess a company's or product's ILC positioning, follow this protocol.

### Step 1: Map the Value Chain

List all major components the product or company depends on. Include both internal capabilities and external dependencies. Position each on the evolution axis (Genesis, Custom-Built, Product, Commodity).

### Step 2: Classify Each Component by ILC Phase

For each component, determine:

| Classification | Criteria |
|---------------|----------|
| **Innovate** | The company is actively experimenting with this component. High uncertainty. Multiple approaches being tested. No clear winner yet. |
| **Leverage** | The company is scaling this component. Investment is concentrated. Competitive advantage is being built through execution. |
| **Commoditize** | The company is standardizing this component. APIs exist. Ecosystem is forming. Operational efficiency is the priority. |
| **Not managed (organic)** | The component is evolving through market forces without deliberate ILC management. This is the default state -- most companies are here for most components. |

### Step 3: Check Portfolio Balance

Assess the distribution across phases:

| Imbalance | Symptom | Risk |
|-----------|---------|------|
| **Too much Innovate** | Many experiments, nothing scaling | Burning cash without capturing value. Innovation theater. |
| **Too much Leverage** | Strong current products, no pipeline | Vulnerable to disruption. Current products will eventually commoditize with or without you. |
| **Too much Commoditize** | Efficient operations, no new value | The commodity layer generates diminishing returns without new innovation on top. |
| **Nothing in Commoditize** | No platform play | Missing the compounding flywheel. Each product is a standalone business, not a foundation for the next. |

A healthy ILC portfolio has active components in all three phases simultaneously.

### Step 4: Identify the Next Commoditization Opportunity

Look for components currently in late Leverage or early Product stage that could be driven toward Commodity. Ask:

- Would standardizing this create a platform others would build on?
- Would commoditizing this open new design space above it?
- Do customers currently build custom solutions on top of this component?

### Step 5: Identify the Innovation That Commoditization Enables

For each commoditization candidate, project forward:

- If this were a utility/commodity, what would become possible that is not possible today?
- What new Genesis-stage experiments would the platform enable?
- Who would innovate on top of this layer -- internal teams, customers, or third-party ecosystem?

### Step 6: Recommend ILC Actions

Structure recommendations as concrete next steps:

- **Innovate actions:** What experiments to fund, what to explore, what kill criteria to set
- **Leverage actions:** What to scale, what investment to concentrate, what execution to improve
- **Commoditize actions:** What to standardize, what APIs to build, what to open up
- **Transition actions:** What is ready to move from one phase to the next, and what organizational changes that requires (different people, different processes, different metrics)
