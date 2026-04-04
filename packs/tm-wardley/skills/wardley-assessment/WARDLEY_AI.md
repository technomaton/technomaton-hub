<!-- TECHNOMATON original synthesis. AI-specific Wardley mapping patterns for LLM/AI product analysis. -->
<!-- MIT licensed. Not derived from Wardley's CC-BY-SA-4.0 works — applies Wardley's framework to novel AI domain. -->
<!-- Cross-references: AI_PMF_MOATS.md (Five-Moat Taxonomy), WARDLEY_CORE.md (evolution stages), WARDLEY_OWM.md (map syntax) -->

# AI-Specific Wardley Mapping Patterns

This knowledge base provides Wardley Mapping frameworks purpose-built for analyzing AI products and businesses. It extends the core Wardley framework (see `WARDLEY_CORE.md`) with evolution patterns, defensibility analysis, and strategic templates specific to AI/LLM products as of April 2026.

**When to use this file:** Any time the product under analysis relies on large language models, machine learning inference, retrieval-augmented generation, AI agents, or similar capabilities. The patterns here replace generic evolution assumptions with AI-specific timelines and dynamics.

---

## 1. The AI Stack -- Canonical Wardley Map

Every AI product can be decomposed into six layers. Each layer sits at a distinct position on the evolution axis and moves at a different speed. Understanding this stack is the foundation of AI product strategy -- it tells you where to invest, where to buy, and where defensibility actually lives.

### The Six Layers

| Layer | Description | Evolution Stage | Direction |
|-------|-------------|----------------|-----------|
| **UX Layer** | Chat interfaces, copilots, embedded AI features, conversational surfaces | Product -> Commodity | Moving right rapidly. Chat UX is becoming a baseline expectation, not a differentiator. Copilot interfaces are standardizing across IDEs, browsers, and productivity tools. |
| **Application Layer** | Agents, orchestration logic, workflow automation, domain-specific business logic | Custom-Built -> Product | Moving right. Agent frameworks are proliferating but no dominant standard has emerged. Domain logic remains bespoke. |
| **Context Layer** | RAG pipelines, vector stores, knowledge graphs, context engineering, retrieval strategies | Custom-Built | Stabilizing. This is the current defensibility sweet spot. Retrieval strategy, context window management, and domain-specific knowledge structuring remain hand-crafted. |
| **Model Layer** | Foundation models (GPT, Claude, Gemini, Llama, Mistral, Qwen), fine-tuning, model training | Product -> Commodity | Moving right rapidly. Major model releases follow 12-18 month cycles. API parity across providers converges within 3-6 months of each breakthrough. |
| **Infrastructure Layer** | GPU compute, model serving infrastructure, hosting, inference endpoints | Commodity | Already commoditized. Multiple providers offer on-demand GPU compute and managed inference. Pricing is volume-based. No defensibility here. |
| **Data Layer** | Training data, evaluation datasets, user feedback loops, proprietary domain datasets | Genesis -> Custom-Built | Moving right slowly. Proprietary data is hard to replicate and compounds over time. This is the most enduring advantage in the AI stack. |

### Reading the Stack

The strategic insight is in the contrast between layers. The UX Layer and Model Layer are commoditizing fast -- building your moat there is like building a castle on a river. The Context Layer and Data Layer evolve slowly and compound with usage -- these are where defensible positions live.

**Key principle:** The layers that feel most impressive in demos (model capability, polished chat UI) are the layers with the least defensibility. The layers that feel like unglamorous plumbing (context pipelines, data collection) are where lasting advantage accumulates.

---

## 2. The Wrapper Trap

The wrapper trap is the single most common strategic failure in AI product development. Understanding it is prerequisite to any AI product Wardley analysis.

### Definition

A wrapper is a product that places a thin UX layer on top of commodity model inference with no meaningful components at the Context, Data, or Application layers. The product's entire value proposition is "we call the API and format the response nicely."

### Why It Fails

Map the wrapper's components:

| Component | Evolution Stage |
|-----------|----------------|
| UX (chat interface, prompt template) | Product -> Commodity |
| Model inference (API call) | Product -> Commodity |

There are no components in the Custom-Built or Genesis stages. Every component the wrapper relies on is moving toward commodity. This means:

1. **No switching costs.** Users can replicate the experience by going directly to the model provider or switching to any competitor.
2. **No compound advantage.** The product does not get better with usage. Each session is independent.
3. **Margin compression.** Revenue depends on inference cost arbitrage -- the spread between what users pay and what the API costs. As inference prices fall (and they consistently do), margins compress to zero.
4. **Platform risk.** The model provider can add the wrapper's feature to their own product at any time, instantly obsoleting the wrapper.

### Symptoms

Recognize a wrapper by these indicators:

- The product can be replicated in a weekend hackathon by a competent developer
- Differentiation is primarily prompt engineering -- the "secret sauce" is a system prompt
- The product breaks or degrades when the underlying model changes versions
- There is no proprietary data flowing back into the product
- User growth does not improve the product for other users
- The product's value proposition includes the phrase "powered by [model name]" as the primary selling point

### Historical Examples

The first wave of GPT wrappers (2023-2024) demonstrated the pattern clearly. Content generators, chatbot builders, and "GPT for X" products proliferated after the GPT-3.5 API launch. When ChatGPT added plugins, custom GPTs, and eventually native features that replicated most wrapper functionality, the majority of these products lost their user base within months. The same pattern repeated with each major model release.

### How to Escape the Wrapper Trap

The escape route is always the same: go deeper in the stack.

1. **Invest in the Context Layer.** Build proprietary retrieval strategies, domain-specific knowledge graphs, and context engineering that cannot be replicated by calling an API. The context pipeline is your moat.
2. **Invest in the Data Layer.** Create feedback loops where user interactions generate proprietary data that improves the product. Every session should make the next session better.
3. **Build Application Layer depth.** Domain-specific orchestration logic, multi-step agent workflows, and business rule engines add layers that are difficult to replicate.
4. **Create switching costs.** If users invest time configuring, training, or integrating your product, migration becomes expensive.

### The Wrapper Trap Test

Ask this question: **"If the model provider added my exact feature to their product tomorrow, would users still choose me?"**

- If the answer is **no** -- you are in the wrapper trap.
- If the answer is **yes, because of my data / context / workflow integration** -- you have escaped.
- If the answer is **yes, because of my brand** -- you have a temporary reprieve but not a structural moat.

---

## 3. The Context Layer as Defensibility Sweet Spot

The Context Layer occupies a unique position on the AI stack's evolution map: it is Custom-Built and stable. Unlike the Model Layer (commoditizing rapidly) or the UX Layer (already at Product-Commodity), the Context Layer evolves slowly enough to build defensible positions and fast enough to create real differentiation.

### Why Context, Not Models

The intuition that "better models = better product" is a trap. Model capability is a rising tide that lifts all boats. When GPT-4 launched, every product using GPT-3.5 could upgrade with a single API parameter change. Model improvement is available to everyone simultaneously -- it is not a differentiator.

Context quality, by contrast, is proprietary by construction:

- **Domain-specific retrieval strategies** require deep understanding of what information matters and when. A legal AI's retrieval pipeline looks nothing like a medical AI's, and neither can be replicated by generic RAG.
- **Knowledge graph construction** encodes organizational and domain knowledge in structured form. This is expensive to build, hard to replicate, and gets more valuable with every addition.
- **Context window management** -- deciding what information to include, exclude, and prioritize within a model's context window -- is an engineering problem with no universal solution. Each domain has its own signal-to-noise characteristics.

### Compound Advantage

The Context Layer creates a flywheel:

```
More usage
  -> More retrieval data and user feedback
    -> Better context pipeline tuning
      -> Higher output quality
        -> More usage
```

This flywheel does not exist for the UX Layer (switching chat interfaces has no cost) or the Model Layer (model improvements are instantly available to competitors). It exists only when the product accumulates proprietary context intelligence.

### Switching Costs

Migrating away from a well-built Context Layer is expensive:

- **Reindexing:** Moving a knowledge base to a different vector store or retrieval architecture means recomputing all embeddings, re-tuning retrieval parameters, and validating quality.
- **Lost tuning:** Months of retrieval optimization, query expansion rules, and re-ranking logic must be rebuilt from scratch.
- **Domain knowledge encoding:** The implicit knowledge embedded in chunking strategies, metadata schemas, and retrieval filters represents organizational understanding that cannot be exported.

### Context Layer Components

| Component | Description | Current Evolution |
|-----------|-------------|-------------------|
| Vector database | Storage and similarity search for embeddings | Product -- Pinecone, Weaviate, pgvector are mature |
| Embedding model | Converts text to vector representations | Product -- multiple providers, quality converging |
| Chunking strategy | How documents are split for indexing | Custom-Built -- highly domain-dependent |
| Retrieval strategy | Query expansion, re-ranking, filtering logic | Custom-Built -- the core of context defensibility |
| Knowledge graph | Structured relationships between domain entities | Custom-Built -- no standardized approach |
| Context window orchestration | Selecting and ordering information for the model | Custom-Built -- active area of innovation |
| Evaluation pipeline | Measuring retrieval quality and relevance | Genesis/Custom-Built -- no industry standard |

**Strategic takeaway:** The tools (vector databases, embedding models) are commoditizing. The strategy (how you use the tools) remains Custom-Built. Invest in strategy, buy the tools.

---

## 4. AI Evolution Speed Patterns

AI components evolve at radically different rates. Treating the entire AI domain as "fast-moving" leads to poor strategic decisions. Some components evolve in months; others will remain Custom-Built for years.

### Component Evolution Speeds (April 2026)

| Component | Current Stage | Evolution Speed | Key Dynamics |
|-----------|--------------|----------------|--------------|
| **Model capability** | Product -> Commodity | Very fast (12-18 month cycles) | GPT-3 to GPT-4 to GPT-4o to Claude 4 -- each generation commoditizes the previous. Open-source models (Llama, Mistral, Qwen) compress timelines further. |
| **Evaluation methodology** | Genesis -> Custom-Built | Slow | No standard evaluation frameworks exist for most business domains. Academic benchmarks poorly predict production performance. Every team builds custom evals. |
| **Agent frameworks** | Genesis | Very fast churn | Frameworks change monthly. LangChain, CrewAI, AutoGen, custom solutions -- no dominant standard. High experimentation, low stability. |
| **RAG / Retrieval** | Custom-Built -> Product | Medium | Vector databases are commoditizing (Pinecone, Weaviate, pgvector, Qdrant). Retrieval strategy remains Custom-Built. The tool is a product; the approach is still craft. |
| **Prompt engineering** | Custom-Built -> Product | Medium | Patterns are stabilizing (chain-of-thought, few-shot, structured output). Domain-specific prompt design remains valuable but the general practice is codifying. |
| **Fine-tuning** | Product | Medium | APIs available from all major providers. Process is standardized. Data selection and curation remain Custom-Built -- what you fine-tune on matters more than how. |
| **Data labeling** | Product | Medium | Platforms exist (Scale AI, Labelbox, Surge). Quality varies significantly. Domain expertise in labeling guidelines remains Custom-Built. |
| **AI observability** | Custom-Built -> Product | Medium-fast | Tools emerging (LangSmith, Braintrust, Weights & Biases). Generic monitoring is becoming productized. Domain-specific quality monitoring and drift detection remain Custom-Built. |
| **AI safety / alignment** | Genesis -> Custom-Built | Slow | Rapidly evolving research but no standardized production practices. Regulatory landscape still forming. |
| **Context engineering** | Custom-Built | Slow (stabilizing) | The discipline of designing what context reaches the model. Emerging as a recognized engineering practice. No commoditized solutions. |

### Strategic Implications

1. **Do not invest in fast-evolving commodity layers.** Building proprietary model training when open-source models match your needs in 6 months is capital destruction.
2. **Invest heavily in slow-evolving custom layers.** Evaluation methodology, context engineering, and domain data are slow to evolve because they require deep domain knowledge. That slowness is your friend -- it means competitors cannot catch up quickly.
3. **Treat Genesis-stage components with caution.** Agent frameworks and AI safety are in rapid churn. Tight coupling to any specific framework is high-risk. Use abstractions and expect to rebuild.

---

## 5. AI-Specific Climatic Patterns

These patterns extend the standard Wardley climatic patterns (see `WARDLEY_CLIMATE.md`) with dynamics unique to or amplified in AI markets.

---

### Pattern 1 -- Model Release Reset

**Definition:** Each new foundation model release resets the "impressive demo" bar. Products that differentiate on model capability alone face continuous erosion of their perceived advantage.

**Mechanism:** When a new model generation launches (e.g., GPT-4o, Claude 4, Gemini 2), capabilities that were cutting-edge become baseline. Any product whose value proposition was "we use the latest model" must now justify its existence against users accessing that same model directly. The reset happens every 12-18 months and is accelerating.

**Strategic implication:** Your product must provide value above and beyond raw model capability. After each model release, ask: "Does our product still matter?" If the answer depends on which model you use, you are in the wrapper trap.

---

### Pattern 2 -- Open-Source Compression

**Definition:** Open-source models (Llama, Mistral, Qwen, DeepSeek) compress the commoditization timeline from years to months.

**Mechanism:** In traditional software, commoditization took 5-15 years. In AI, open-source model releases close the capability gap with proprietary models within 3-6 months. A capability that was a $20/million-token API cost becomes free to self-host within one open-source model generation. This compresses the window during which any model-layer advantage is defensible.

**Strategic implication:** Model-layer moats have a half-life measured in months, not years. Plan accordingly. If your business model depends on exclusive access to model capability, it has an expiration date.

---

### Pattern 3 -- API Parity Convergence

**Definition:** Major model providers converge on similar capability sets within 3-6 months of any single provider's breakthrough.

**Mechanism:** When one provider launches a new capability (tool use, vision, structured output, reasoning), competitors ship equivalent features within one to two quarters. The competitive dynamics of the foundation model market ensure that no single provider maintains exclusive capability advantage for long. This makes model selection a commodity decision based on price, latency, and reliability rather than unique capability.

**Strategic implication:** Do not architect your product around a capability exclusive to one provider. Assume every major model will have it within two quarters. Build provider-agnostic abstractions.

---

### Pattern 4 -- Eval Gap

**Definition:** Evaluation methodology evolves far slower than model capability, creating a persistent blind spot in AI product development.

**Mechanism:** Models improve every 12-18 months. Evaluation frameworks for most business domains still do not exist. Academic benchmarks (MMLU, HumanEval) poorly predict production performance. The gap between "what the model can do" and "how well we can measure what the model does" widens with each generation. This means most AI products cannot rigorously prove they are better than alternatives.

**Strategic implication:** Investing in evaluation is investing in a Genesis-stage component with enormous future leverage. Organizations with strong eval can iterate faster, catch regressions, and make evidence-based model selection decisions. Eval is a moat.

---

### Pattern 5 -- Context Appreciation

**Definition:** As model capability becomes table stakes, the value shifts to context quality -- the ability to feed the right information to any model.

**Mechanism:** When all models produce similar quality output for a given prompt, the differentiating factor becomes which product provides the best context. The product that retrieves the most relevant documents, structures information most effectively, and manages the context window most intelligently produces the best output regardless of which underlying model it uses. Context quality appreciates in value as model capability commoditizes.

**Strategic implication:** This is the strategic rationale for Section 3. Context engineering is not a supporting activity -- it is becoming the primary competitive dimension for AI products.

---

### Pattern 6 -- Agent Instability

**Definition:** Agent architectures are in rapid Genesis-stage churn. Investing heavily in a specific agent framework is high-risk.

**Mechanism:** The agent ecosystem (multi-step reasoning, tool use, planning, memory) is in active Genesis. Dominant patterns have not emerged. Frameworks rise and fall monthly. Production-grade agent reliability remains unsolved for most use cases. Organizations that tightly couple to a specific agent framework face rebuilding costs when the ecosystem shifts.

**Strategic implication:** Use agent capabilities but maintain abstraction layers. Expect to replace your agent orchestration approach at least once in the next 12 months. Do not treat your agent framework choice as a long-term architectural decision.

---

## 6. AI Product Wardley Map Template

This OWM template provides a starting point for mapping any AI product. Paste it into [OnlineWardleyMaps.com](https://onlinewardleymaps.com) and customize.

### Base Template

```owm
title [Product Name] — AI Stack Wardley Map
style wardley

anchor User [0.95, 0.58]

// UX Layer
component [User-Facing Feature] [0.82, 0.65]

// Application Layer
component [Domain Logic / Orchestration] [0.70, 0.35]
component [Agent / Workflow] [0.65, 0.25]

// Context Layer
component [Context Pipeline] [0.55, 0.32]
component [Knowledge Base / RAG] [0.48, 0.38]
component [Vector Store] [0.42, 0.62]

// Model Layer
component LLM Inference [0.35, 0.78]

// Infrastructure Layer
component Cloud Compute [0.20, 0.88]
component Storage [0.15, 0.90]

// Data Layer
component [Proprietary Data] [0.28, 0.22]
component [User Feedback Loop] [0.30, 0.18]

// Links
User->[User-Facing Feature]
[User-Facing Feature]->[Domain Logic / Orchestration]
[Domain Logic / Orchestration]->[Agent / Workflow]
[Domain Logic / Orchestration]->[Context Pipeline]
[Context Pipeline]->[Knowledge Base / RAG]
[Knowledge Base / RAG]->[Vector Store]
[Domain Logic / Orchestration]->LLM Inference
LLM Inference->Cloud Compute
[Vector Store]->Storage
[Context Pipeline]->[Proprietary Data]
[User-Facing Feature]->[User Feedback Loop]

// Evolution arrows
evolve [Vector Store] 0.72
evolve LLM Inference 0.85
```

### How to Customize

**Step 1: Replace bracketed names.** Every `[Bracketed Component]` is a placeholder. Replace with your product's actual components. For example, `[User-Facing Feature]` becomes `Chat Interface` or `Code Review Copilot` or `Document Analyzer`.

**Step 2: Adjust positions.** The coordinates `[y, x]` represent `[visibility, evolution]`. Move components left or right based on your assessment of their evolution stage using the Component Characteristics Table in `WARDLEY_CORE.md`. Move components up or down based on their visibility to the user.

**Step 3: Add domain-specific components.** The template covers the generic AI stack. Your product likely has domain-specific components. Add them at the appropriate layer:

```owm
// Domain-specific additions
component [Compliance Engine] [0.60, 0.30]
component [Medical Terminology DB] [0.45, 0.25]
component [Regulatory Dataset] [0.32, 0.20]
```

**Step 4: Add evolution arrows.** Use `evolve [Component] [target_x]` to show where a component is heading. This visualizes movement along the evolution axis.

**Step 5: Mark inertia.** If a component should be further right (more evolved) but organizational or technical inertia holds it back, add a note:

```owm
note [Legacy RAG Pipeline] [0.56, 0.28] inertia — should be at Product but custom implementation resists migration
```

**Step 6: Validate.** Apply the Map Reading Protocol from `WARDLEY_CORE.md` Section 8. Does every component exist because something above it needs it? Does the evolution positioning match observable characteristics?

---

## 7. Moat Evolution Matrix for AI Products

This matrix bridges Wardley evolution analysis with the Five-Moat Taxonomy defined in the PMF framework (see `AI_PMF_MOATS.md`). Use it to assess which moats are structurally viable for an AI product based on where its components sit on the evolution axis.

### The Matrix

| Moat Type (PMF) | Primary Wardley Layer | Typical Evolution | Defensibility Window | Compound Dynamics |
|-----------------|----------------------|-------------------|---------------------|-------------------|
| **Data Moat** | Data Layer | Genesis -> Custom-Built (slow) | 18-36 months -- enduring | Each user interaction generates proprietary data. More data improves model/retrieval quality. Advantage accelerates over time. |
| **Behavioral Moat** | Application + Context Layers | Custom-Built (stable) | 12-24 months -- compound | Users develop habits around AI-augmented workflows. Personalization deepens with usage. Switching means losing learned preferences. |
| **Workflow Moat** | Application Layer | Custom-Built -> Product | 12-18 months -- eroding | Deep integration into business processes creates switching costs. Erodes as orchestration tools standardize. |
| **Distribution Moat** | UX + Platform | Product -> Commodity | 6-12 months -- fast eroding | Channel access and embedded positioning. Erodes quickly as AI features become expected across all platforms. |
| **Trust Moat** | Cross-layer (builds over time) | Custom-Built (very slow) | 24-48 months -- most enduring | Reputation, track record, compliance certifications, and domain authority. Cannot be bought or shortcut. Slowest to build, hardest to replicate. |

### Reading the Matrix

**Defensibility window** is how long the moat provides meaningful competitive advantage before market dynamics erode it.

- **Enduring moats (Data, Trust)** operate at slowly-evolving layers. They compound with time and resist commoditization because they depend on accumulated assets (data, reputation) that cannot be replicated through engineering alone.
- **Compound moats (Behavioral)** sit at stable Custom-Built layers. They reinforce themselves through usage but can erode if competitors offer sufficiently superior alternatives.
- **Eroding moats (Workflow, Distribution)** operate at layers moving toward Product/Commodity. They provide real advantage today but must be continuously reinforced as the underlying layer evolves.

**Strategic recommendation:** Build your primary moat at the Data or Trust layer. Use Behavioral and Workflow moats as accelerants. Treat Distribution moats as temporary -- useful for growth but not for long-term defensibility.

---

## 8. Build vs. Buy Decision Matrix for AI Components

When constructing an AI product, every component demands a build-or-buy decision. The correct decision depends on the component's evolution stage and its strategic role in your product.

### The Matrix

| AI Component | Evolution Stage | Build if... | Buy if... |
|-------------|----------------|-------------|-----------|
| **Foundation model** | Commodity | You have unique data AND substantial compute budget AND differentiation requires model-level control (rare) | Almost always. Use APIs. The economics of training foundation models favor scale that most organizations cannot match. |
| **Fine-tuning** | Product | You have proprietary domain data that meaningfully improves output quality for your use case | You need generic capability improvement or your data volume is insufficient to justify the cost |
| **RAG pipeline** | Custom -> Product | Context retrieval strategy is a core part of your product's moat. The how-you-retrieve is your differentiation. | Retrieval is a utility for your product -- you need it to work but it is not where you compete |
| **Vector database** | Product | You need extreme customization, unusual scale characteristics, or have specific latency requirements that managed services cannot meet | Almost always. Use a managed service (Pinecone, Weaviate, pgvector). This is mature tooling. |
| **Evaluation suite** | Genesis | Always build. Domain-specific evaluation is where product quality lives. No vendor can evaluate your product's outputs as well as you can. | No good off-the-shelf alternatives exist for most domains. Generic eval tools provide scaffolding but not domain-specific quality measurement. |
| **Agent framework** | Genesis | You need deep control over agent behavior, or your use case requires reliability guarantees that no framework currently provides | Be prepared to rebuild. Lock-in risk is high. Use the framework as an accelerant but abstract your interface. |
| **Observability** | Custom -> Product | You need model-specific monitoring, domain-specific quality metrics, or custom drift detection | Standard performance metrics (latency, throughput, error rate) are sufficient for your needs |
| **Data pipeline** | Commodity | Never. Data pipeline tooling is fully commoditized. Building custom ETL is a misallocation of engineering effort. | Always. Use managed ETL services. This is mature infrastructure. |
| **Embedding model** | Product | You have domain-specific embedding requirements that general-purpose models handle poorly (e.g., highly specialized technical vocabulary) | Almost always. General-purpose embedding models perform well across most domains. |
| **Context engineering** | Custom-Built | Always build. This is the defensibility sweet spot (see Section 3). How you structure, select, and manage context is your product's competitive advantage. | No viable buy option exists. Context engineering is inherently custom to your domain and product. |

### Decision Framework

For any component not in the matrix, apply this heuristic:

1. **Determine evolution stage** using the Component Characteristics Table in `WARDLEY_CORE.md`.
2. **If Commodity or late Product:** Buy. Building commodity components is capital destruction.
3. **If Genesis or early Custom-Built:** Build if it is strategic to your product. Buy (cautiously) if it is a supporting capability.
4. **If mid Custom-Built:** This is the decision zone. Build if the component is part of your moat. Buy if it is infrastructure for your moat.

**The governing principle:** Build what differentiates. Buy what supports. Never build what has already commoditized.