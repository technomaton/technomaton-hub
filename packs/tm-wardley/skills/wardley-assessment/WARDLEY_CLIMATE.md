<!-- Source: Simon Wardley, "Wardley Maps" book, CC-BY-SA-4.0 -->
<!-- Source: Ben Mosior, learnwardleymapping.com, CC-BY-SA-4.0 -->
<!-- Adapted for AI agent consumption by TECHNOMATON -->

# Wardley Climatic Patterns -- The Forces That Shape the Landscape

## 1. What Are Climatic Patterns?

Climatic patterns are forces that act on the landscape regardless of your choices. They are comparable to weather patterns in geography: you cannot stop them, you can only anticipate and adapt. A climatic pattern is something that **will happen** to your map over time whether you plan for it or not.

### Climatic Patterns vs. Doctrine vs. Gameplay

Understanding the distinction between these three categories is essential for correct strategic reasoning.

| Category | Definition | Nature | Example |
|----------|-----------|--------|---------|
| **Climate** | Forces that affect the landscape | Unavoidable. These happen *to* you. | "Components evolve from Genesis to Commodity" |
| **Doctrine** | Universal principles of good practice | Advisable. These are what you *should* always do. | "Use appropriate methods for the evolution stage" |
| **Gameplay** | Context-specific strategic moves | Optional. These are what you *choose* to do. | "Open-source a component to accelerate commoditization" |

**Climate** is the input to strategy. **Doctrine** is the foundation of competence. **Gameplay** is the creative act of strategy itself. You read the climate, apply doctrine, then choose gameplay.

### Why Climatic Patterns Matter

Ignoring climatic patterns is like ignoring gravity. Your strategy will fail regardless of how clever it is if it depends on a component remaining novel when competition is already driving it toward commodity. Every strategic assessment must begin with a climate scan: which patterns are active, which components do they affect, and what is the expected trajectory?

A map without a climate reading is a snapshot with no sense of direction. The patterns described below give you that direction.

---

## 2. The 30 Climatic Patterns

The patterns are organized into five categories based on what they primarily describe: the mechanics of evolution itself, competitive dynamics, user behavior, ecosystem effects, and predictability and timing.

---

### Category 1: Evolution Patterns

These patterns describe how and why components move along the evolution axis.

---

#### Pattern 1 -- Everything Evolves Through Supply and Demand Competition

**Definition:** Components move from Genesis to Commodity as competition among suppliers and demand from consumers increases.

**Mechanism:** When a novel capability proves valuable, demand rises. Demand attracts suppliers. Multiple suppliers compete on features, then on price, then on operational efficiency. This competitive pressure is the engine of evolution. Without competition, evolution stalls; with it, evolution is inevitable.

**Where it applies:** All stages. The pattern describes the entire left-to-right movement, but its force is most visible at the transitions between stages -- Genesis to Custom, Custom to Product, Product to Commodity.

**Signals:**
- New entrants appearing in a previously uncrowded space
- Feature parity increasing across providers
- Price competition replacing feature competition
- RFPs and procurement processes emerging for what was once bespoke

**Strategic implication:** Never assume a component will stay where it is. If demand exists and barriers to entry are low, competition will push the component rightward. Plan for the next stage, not the current one.

---

#### Pattern 2 -- Evolution Is Not Equally Predictable at All Stages

**Definition:** Genesis-stage components are highly unpredictable in timing and outcome; Commodity-stage components are highly predictable.

**Mechanism:** At Genesis, there is no historical data, no established market, and no reference architecture. Outcomes are genuinely uncertain. As a component evolves, patterns of usage, pricing, and performance become established. By the Commodity stage, behavior is so predictable that SLAs can guarantee specific outcomes.

**Where it applies:** Predictability increases monotonically from left to right across the evolution axis.

**Signals:**
- Genesis: "We don't know if this will work" -- experimentation language
- Custom: "We've seen this work in a few cases" -- case-study language
- Product: "The market is well-understood" -- analyst-report language
- Commodity: "99.99% uptime guaranteed" -- SLA language

**Strategic implication:** Do not apply Commodity-stage planning methods (detailed forecasts, fixed budgets, precise timelines) to Genesis-stage work. Use exploration methods on the left, exploitation methods on the right. Match management approach to predictability level.

---

#### Pattern 3 -- Components Will Evolve

**Definition:** Nothing stays novel forever. Assume every component will eventually commoditize.

**Mechanism:** This is a corollary of Pattern 1. As long as a component has value, it attracts competition. Competition drives evolution. The only question is speed, not direction. Even components that appear stable in Genesis for a long time will eventually move when a catalyst (new technology, regulatory change, market shift) lowers the barrier to competition.

**Where it applies:** Every component on the map. No exceptions.

**Signals:**
- Open-source alternatives appearing for proprietary technology
- Academic research transitioning to commercial products
- "Good enough" alternatives emerging at lower price points
- Industry consortiums forming around standardization

**Strategic implication:** Build your strategy on the assumption that today's differentiator is tomorrow's commodity. Invest in the Genesis capabilities that will replace your current advantages before competitors do.

---

#### Pattern 4 -- Characteristics Change as Components Evolve

**Definition:** The properties that define success at one evolution stage are different from -- and often opposite to -- those at another stage.

**Mechanism:** In Genesis, success requires tolerance for failure, high experimentation, and unique talent. In Commodity, success requires operational efficiency, volume, standardization, and cost control. The same management practices, metrics, and organizational structures that make a Genesis component thrive will strangle a Commodity operation, and vice versa. This is not a failure of management; it is a structural reality of evolution.

**Where it applies:** Every transition between stages, but most painfully at the Custom-to-Product and Product-to-Commodity transitions where organizations must change their operational model.

**Signals:**
- Genesis metrics: learning rate, experiment velocity, novelty of output
- Custom metrics: client satisfaction, delivery quality, expertise depth
- Product metrics: market share, feature comparison, growth rate
- Commodity metrics: cost per unit, uptime, operational margin

**Strategic implication:** Do not manage all components the same way. Bimodal or multimodal management is not a fad; it is a structural requirement. Different evolution stages demand different practices, metrics, skills, and culture.

---

#### Pattern 5 -- No Single Method Fits All Stages

**Definition:** Different management methodologies are appropriate for different evolution stages.

**Mechanism:** Methods co-evolve with the components they manage. Agile and lean startup thrive in Genesis and early Custom because they embrace uncertainty and rapid iteration. Lean manufacturing and six sigma thrive in late Product and Commodity because they optimize for efficiency and eliminate variation. Applying the wrong method to the wrong stage produces pathological outcomes: waterfall on Genesis stifles innovation; agile on Commodity creates unnecessary churn.

**Where it applies:** All stages. This is the methodological dimension of Pattern 4.

| Evolution Stage | Appropriate Methods | Anti-Pattern |
|----------------|--------------------:|--------------|
| Genesis | Agile, exploration sprints, design thinking, prototyping | Waterfall planning, fixed requirements |
| Custom-Built | Lean startup, iterative delivery, customer development | Rigid cost optimization, outsourcing |
| Product (+Rental) | Product management, A/B testing, lean analytics | Pure experimentation without market focus |
| Commodity (+Utility) | Six Sigma, SRE, capacity planning, cost engineering | Agile sprints on stable infrastructure |

**Signals:**
- Teams complaining that "the process doesn't fit the work"
- Methodology wars within the organization
- One-size-fits-all mandates from leadership ("everyone does Scrum")

**Strategic implication:** Map your components, then assign methods by evolution stage. Allow different teams to use different approaches based on where their components sit. This is not inconsistency; it is strategic coherence.

---

#### Pattern 6 -- Evolution Speed Is Not Uniform

**Definition:** Some components commoditize in months while others take decades.

**Mechanism:** Evolution speed depends on: (a) the intensity of competition, (b) the availability of enabling technology, (c) regulatory constraints, and (d) the complexity of the component itself. Software commoditizes faster than hardware. Hardware commoditizes faster than regulation. AI capabilities are currently commoditizing at unprecedented speed because enabling infrastructure (cloud compute, open-source frameworks) is already at Commodity stage.

**Where it applies:** All components, but the variance is most visible when comparing components in different domains on the same map.

**Signals:**
- New open-source implementations appearing within months of a proprietary breakthrough
- Regulatory processes moving at their own pace regardless of technology speed
- Hardware refresh cycles measured in years while software cycles measure in weeks

**Strategic implication:** When reading a map, do not assume all components will evolve at the same rate. Identify which components are on "fast tracks" (software, AI, cloud-native) and which are on "slow tracks" (regulation, physical infrastructure, organizational culture). Mismatched speeds create gaps and opportunities.

---

#### Pattern 7 -- Past Success Breeds Inertia

**Definition:** The more successful an organization has been with a particular approach, the harder it is to abandon that approach when evolution demands change.

**Mechanism:** Success creates reinforcing loops: investment in existing capabilities, organizational identity tied to current methods, revenue streams dependent on current architecture, career paths built around current expertise. These are rational responses to past performance but become anchors when the landscape shifts. Inertia is not stupidity; it is the rational weight of sunk costs and proven history resisting an uncertain future.

**Where it applies:** Most acute at the Custom-to-Product and Product-to-Commodity transitions, where organizations must cannibalize their own profitable offerings.

**Signals:**
- "That's how we've always done it" language
- Active resistance to new tools or methods despite clear evidence of their effectiveness
- Revenue protection arguments against adoption of newer, cheaper alternatives
- Organizational restructuring proposals that preserve the status quo with new labels

**Strategic implication:** Expect inertia. Budget for it. Plan change management alongside technical migration. When you see inertia in a competitor, it represents an opportunity window: they will be slow to respond to evolution you are driving.

---

### Category 2: Competition Patterns

These patterns describe how competitive dynamics interact with evolution.

---

#### Pattern 8 -- Competitors Will Copy Successful Innovations

**Definition:** If an innovation is visibly successful and the mechanism is not protected by an unbreakable barrier, competitors will replicate it.

**Mechanism:** Success is a signal. Visible success is a loud signal. Competitors reverse-engineer what works and build their own version. This is not unethical; it is the fundamental mechanism of market evolution. Patents slow copying in some domains but rarely stop it entirely. Trade secrets help only as long as they remain secret. In software and AI, where the barrier to replication is often just talent and compute, copying happens fast.

**Where it applies:** Most intense at the Custom-to-Product transition, where successful custom solutions get productized by fast followers.

**Signals:**
- Competitor product launches that mirror your features with a 6-12 month lag
- Job postings at competitors that match your team's skill profile
- Patent filings in your domain by companies not previously active there
- "Me too" announcements at industry conferences

**Strategic implication:** Do not build strategy on the assumption that your current innovation will remain unique. Assume it will be copied. Build your advantage on the speed of your next innovation, not the durability of your current one.

---

#### Pattern 9 -- Best Practices Evolve from Novel to Industrialized

**Definition:** What was once a breakthrough methodology becomes standard operating procedure over time.

**Mechanism:** Practices follow the same evolution curve as activities. A novel practice (e.g., continuous deployment in 2010) starts as an experiment by pioneers, becomes a recognized approach adopted by early followers, becomes a "best practice" recommended by consultants, and eventually becomes table stakes that no one considers optional. Organizations that adopt practices early gain temporary advantage; those that adopt late merely reach parity.

**Where it applies:** The evolution of practices often lags the evolution of the underlying activity by one stage.

**Signals:**
- Consulting firms packaging a practice into frameworks and certifications
- Conference talks shifting from "here's a new idea" to "here's how we implemented it"
- Industry reports listing the practice as a "must-have"
- Compliance frameworks incorporating the practice as a requirement

**Strategic implication:** Track the evolution of your practices as rigorously as you track the evolution of your technology. A practice at Product stage gives you parity, not advantage. Advantage requires practices that are still in Genesis or Custom.

---

#### Pattern 10 -- Higher-Order Systems Create New Sources of Value

**Definition:** When a component commoditizes, it becomes a building block for new higher-order systems that did not previously exist.

**Mechanism:** Commoditization makes a capability cheap, reliable, and accessible. This removes a barrier to innovation at the layer above. Electricity becoming a utility enabled mass manufacturing. Cloud compute becoming a utility enabled SaaS. LLM inference becoming a utility enables agent-based applications. Each commoditization event is simultaneously a death of differentiation at one layer and a birth of possibility at the layer above.

**Where it applies:** At the Commodity stage of one component and the Genesis stage of the higher-order system it enables.

**Signals:**
- Startups building on top of a newly commoditized platform
- "Platform" or "ecosystem" language emerging around a mature component
- Venture capital shifting investment from the commodity layer to the innovation layer above it
- New job titles appearing that combine the commoditized capability with novel applications

**Strategic implication:** When you see a component approaching Commodity, immediately look for the higher-order systems it will enable. That is where the next wave of value creation will occur. Being early to the higher-order system is more valuable than trying to maintain differentiation at the commodity layer.

---

#### Pattern 11 -- Capital Flows to Higher-Order Systems

**Definition:** Investment follows the creation of new value, which means it flows toward the Genesis-stage systems enabled by newly commoditized components.

**Mechanism:** Investors seek returns. Returns come from growth. Growth comes from new value creation. When a layer commoditizes, returns at that layer shrink (margins compress, competition is on price). The higher-order systems enabled by that commodity offer high growth potential and therefore attract capital. This creates a self-reinforcing cycle: capital funds higher-order innovation, which creates demand for the commodity, which further commoditizes it.

**Where it applies:** Most visible immediately after a major commoditization event (cloud in 2010-2015, LLMs in 2023-2025).

**Signals:**
- Venture capital deal flow shifting to new application categories
- Declining investment in the commodity layer ("infrastructure is solved")
- Acqui-hires targeting teams with higher-order system expertise
- New accelerator programs focused on applications of the commodity

**Strategic implication:** Align your investment strategy with capital flow patterns. If you are at the commodity layer, compete on efficiency. If you are building higher-order systems, this is your funding window. Do not compete for commodity-layer capital with higher-order-system economics.

---

#### Pattern 12 -- Efficiency Enables Innovation

**Definition:** As components become commodities and operational efficiency improves, freed resources become available for new Genesis activities.

**Mechanism:** When a previously expensive, labor-intensive capability becomes cheap through commoditization, the budget and headcount that were dedicated to it do not simply vanish. They become available -- either as direct cost savings reinvested in R&D, or as organizational capacity redirected to new challenges. The efficiency gained at the Commodity layer funds experimentation at the Genesis layer. This is how organizations maintain a pipeline of innovation: by continuously recycling resources from mature capabilities to novel ones.

**Where it applies:** Organizational level. This pattern governs budget allocation and headcount planning across the entire portfolio.

**Signals:**
- "We saved X by moving to cloud; now we're investing X in AI" narratives
- Teams being redeployed from maintenance of legacy systems to new product development
- R&D budget growing as a percentage of revenue after a major commoditization migration
- Innovation labs funded by operational savings from outsourcing or automation

**Strategic implication:** Actively drive commoditization of mature components to free resources for innovation. If you are not recycling resources from Commodity back to Genesis, you are leaving innovation capacity on the table.

---

#### Pattern 13 -- Supply and Demand Competition Drives Evolution

**Definition:** The fundamental engine of evolution is competition between multiple suppliers to meet growing demand.

**Mechanism:** This is the detailed mechanism behind Pattern 1. On the supply side, providers compete to offer better, cheaper, more standardized versions of a capability. On the demand side, consumers reward those improvements by shifting their purchases. This dual pressure -- supply-side competition and demand-side preference for better value -- is what physically moves components along the evolution axis. Without multiple suppliers, evolution slows. Without growing demand, suppliers lack incentive to invest.

**Where it applies:** All stages, but the dynamics differ. In Genesis, competition is for talent and funding. In Product, competition is on features. In Commodity, competition is on price and reliability.

**Signals:**
- Increasing number of providers in a space
- Price reductions year over year
- Standardization of interfaces and APIs
- Procurement shifting from relationship-based to RFP-based

**Strategic implication:** To accelerate evolution of a component (which may be strategically desirable), increase competition: open-source your implementation, publish standards, lower barriers to entry. To slow evolution (which may also be strategically desirable), increase barriers: pursue patents, create proprietary lock-in, build network effects.

---

### Category 3: User Patterns

These patterns describe how users interact with and respond to evolving components.

---

#### Pattern 14 -- Users' Needs Change

**Definition:** What users want today is not what they will want tomorrow.

**Mechanism:** As users become familiar with a capability, their expectations shift. Initial gratitude for the capability's existence gives way to demands for better performance, lower cost, and new features. Simultaneously, changes in the broader environment (new technologies, cultural shifts, competitive offerings) create entirely new needs that did not exist before. User needs are a moving target, and they move in the direction of higher sophistication and broader scope.

**Where it applies:** All stages, but the nature of need change differs. At Genesis, needs are poorly articulated. At Product, needs are specific and demanding. At Commodity, needs shift to the higher-order system.

**Signals:**
- Feature requests evolving from "can it do X?" to "can it do X faster, cheaper, and integrated with Y?"
- Customer churn driven by competitors offering the next-generation capability
- Support tickets revealing usage patterns you did not anticipate
- Users building workarounds that indicate unmet needs

**Strategic implication:** Continuously research user needs. Do not assume that satisfying today's needs guarantees tomorrow's relevance. Build feedback loops that detect shifting needs early.

---

#### Pattern 15 -- Users Want Simplicity

**Definition:** As components mature, users expect simpler, more accessible interfaces regardless of underlying complexity.

**Mechanism:** In Genesis, users accept complexity because they have no alternative and are often experts themselves. As a component evolves, the user base broadens to include less technical users who demand simpler interaction models. The progression is: command-line to GUI to API to invisible-infrastructure. Each evolution stage brings expectations of reduced cognitive load.

**Where it applies:** Custom-to-Product and Product-to-Commodity transitions, where the user base expands beyond early adopters.

**Signals:**
- "It's too complicated" appearing in user feedback
- Competitors winning on UX rather than features
- Wrappers and abstractions being built by third parties on top of your component
- Users preferring a less capable but simpler alternative

**Strategic implication:** Invest in simplification as your component evolves. The winning Product is not the one with the most features but the one that is easiest to use. The winning Commodity is the one that is invisible.

---

#### Pattern 16 -- Users Lag Behind Technology

**Definition:** Adoption follows an S-curve; the early majority arrives later than innovators expect.

**Mechanism:** Technology capabilities advance ahead of most users' ability or willingness to adopt them. Innovators and early adopters embrace new capabilities quickly, but the early majority waits for social proof, proven reliability, organizational readiness, and simplified access. The gap between technological possibility and mainstream adoption is the "adoption lag." This lag is structural: it is driven by organizational inertia, training requirements, risk aversion, and switching costs.

**Where it applies:** Genesis-to-Custom and Custom-to-Product transitions, where the gap between what is technically possible and what is widely adopted is largest.

**Signals:**
- Technology press excitement that does not match actual enterprise adoption rates
- "Pilot" and "proof of concept" language persisting for years
- Analyst forecasts consistently overpredicting near-term adoption
- Wide gap between startup usage and enterprise usage of the same technology

**Strategic implication:** Do not confuse technical readiness with market readiness. Plan your go-to-market for the adoption curve, not the capability curve. Being too early to market is as dangerous as being too late.

---

#### Pattern 17 -- Users Become More Demanding as Offerings Mature

**Definition:** Expectations rise with each evolution stage.

**Mechanism:** As a component evolves, users treat each new stage's capabilities as the baseline for the next. What was impressive at Genesis becomes expected at Custom, becomes table stakes at Product, and becomes a non-negotiable SLA at Commodity. Users do not consciously raise expectations; their context shifts as the market provides more options, benchmarks, and points of comparison. This ratchet effect is irreversible.

**Where it applies:** Every stage transition, compounding over time.

**Signals:**
- Declining satisfaction scores despite objectively improving performance
- "That's not good enough anymore" language from previously satisfied customers
- RFP requirements that would have been considered unrealistic two years ago
- Competitor benchmarks raising the floor for acceptable performance

**Strategic implication:** Budget for continuously rising performance requirements. What satisfies users today will not satisfy them in 18 months. Build capabilities that can scale ahead of expectation growth, not just match it.

---

#### Pattern 18 -- Users Cannot Envision Genesis-Stage Capabilities

**Definition:** You cannot ask users what they want when the capability does not yet exist.

**Mechanism:** Users reason from their current experience. They can articulate improvements to existing capabilities (faster, cheaper, easier) but cannot imagine capabilities that have no precedent in their experience. No focus group in 2005 would have described the iPhone. No enterprise survey in 2020 would have described AI-generated code. Genesis-stage innovation must be driven by vision and experimentation, not by user research.

**Where it applies:** Genesis stage exclusively. Once a component reaches Custom, users can articulate their experience with it and provide useful feedback.

**Signals:**
- User research returning only incremental improvement requests
- Market research failing to identify the product category that will disrupt you
- Visionary founders building things "no one asked for" that turn out to be essential
- Post-launch user reactions of "I didn't know I needed this, but now I can't live without it"

**Strategic implication:** Do not rely on user research for Genesis-stage innovation. Use exploration, experimentation, and visionary hypothesis-testing. Reserve user research for Custom-stage and later, where it becomes highly valuable.

---

### Category 4: Ecosystem Patterns

These patterns describe how ecosystems form, evolve, and interact with individual components.

---

#### Pattern 19 -- Ecosystems Emerge Around Commodities

**Definition:** When a component becomes a utility, third parties build complementary products and services on top of it.

**Mechanism:** A commodity is reliable, cheap, and standardized. These properties make it a safe foundation for building new things. Third parties can invest in building on top of a commodity without fear of the foundation changing unpredictably. This attracts developers, integrators, and complementary product builders, creating an ecosystem. The ecosystem increases the value of the commodity (network effects), which attracts more ecosystem participants, creating a virtuous cycle.

**Where it applies:** Late Product and Commodity stages.

**Signals:**
- Third-party plugins, integrations, and extensions appearing
- Developer conferences and communities forming around the component
- Marketplace or app store dynamics emerging
- Consulting firms specializing in the component

**Strategic implication:** If you own a component approaching Commodity, actively cultivate an ecosystem. The ecosystem becomes a moat that is harder to replicate than the commodity itself. If you are building on a commodity, evaluate the ecosystem's health as a proxy for the commodity's stability.

---

#### Pattern 20 -- Co-Evolution Occurs

**Definition:** Components evolve together; a practice evolves as its underlying activity evolves.

**Mechanism:** When an activity moves from one evolution stage to another, the practices, data, and knowledge associated with it must also evolve. The shift from on-premise servers (Product) to cloud compute (Commodity) co-evolved with the shift from traditional IT operations to DevOps. The shift from custom ML models (Custom) to LLM APIs (Product/Commodity) is co-evolving with the shift from ML engineering to prompt engineering. Co-evolution is not optional: if the activity evolves but the practice does not, the organization has a mismatch that produces dysfunction.

**Where it applies:** At every stage transition, across all four component types (activities, practices, data, knowledge).

**Signals:**
- New job titles emerging alongside a technology shift
- Existing methodologies being declared "dead" or "outdated"
- Training programs and certifications appearing for the new practice
- Organizational restructuring following a technology migration

**Strategic implication:** When planning for a component's evolution, also plan for the co-evolution of its associated practices, data formats, and knowledge requirements. A technology migration without a practice migration is incomplete and will underperform.

---

#### Pattern 21 -- The Future Is Not Evenly Distributed

**Definition:** Some geographies, industries, and organizations evolve faster than others.

**Mechanism:** Evolution speed depends on local conditions: regulatory environment, capital availability, talent density, cultural openness to change, and existing infrastructure. Silicon Valley adopts faster than regulated industries. Startups adopt faster than enterprises. Developed economies adopt faster than developing ones (though leapfrogging occurs). This uneven distribution means that the future is already visible somewhere -- you just have to look in the right place.

**Where it applies:** All components, all stages. The unevenness is a property of the environment, not the component.

**Signals:**
- The same technology at different evolution stages in different geographies or industries
- Startups using capabilities that enterprises are still evaluating
- Regulatory sandboxes enabling faster evolution in specific jurisdictions
- "Best practice" in one industry being "cutting edge" in another

**Strategic implication:** Scout for the future in fast-evolving environments. What is Genesis in your industry may be Product in another. Learn from the advanced cases. Conversely, what is Commodity in your context may be a competitive advantage in a less evolved market.

---

#### Pattern 22 -- New Entrants Rarely Follow Old Rules

**Definition:** Disruptors build for the next evolution stage, not the current one.

**Mechanism:** Incumbents optimize for the current state of the landscape. Their processes, pricing, organizational structure, and mental models are all calibrated to the current evolution stage. New entrants have no such baggage. They build directly for the emerging stage, using the latest commodity components as their foundation. They do not try to compete at the incumbent's game; they change the game. Incumbents then face a double disadvantage: they must evolve their technology AND their organizational model.

**Where it applies:** Most disruptive at the Product-to-Commodity transition, where incumbents have the most to lose.

**Signals:**
- New companies offering dramatically lower prices with a simpler feature set
- Business models that make no sense under the incumbent's cost structure
- Founders with backgrounds outside the industry
- Products that incumbents dismiss as "toys" or "not enterprise-ready"

**Strategic implication:** Watch new entrants carefully. Do not dismiss simpler, cheaper alternatives. Evaluate whether they are building for the next evolution stage. If they are, they are a strategic threat regardless of their current size or feature set.

---

#### Pattern 23 -- Platform Effects Compound

**Definition:** Once an ecosystem forms around a commodity platform, switching costs rise exponentially.

**Mechanism:** Each additional participant in a platform ecosystem (developer, user, data contributor, integration partner) increases the value for all other participants and simultaneously increases the cost of leaving. The data generated on the platform, the integrations built, the workflows established, and the organizational knowledge accumulated all create compound lock-in. This is not a linear effect; it compounds with each new participant and each new use case.

**Where it applies:** Late Product and Commodity stages, especially for components that serve as platforms for others.

**Signals:**
- "We'd have to rebuild everything" language around switching discussions
- Data migration being the primary objection to changing providers
- Ecosystem-specific skills appearing on job postings
- Platform-specific certifications becoming career requirements

**Strategic implication:** If you are a platform owner, ecosystem growth is your primary strategic objective -- it compounds your defensibility. If you are a platform consumer, be deliberate about your dependency. Understand the switching costs before they become prohibitive. Build abstraction layers where feasible.

---

#### Pattern 24 -- Openness Accelerates Commoditization

**Definition:** Open-source code and open standards speed up the evolution of components toward Commodity.

**Mechanism:** Openness removes barriers to entry. When the implementation is freely available, any organization can build on it, contribute to it, or fork it. This dramatically increases the number of effective suppliers, which accelerates the supply-side competition that drives evolution (Pattern 13). Open standards additionally reduce switching costs between providers, further intensifying competition. The combination of open source and open standards can compress a decade of evolution into a few years.

**Where it applies:** Custom-to-Product and Product-to-Commodity transitions.

**Signals:**
- Open-source projects gaining adoption faster than proprietary alternatives
- Industry consortiums forming around open standards
- Proprietary vendors reluctantly opening APIs or publishing specs
- Cloud providers offering managed services around open-source projects

**Strategic implication:** Openness is a strategic weapon. Open-sourcing a component you want to commoditize accelerates its evolution and undermines competitors who depend on proprietary differentiation at that layer. Conversely, if you want to slow evolution, maintain proprietary control -- but recognize this is a delaying action, not a permanent defense.

---

#### Pattern 25 -- Industrialization Creates Opportunity

**Definition:** Each commoditization wave creates a new layer for innovation.

**Mechanism:** This is the ecosystem-level view of Pattern 10. When an entire category industrializes (compute, storage, communication, inference), it creates a new stable platform on which an entire generation of innovation can be built. The industrialization of electricity enabled mass manufacturing. The industrialization of compute enabled the software industry. The industrialization of LLM inference is enabling the agent industry. Each wave is both a destruction of value at the industrialized layer and a creation of value at the new layer.

**Where it applies:** At the macro level, when entire technology categories reach Commodity. Typically occurs every 10-20 years in technology, with AI-driven cycles now compressing to 3-5 years.

**Signals:**
- Entire categories being described as "solved" or "table stakes"
- New industries appearing that were not possible before the industrialization event
- Job markets shifting from the commodity layer to the innovation layer
- Conferences and publications shifting focus from the old frontier to the new one

**Strategic implication:** Identify the current industrialization wave. Position yourself at the innovation layer above it. The organizations that thrive are those that ride the industrialization wave rather than fighting it -- using the new commodity as the foundation for their Genesis activities.

---

### Category 5: Predictability and Timing Patterns

These patterns describe how to read the timing and direction of change.

---

#### Pattern 26 -- There Is a War Between the Old and the New

**Definition:** Incumbents resist commoditization while new entrants drive it.

**Mechanism:** Incumbents profit from the current stage. Their business models, pricing, organizational structure, and market position are all optimized for the status quo. Commoditization threatens their margins, their differentiation, and their relevance. They fight back with FUD (fear, uncertainty, doubt), patent litigation, lobbying for favorable regulation, and emphasizing the risks of the new approach. New entrants, unburdened by legacy, drive commoditization because it is their path to market. This war is structural and predictable. It happens at every evolution transition.

**Where it applies:** Every major stage transition, but most visible and contentious at Product-to-Commodity.

**Signals:**
- Incumbent marketing emphasizing risk and "enterprise readiness" of alternatives
- Industry lobbying against regulations that would level the playing field
- Patent infringement lawsuits targeting disruptors
- "Open letters" and "industry concerns" that coincide with competitive threats
- FUD campaigns questioning the security, reliability, or maturity of new approaches

**Strategic implication:** Recognize the war for what it is. If you are the incumbent, understand that resistance is a delaying tactic, not a winning strategy. Plan your transition. If you are the new entrant, expect resistance and build your strategy to work around it, not through it.

---

#### Pattern 27 -- Weak Signals Precede Disruption

**Definition:** Major market shifts start with small, easily overlooked signals that accelerate over time.

**Mechanism:** Disruption does not arrive suddenly. It is preceded by weak signals: academic papers, niche startups, enthusiast communities, edge-case use cases. These signals are weak individually but collectively indicate a direction. Most organizations miss them because they are filtered out by institutional attention mechanisms that focus on current revenue, current competitors, and current customers. By the time the signal is strong, the disruption is well underway.

**Where it applies:** Genesis and early Custom stages, where the signals are weakest and most easily dismissed.

**Signals for detecting weak signals:**
- Academic papers in a new field increasing in frequency
- Niche startups appearing with a common thesis
- Open-source activity increasing in a specific technology area
- Social media and conference "buzz" that has not yet reached mainstream analyst coverage
- Your most technically curious team members experimenting with something on the side

**Strategic implication:** Build organizational capability to detect and interpret weak signals. This requires: (a) people who scan widely, (b) forums where weak signals are discussed without dismissal, and (c) small-bet mechanisms that allow exploration of weak-signal opportunities before they become obvious.

---

#### Pattern 28 -- Change Happens Faster Than You Think

**Definition:** Especially in technology and AI, commoditization cycles are compressing.

**Mechanism:** Each successive technology wave commoditizes faster than the previous one because it builds on top of already-commoditized layers. Cloud commoditized in roughly a decade. Mobile platforms commoditized in roughly 7 years. LLM capabilities are commoditizing in 18-24 months. The enabling infrastructure for each new wave is more mature than it was for the previous wave, reducing the time required for each stage of evolution.

**Where it applies:** All stages, but the compression is most dramatic at Genesis-to-Product, which can now happen in months rather than years for AI-related components.

**Signals:**
- Time between "breakthrough announcement" and "available as a service" shrinking
- Open-source replications of proprietary capabilities appearing within weeks or months
- Pricing drops of 50%+ year over year
- "State of the art" changing multiple times per year

**Strategic implication:** Calibrate your planning cycles to the actual speed of change, not to historical precedent. If your strategic planning cycle is annual but your technology landscape changes quarterly, your strategy is always stale. In fast-moving domains, adopt shorter review cycles and more adaptive planning methods.

---

#### Pattern 29 -- Timing Is Critical

**Definition:** Being too early to a market is as dangerous as being too late.

**Mechanism:** Too early: the enabling infrastructure is not yet at Commodity, users have not yet recognized the need, and you burn capital educating the market. Too late: competitors have captured the market, best practices have formed around their approach, and you are fighting an uphill battle against established ecosystems. The optimal entry window is when the enabling components are at late Product or early Commodity, user awareness is forming, and no dominant player has yet locked in the market.

**Where it applies:** Genesis and early Custom stages, where timing decisions about product launch, market entry, and investment are made.

**Signals for being too early:**
- "The market isn't ready" feedback from potential customers
- Needing to explain the category, not just the product
- Enabling infrastructure that is unreliable, expensive, or requiring custom integration
- Very low conversion rates despite high interest

**Signals for being too late:**
- Established players with strong ecosystems
- Customers have already committed to a competitor
- The category has a clear "leader" in analyst reports
- Prices have already commoditized below your cost structure

**Strategic implication:** Use your map to assess timing. Check the evolution stage of your enabling components (must be at Product or Commodity). Check whether user needs are articulated (Pattern 18). Check whether an ecosystem has formed (Pattern 19). The intersection of mature enablers, emerging demand, and no dominant ecosystem is your window.

---

#### Pattern 30 -- The Map Is Not the Territory

**Definition:** Wardley Maps are models, not reality. They are useful approximations that must be updated frequently.

**Mechanism:** A map represents your current understanding of the landscape at a specific point in time. The landscape changes continuously as components evolve, competitors act, users shift, and new information becomes available. A map that was accurate three months ago may be significantly wrong today. The value of a map is not in its permanence but in the discipline of creating it, the conversations it enables, and the frequency with which you update it.

**Where it applies:** All maps, all stages, all contexts.

**Signals that your map needs updating:**
- Surprises: events you did not anticipate given the map's predictions
- New competitors or components that are not on the map
- Components that have moved stages since the map was last drawn
- Decisions being made that reference a map more than 3 months old
- Team disagreements about where components sit -- indicating the shared model has diverged

**Strategic implication:** Treat maps as living documents. Schedule regular map reviews (monthly for fast-moving domains, quarterly for stable ones). The act of updating the map is as valuable as the map itself, because it forces you to confront what has changed.

---

## 3. Climatic Pattern Scanning Protocol

This section defines how the `wardley-evolution` agent should systematically apply climatic patterns when analyzing a Wardley Map.

### Step 1: Component-Level Scan

For each component on the map, evaluate against all 30 climatic patterns.

| Question | Purpose |
|----------|---------|
| Is this component currently evolving? (Pattern 1, 3, 13) | Determine movement direction and speed |
| What evolution stage is it at, and how predictable is its behavior? (Pattern 2) | Set appropriate management expectations |
| What characteristics should it exhibit at this stage? (Pattern 4) | Detect mismatches between actual and expected properties |
| Are we using appropriate methods for this stage? (Pattern 5) | Identify methodology misalignment |
| How fast is this component evolving relative to others? (Pattern 6) | Spot speed mismatches and gaps |
| Is there organizational inertia around this component? (Pattern 7) | Identify resistance to necessary evolution |
| Are competitors copying this capability? (Pattern 8) | Assess remaining window of differentiation |

### Step 2: Ecosystem and Interaction Scan

For each component pair and for the map as a whole:

| Question | Purpose |
|----------|---------|
| Is this component enabling higher-order innovation? (Pattern 10, 25) | Identify where new value is being created |
| Is co-evolution occurring or needed? (Pattern 20) | Detect practice-activity mismatches |
| Is an ecosystem forming around this component? (Pattern 19, 23) | Assess platform dynamics and lock-in risk |
| Is openness accelerating this component's evolution? (Pattern 24) | Evaluate competitive dynamics |
| Are users' needs shifting for this component? (Pattern 14, 15, 17) | Detect demand-side evolution pressure |

### Step 3: Impact Assessment

For each pattern match identified in Steps 1 and 2, record:

```
Component: [name]
Pattern: [number] -- [name]
Manifestation: [how this pattern is currently expressing itself]
Impact: [High | Medium | Low]
Implication: [what this means for strategy]
Recommended Action: [specific response]
```

### Step 4: Pattern Cluster Analysis

Identify components where multiple patterns are active simultaneously. Pattern clusters indicate amplified effects.

**Amplification rules:**
- 3+ patterns affecting the same component = **critical attention required**
- Competing patterns on the same component = **strategic tension** requiring deliberate resolution
- Patterns reinforcing each other across components = **cascade risk** or **cascade opportunity**

---

## 4. Climatic Patterns and AI Products

AI products exhibit specific manifestations of climatic patterns that merit dedicated analysis due to the unprecedented speed and scale of AI evolution.

### Pattern 1 -- Everything Evolves (AI Manifestation)

Foundation models are commoditizing in 12-18 month cycles, dramatically faster than traditional software. GPT-3 was Genesis in 2020; by 2025, comparable capabilities are available as commodity APIs from multiple providers at a fraction of the original cost. Each new model generation goes from breakthrough to commodity faster than the last.

### Pattern 3 -- Components Will Evolve (AI Manifestation)

Today's custom fine-tuned model is tomorrow's API call. Organizations investing months in fine-tuning for a specific task are routinely overtaken by general-purpose models that handle the same task out of the box at the next capability tier. The half-life of a custom AI advantage is measured in quarters, not years.

### Pattern 10 -- Higher-Order Systems (AI Manifestation)

LLM commoditization is enabling application-layer innovation. As inference becomes cheap and reliable, the value creation layer shifts upward to: agent orchestration, domain-specific reasoning pipelines, human-AI workflow design, and multi-model architectures. The winning AI products are not the models themselves but the systems built on top of commodity model access.

### Pattern 24 -- Openness Accelerates (AI Manifestation)

Open-source models (Llama, Mistral, Qwen, DeepSeek) are dramatically accelerating the commoditization of model capabilities. Each open release compresses the window during which proprietary models maintain a capability advantage. The open-source ecosystem also accelerates tooling commoditization: training frameworks, inference engines, and evaluation benchmarks all evolve faster because of open contribution.

### Pattern 28 -- Change Happens Fast (AI Manifestation)

AI capability evolution is compressing from years to months. The gap between "state of the art" and "widely available commodity" that used to be 5-10 years in traditional software is now 6-18 months in AI. Planning horizons for AI products must be correspondingly shorter. Annual strategic plans for AI products are obsolete before they are approved.

### Pattern 8 -- Competitors Copy (AI Manifestation)

AI wrappers -- applications that add a thin layer of UX or domain-specific prompting on top of a foundation model API -- are cloned within weeks of demonstrating traction. Defensibility in AI requires deeper moats: proprietary data, unique workflow integration, compounding user data flywheel, or infrastructure advantages that cannot be replicated by another team calling the same API.

---

## 5. Pattern Interaction Matrix

Climatic patterns do not act in isolation. Understanding how they reinforce or conflict with each other is essential for accurate strategic reading.

### Reinforcing Interactions

These pattern pairs amplify each other when both are active.

| Pattern Pair | Interaction | Effect |
|-------------|-------------|--------|
| 1 + 13 (Everything evolves + Supply/demand competition) | Supply competition is the mechanism by which everything evolves. More competition = faster evolution. | Compounded acceleration of commoditization |
| 10 + 25 (Higher-order systems + Industrialization creates opportunity) | Commoditizing one layer enables innovation above it; industrialization at scale creates the conditions for entirely new industries. | Innovation cascades -- each wave enables the next |
| 7 + 26 (Inertia + War between old and new) | Organizational inertia fuels resistance to change; the structural war between incumbents and disruptors amplifies that resistance. | Organizational tension that must be actively managed to avoid strategic paralysis |
| 8 + 13 (Competitors copy + Supply/demand competition) | Copying increases the number of effective suppliers, which intensifies the supply-side competition that drives evolution. | Copying is not just annoying; it is an evolution accelerant |
| 12 + 10 (Efficiency enables innovation + Higher-order systems) | Resources freed by commoditization fund the Genesis activities that produce higher-order systems. | Self-funding innovation cycle |
| 19 + 23 (Ecosystems around commodities + Platform effects compound) | Ecosystem formation around a commodity creates platform dynamics; those platform dynamics compound and lock in the ecosystem. | Once established, extremely difficult to displace |
| 24 + 6 (Openness accelerates + Evolution speed not uniform) | Openness can dramatically accelerate the evolution of components that were previously on a slow track. | Strategic use of openness to change the speed equation |

### Conflicting Interactions

These pattern pairs create tension when both are active.

| Pattern Pair | Tension | Resolution |
|-------------|---------|------------|
| 16 + 28 (Users lag + Change happens fast) | Technology moves faster than adoption. The capability exists but users are not ready. | Plan for the adoption lag. Do not mistake capability availability for market readiness. Build bridges (better UX, education, migration tools) to close the gap. |
| 18 + 14 (Users can't envision + Needs change) | You must build for needs users do not know they have, but those needs will shift once they experience the capability. | Use vision-driven development for Genesis, then switch to user-feedback-driven development at Custom. Be prepared to pivot as users articulate what they actually need once they have the capability. |
| 7 + 3 (Inertia + Components will evolve) | Evolution is inevitable, but inertia resists it. The longer the resistance, the more disruptive the eventual transition. | Do not let inertia accumulate. Plan for managed transitions. Cannibalize your own products before competitors do. |
| 29 + 28 (Timing is critical + Change happens fast) | The window of optimal timing is shrinking because change accelerates. Being "on time" is harder when the pace keeps increasing. | Adopt faster decision-making cycles. Reduce the latency between signal detection and strategic response. Accept that "approximately right timing" is better than "perfectly right but late." |

### Cascade Scenarios

When three or more reinforcing patterns align, expect rapid, large-scale change.

**The Commoditization Cascade:** Patterns 1 + 13 + 24 + 8 + 6 -- Supply competition, openness, copying, and fast evolution speed all converge. A component that enters this cascade can go from Custom to Commodity in under two years. Current example: LLM inference.

**The Innovation Wave:** Patterns 10 + 25 + 11 + 12 -- A major industrialization event frees resources, creates higher-order opportunity, and attracts capital. An entire new industry forms in 3-5 years. Current example: AI agent orchestration platforms.

**The Inertia Trap:** Patterns 7 + 26 + 22 -- Incumbent inertia meets the war between old and new, and new entrants exploit the gap. Incumbents that do not break out of this trap face existential risk. Current example: traditional enterprise software vendors facing AI-native competitors.
