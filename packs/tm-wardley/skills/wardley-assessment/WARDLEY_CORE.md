<!-- License: CC-BY-SA-4.0 — Attribution: Simon Wardley, "Wardley Maps" book -->
<!-- Source: https://medium.com/wardleymaps — adapted for AI agent consumption -->

# Wardley Mapping -- Core Foundations

## 1. The Two Axes

A Wardley Map is a spatial representation of a business landscape plotted on two axes. Every component in the map has a position defined by both axes simultaneously.

### Y-Axis: Value Chain (Visibility)

The vertical axis represents **position in the value chain**, measured as visibility to the end user.

| Position | Description |
|----------|-------------|
| **Top (Visible)** | User-facing needs and capabilities. The user directly perceives, interacts with, or cares about these components. |
| **Middle** | Enabling capabilities. The user does not interact with them directly but would notice if they failed. |
| **Bottom (Invisible)** | Infrastructure and foundational components. The user has no awareness of them; they are deeply embedded dependencies. |

**Anchor rule:** The user sits at the very top. Their needs are the first components below them. Every subsequent component exists only because something above it depends on it. Arrows flow downward, representing "needs" relationships.

**Key principle:** Visibility does not equal importance. A database may be invisible to users but critical to every component above it. Position on the Y-axis describes *awareness*, not *value*.

### X-Axis: Evolution

The horizontal axis represents **how evolved a component is**, from novel and uncertain on the left to standardized and commodity on the right. There are four stages.

| Stage | Name | Characteristics |
|-------|------|----------------|
| **I** | **Genesis** | Novel, rare, poorly understood. High uncertainty and high failure rate. Requires experimentation and exploration. No best practices exist. Components here are unique -- often one-of-a-kind. |
| **II** | **Custom-Built** | Emerging understanding. Solutions are bespoke, built to specific needs. Few providers exist. Knowledge is becoming learnable but remains tacit. Certainty is increasing but still low. |
| **III** | **Product (+Rental)** | Standardizing. Feature differentiation drives competition. Multiple providers exist. Good practices emerge. Consumers can compare and choose. Market-driven improvement is active. |
| **IV** | **Commodity (+Utility)** | Fully standardized. Volume operations, essential but invisible to most users. Best practices are established. Operationally efficient, often consumed as a service. Differentiation is negligible. |

**Movement rule:** All components evolve from left to right over time, driven by supply-and-demand competition. This movement is generally one-directional. No component stays in Genesis permanently.

---

## 2. Component Characteristics by Evolution Stage

This table defines the measurable characteristics that distinguish each evolution stage. Use these to position components objectively, not by opinion.

| Characteristic | Genesis (I) | Custom-Built (II) | Product (+Rental) (III) | Commodity (+Utility) (IV) |
|---------------|-------------|-------------------|------------------------|--------------------------|
| **Ubiquity** | Rare. Few examples exist anywhere. | Rare but increasing. Seen in specific domains. | Common. Widespread adoption across industries. | Universal. Expected as baseline infrastructure. |
| **Certainty** | Very low. Unpredictable outcomes. | Low to moderate. Patterns emerging but unreliable. | Moderate to high. Predictable behavior and outcomes. | High. Defined, measurable, guaranteed SLAs. |
| **Publication Types** | Research papers, lab notebooks. | Case studies, whitepapers, early blogs. | Trade press, analyst reports, feature comparisons. | Operational manuals, API docs, utility pricing sheets. |
| **Market Perception** | "Interesting experiment." | "Promising approach." | "Leading product in category X." | "Just infrastructure. Everyone uses it." |
| **Knowledge Management** | Tacit, held by individuals. Tribal knowledge. | Emerging documentation. Still depends on key people. | Codified. Training programs exist. Transferable. | Formalized. Fully documented. Operational runbooks. |
| **Market Competition** | None or pre-market. Funding/grants. | Few players. Consulting-heavy. | Multiple vendors competing on features. | Volume-based competition on price and reliability. |
| **User Perception** | "What is this?" Requires explanation. | "We had it built for us." Bespoke feel. | "We chose this product." Active selection. | "It just works." Invisible, expected. |
| **Failure Handling** | Expected and tolerated. Learning from failure is the point. | Problematic but understood. Workarounds exist. | Undesirable. Vendor accountability expected. | Unacceptable. SLAs, redundancy, instant failover required. |

**Usage guidance for agents:** When positioning a component, evaluate it against each row in this table. The column where the majority of characteristics match is the correct evolution stage. Do not position by gut feeling or by a single characteristic.

---

## 3. Component Types

Every element on a Wardley Map is a component. Components fall into four types, each of which evolves independently.

| Type | Definition | Examples | Evolution Pattern |
|------|-----------|----------|-------------------|
| **Activities** | What we do. Actions and processes that produce value. | "Process payment," "Serve web page," "Train model" | From novel craft to automated utility |
| **Practices** | How we do it. Methods, methodologies, and organizational approaches. | "Agile development," "DevOps," "TDD," "Wardley Mapping itself" | From novel technique to industry standard |
| **Data** | What we measure and store. Information assets. | "Customer records," "Transaction logs," "Training datasets" | From unique proprietary data to open/commodity datasets |
| **Knowledge** | What we know. Expertise, understanding, and intellectual capital. | "Domain expertise in healthcare billing," "Understanding of LLM fine-tuning" | From rare specialist knowledge to widely available education |

**Why this matters:** A single business capability often involves all four types. "Machine learning" includes the activity (training a model), the practice (MLOps), the data (training sets), and the knowledge (ML engineering expertise). Each may sit at a different evolution stage.

---

## 4. Value Chain Construction

Step-by-step process for building a Wardley Map from scratch.

### Step 1: Identify the User (Anchor)

Choose a specific user whose perspective you are mapping. This is the anchor. Place them at the top of the map.

- **Be specific.** "Customer" is too broad. "Enterprise procurement manager evaluating SaaS tools" is an anchor.
- **One map, one anchor.** Different users produce different maps. That is correct -- maps are perspective-dependent.

### Step 2: Identify User Needs

List what the user needs. These become the first row of components directly below the user.

- Express needs as capabilities, not solutions. "Quick resolution to support queries" not "chatbot."
- Limit to 3-5 primary needs per map. More creates noise.

### Step 3: Identify Components for Each Need

For each need, ask: "What capabilities are required to fulfill this need?"

- Decompose recursively. Each capability may depend on sub-components.
- Stop decomposing when you reach components that are commodities or are outside your scope.

### Step 4: Draw Dependency Relationships

Connect components with arrows pointing downward. Arrow means "needs" -- the component above depends on the component below.

- Every component (except the user) must have at least one arrow pointing to it from above.
- Components with no arrows pointing down to them are leaf nodes (infrastructure, external services).

### Step 5: Position Each Component on Both Axes

For each component:

1. **Y-axis:** How visible is this to the user? Directly used = top. Infrastructure dependency = bottom.
2. **X-axis:** Use the Component Characteristics Table (Section 2) to determine evolution stage. Evaluate against multiple characteristics, not just one.

### Step 6: Validate the Map

- Does every component exist because something above it needs it?
- Are there hidden dependencies you missed?
- Does the evolution positioning match observable characteristics, not assumptions?

---

## 5. Movement and Evolution

### The Evolution Mechanism

Components evolve from Genesis to Commodity through competitive pressure. This is not a choice or a prediction -- it is a fundamental market dynamic.

| Driver | Mechanism |
|--------|-----------|
| **Supply competition** | As a component becomes understood, more providers enter. Competition drives standardization. |
| **Demand pull** | Users prefer reliable, cheap, standardized components. They push suppliers toward commodity. |
| **Efficiency pressure** | Organizations outsource evolved components to focus on differentiating (less evolved) components. |

### Evolution Speed

Not all components evolve at the same rate.

| Speed | Examples | Approximate Cycle |
|-------|----------|-------------------|
| **Fast** | AI/ML capabilities, cloud services, developer tools | Months to few years from Genesis to Product |
| **Medium** | Enterprise software categories, data practices | 5-15 years through the full cycle |
| **Slow** | Legal frameworks, industry regulations, organizational practices | Decades |

### Co-evolution

When a component evolves to a new stage, it enables the emergence of higher-order systems.

- Electricity commoditized (IV) --> enabled computing (I)
- Computing commoditized (IV) --> enabled cloud (I)
- Cloud commoditized (IV) --> enabled serverless, AI-as-a-service (I)
- LLM inference commoditizing (III-IV) --> enabling AI agents, autonomous workflows (I)

**Pattern:** Every commodity component becomes the foundation for the next generation of Genesis-stage innovation. This is the cycle of creative destruction on a map.

---

## 6. Inertia

Inertia is resistance to movement along the evolution axis. It is the single most common reason organizations make poor strategic decisions -- they hold components in earlier stages than market reality warrants.

### Three Types of Inertia

| Type | Description | Symptoms |
|------|-------------|----------|
| **Success Inertia** | "It's working, why change?" Past success creates attachment to current positioning. The organization confuses "was good" with "is still optimal." | Defending custom solutions when superior products exist. Celebrating metrics from a declining approach. |
| **Capital Inertia** | Sunk costs in existing systems, infrastructure, or processes. Switching cost is perceived as prohibitive. | "We've invested 3 years in this platform." Large teams maintaining custom components that could be replaced by services. |
| **Political Inertia** | Power structures, departments, and careers built around the current component positioning. Evolving the component threatens organizational territory. | "That's the infrastructure team's responsibility." Resistance to cloud migration from teams whose identity is on-premise operations. |

### Detecting Inertia

| Signal | What It Indicates |
|--------|-------------------|
| Resistance to outsourcing a component | The component has evolved past what the organization admits |
| "Not invented here" syndrome | Success or political inertia around custom solutions |
| Defending custom solutions when products exist | The component is in Product or Commodity stage but treated as Custom-Built |
| Large team maintaining a component competitors buy as a service | Capital and political inertia combined |
| "We're different" claims without evidence | Rationalization masking inertia |

### Strategic Response to Inertia

1. **Name it.** Make inertia visible on the map by marking components where positioning contradicts characteristics.
2. **Quantify the cost.** What is the organization spending to hold this component in an earlier stage?
3. **Show the competitor.** Who is leveraging the evolved version of this component? What advantage does that give them?

---

## 7. Anchors and Scope

### Anchors

Every Wardley Map requires a clear anchor -- the user whose perspective defines the map. Without an anchor, the map has no meaning because visibility (Y-axis) is relative to the observer.

| Principle | Explanation |
|-----------|-------------|
| **One anchor per map** | A map from the perspective of "end customer" will differ from one anchored on "internal developer." Both are valid. |
| **Anchor defines visibility** | What is visible (top) and invisible (bottom) depends entirely on who the anchor is. |
| **Multiple maps are expected** | Complex organizations need multiple maps -- one per user type, one per strategic question. |

### Scope

| Rule | Rationale |
|------|-----------|
| **Scope is defined by the strategic question** | "How do we reduce support costs?" produces a different map than "How do we enter market X?" |
| **Map what matters, not everything** | A map with 50+ components is unreadable and unactionable. Target 8-15 components. |
| **Stop decomposing at commodities** | If a component is clearly a commodity (e.g., electricity, DNS, basic compute), it does not need further decomposition. |
| **Include external components** | Competitor offerings, regulatory requirements, and market forces belong on the map if they affect positioning. |

---

## 8. Map Reading Protocol

A systematic approach for reading and interpreting any Wardley Map. Follow these six steps in order.

### Step 1: Anchor

- Who is the user?
- What do they need? Are the needs correctly identified?
- Is the scope appropriate for the strategic question?

### Step 2: Chain

- Trace dependencies from user needs downward to infrastructure.
- Are all dependency arrows present? Are there hidden dependencies?
- Does every component exist because something above it needs it?

### Step 3: Position

- For each component: how evolved is it?
- Cross-reference against the Component Characteristics Table (Section 2). Does the positioning match observable reality?
- Flag any components where positioning seems driven by opinion rather than evidence.

### Step 4: Movement

- Which components are actively evolving? Mark them with arrows pointing right.
- Which components are stuck (inertia)? Mark them.
- Are there components evolving faster than the organization assumes?

### Step 5: Gaps

- What is missing from the map? What dependencies are not shown?
- Are there components the organization does not control but depends on?
- Are emerging components (Genesis stage) that could disrupt the chain absent?

### Step 6: Decision

- What strategic question does this map answer?
- What actions does the map suggest? (Build, buy, outsource, invest, divest.)
- Where is the highest risk? Where is the greatest opportunity?

---

## 9. Worked Example: AI Customer Support Bot

This example demonstrates a complete Wardley Map construction for a business building an AI-powered customer support system.

### Anchor

**User:** Support Customer (a person contacting the company for help with a product or service issue).

### User Needs

1. **Quick Resolution** -- The customer wants their issue resolved fast, not just acknowledged.
2. **Accurate Answers** -- The customer wants correct information, not hallucinated or outdated responses.

### Component Map

| Component | Type | Y-Axis (Visibility) | X-Axis (Evolution) | Rationale |
|-----------|------|---------------------|--------------------:|-----------|
| **Chat Interface** | Activity | High (user interacts directly) | Product (III) | Multiple mature chat widget products exist. Not a differentiator. Standard feature set. |
| **AI Response Engine** | Activity | High (user perceives response quality) | Custom-Built (II) | The orchestration layer -- prompt chains, guardrails, fallback logic -- is still bespoke per deployment. Few off-the-shelf solutions match specific needs. |
| **Context Retrieval (RAG)** | Activity | Medium (user sees relevant answers, not the mechanism) | Custom-Built (II) | RAG pipelines are emerging but not yet standardized. Chunking strategies, embedding choices, and retrieval tuning remain hand-crafted. |
| **Knowledge Base** | Data | Medium (user benefits from its completeness) | Product (III) | Knowledge management systems are a mature product category. Content quality varies but tooling is standardized. |
| **LLM Inference** | Activity | Low (user sees output, not the model call) | Product-to-Commodity (III-IV) | Multiple providers (OpenAI, Anthropic, Google) offer API access. Rapidly commoditizing. Pricing is volume-based. |
| **Customer Data** | Data | Low (user unaware of data lookup) | Product (III) | CRM and customer data platforms are mature product categories. Integration is the challenge, not availability. |
| **Ticketing Integration** | Activity | Medium (user sees ticket created/updated) | Product (III) | Ticketing systems (Zendesk, Jira Service Management) are established products with well-documented APIs. |
| **Analytics Dashboard** | Activity | Low (invisible to support customer; visible to internal teams) | Product (III) | Business intelligence and analytics dashboards are a mature market. Customization needs push some implementations toward Custom-Built. |

### Value Chain Relationships

```
Support Customer
  |
  +-- Quick Resolution
  |     |
  |     +-- AI Response Engine
  |     |     |
  |     |     +-- Context Retrieval (RAG)
  |     |     |     |
  |     |     |     +-- Knowledge Base
  |     |     |     +-- Customer Data
  |     |     |
  |     |     +-- LLM Inference
  |     |
  |     +-- Ticketing Integration
  |
  +-- Accurate Answers
        |
        +-- AI Response Engine (shared)
        +-- Knowledge Base (shared)
        +-- Analytics Dashboard (feedback loop)
```

### Strategic Observations from This Map

1. **Differentiation lives in the AI Response Engine and Context Retrieval.** These are the only Custom-Built components. Investing here creates competitive advantage.
2. **LLM Inference is commoditizing rapidly.** Do not build proprietary inference infrastructure. Consume it as a utility. Switch providers based on cost and capability.
3. **Knowledge Base quality is the hidden bottleneck.** The component is Product-stage tooling, but the *content* quality is organization-specific. Poor knowledge base content degrades the entire chain regardless of AI sophistication.
4. **Chat Interface is not a differentiator.** Use an off-the-shelf product. Do not invest engineering effort here.

---

## 10. Common Mapping Mistakes

| Mistake | Why It Happens | How to Avoid |
|---------|---------------|--------------|
| **Mapping too much** | Desire for completeness. Fear of missing something. | Limit to 8-15 components. Ask: "Does this component affect the strategic decision?" If no, remove it. |
| **Confusing visibility with importance** | Intuition says "important = top of map." | Visibility means "does the user see/interact with it?" A database is critical but invisible to users. Position by awareness, not value. |
| **Positioning by opinion** | No systematic evaluation of characteristics. | Use the Component Characteristics Table (Section 2). Evaluate against multiple rows. Require evidence. |
| **Forgetting maps are perspective-dependent** | Treating one map as "the truth." | Different anchors produce different maps. A CTO's map differs from a customer's map. Both are valid. Label the anchor clearly. |
| **Treating the map as static** | Creating the map once and filing it away. | Maps represent a moment in time. Components evolve. Revisit the map quarterly or when strategic context changes. |
| **Mapping solutions instead of needs** | Starting from "we have Kubernetes" instead of "the user needs reliability." | Always start from the user and their needs. Technology is a component in the chain, not the starting point. |
| **Ignoring evolution of practices and knowledge** | Only mapping activities and data. | Practices ("how we build") and knowledge ("what we know") evolve too. An organization using Genesis-stage practices for Commodity-stage activities is misaligned. |
| **Placing components based on aspiration** | Positioning where you want a component to be, not where it is. | Map current state first. Desired future state is a separate map. Comparing the two reveals the strategy gap. |
