<!-- License: MIT -->
<!-- Reference: OnlineWardleyMaps.com (MIT license) — https://github.com/damonsk/onlinewardleymaps -->

# OWM Syntax Reference for LLM Map Generation

## 1. OWM Format Overview

OWM (Online Wardley Maps) is a text-based domain-specific language for describing Wardley Maps. It was created by the OnlineWardleyMaps.com project and is released under the MIT license.

**Why OWM for LLM generation:** LLMs cannot reliably produce pixel-accurate images, but they excel at generating structured text. OWM provides a precise, deterministic text format that renders into visual Wardley Maps. An LLM generates the OWM text; the renderer produces the image.

**Rendering:** Paste OWM text into https://onlinewardleymaps.com for instant visual rendering. The text is encoded into the URL hash, making maps shareable as links.

**Key characteristics:**

- One directive per line (no multi-line statements)
- Coordinates are always `[y, x]` where y = visibility (vertical) and x = evolution (horizontal)
- Both axes range from 0.0 to 1.0
- Whitespace and blank lines are ignored between directives
- Lines starting with `//` are comments

---

## 2. Complete OWM Syntax Reference

### 2.1 Map Metadata

```owm
title Map Title Here
style wardley
y-axis Value Chain -> Visibility
```

| Directive | Required | Description |
|-----------|----------|-------------|
| `title [text]` | Yes | Map title displayed at the top. Plain text, no quotes needed. |
| `style wardley` | Yes | Selects the standard Wardley Map visual style. Always include this. Without it the renderer uses a generic graph layout. |
| `y-axis Label1 -> Label2` | No | Custom y-axis labels. Default is already correct for Wardley Maps. Rarely needed. |

### 2.2 Components

Components are the core building blocks. Each component has a name, visibility position (y-axis), and evolution position (x-axis).

**Syntax:**

```
component Name [visibility, evolution]
component Name [visibility, evolution] label [-offsetX, offsetY]
```

**Parameters:**

- `Name` — plain text, can include spaces. Must be unique within the map.
- `visibility` — float 0.0 to 1.0. Higher values = closer to user (top of map).
- `evolution` — float 0.0 to 1.0. Higher values = more evolved/commoditized (right side).
- `label [-offsetX, offsetY]` — optional pixel offset for the label to avoid overlaps. Negative X moves left; positive Y moves down.

**Examples:**

```owm
component Customer Support [0.82, 0.55]
component LLM Inference [0.35, 0.62] label [-15, 5]
component Cloud Compute [0.12, 0.88]
```

### 2.3 Anchors

Anchors represent the primary user or entry point of the value chain. They render with a distinct visual marker (typically a filled circle or user icon).

**Syntax:**

```
anchor Name [visibility, evolution]
```

**Usage:** Place exactly one anchor per map at the top of the value chain. The anchor is typically the user, customer, or primary stakeholder.

**Example:**

```owm
anchor Customer [0.95, 0.50]
```

### 2.4 Links (Dependencies)

Links express dependency relationships. `A->B` means "A depends on B" or "A needs B to function." The arrow renders as a line connecting the two components.

**Syntax:**

```
Name1->Name2
```

**Rules:**

- Both names must match existing `component` or `anchor` declarations exactly (case-sensitive).
- Each link is one line. For chains, use separate lines.
- No spaces around `->`.

**Examples:**

```owm
Customer->Quick Resolution
Quick Resolution->Chat Interface
Chat Interface->AI Response Engine
AI Response Engine->LLM Inference
```

### 2.5 Evolution Movement

The `evolve` directive adds an arrow showing a component's expected movement along the evolution axis. The component renders at its original position, with an arrow pointing to the target evolution value.

**Syntax:**

```
evolve Name evolution_target
evolve Name evolution_target label [-offsetX, offsetY]
```

**Parameters:**

- `Name` — must match an existing component name exactly.
- `evolution_target` — float, must be greater than the component's current evolution value (movement is always rightward).
- `label` — optional pixel offset for the evolved position label.

**Example:**

```owm
component AI Response Engine [0.55, 0.38]
evolve AI Response Engine 0.58 label [10, -5]
```

This renders an arrow from evolution 0.38 to 0.58, indicating the component is moving from Custom-Built toward Product stage.

### 2.6 Pipelines

Pipelines represent a component that contains multiple sub-components spanning a range of evolution. Visually, the pipeline renders as a horizontal box within which sub-components sit.

**Syntax:**

```
pipeline Name [start_evolution, end_evolution]
```

**Parameters:**

- `Name` — must match an existing component name.
- `start_evolution` — left edge of the pipeline box (lower evolution bound).
- `end_evolution` — right edge of the pipeline box (higher evolution bound).

Any components whose evolution falls within the pipeline range and whose visibility is at or near the pipeline component's visibility are visually grouped inside the box.

**Example:**

```owm
component Data Storage [0.25, 0.65]
pipeline Data Storage [0.30, 0.90]
component Object Storage [0.24, 0.85]
component Graph Database [0.24, 0.35]
component Vector Database [0.24, 0.45]
```

Here, `Data Storage` is a pipeline spanning evolution 0.30 to 0.90. The three sub-components sit inside the pipeline box at their respective evolution positions.

### 2.7 Notes

Notes add free-text annotations at specific map coordinates.

**Syntax:**

```
note Text here [visibility, evolution]
```

**Example:**

```owm
note Opportunity: custom RAG pipeline differentiates [0.42, 0.28]
```

### 2.8 Annotations (Numbered)

For structured annotations with a legend, use the `annotations` block. This places numbered markers on the map with corresponding descriptions in a side panel.

**Syntax:**

```
annotations [visibility, evolution]
annotation 1 [x_offset, y_offset] Description text
annotation 2 [x_offset, y_offset] Description text
annotations

// Alternative placement per-component:
component Name [visibility, evolution] (annotation_number)
```

**Example:**

```owm
annotations [0.90, 0.05]
annotation 1 [0.02, 0.04] Build custom — competitive advantage here
annotation 2 [0.44, 0.70] Buy — commodity, do not invest engineering time
annotations
```

### 2.9 Strategic Decision Labels

These directives mark a component with a build/buy/outsource decision.

**Syntax:**

```
build Name
buy Name
outsource Name
```

**Example:**

```owm
build Context Pipeline
buy Cloud Compute
outsource Data Labeling
```

These render as small labels or markers on the named component.

### 2.10 Market Components

Marks a component as available in an external market or ecosystem.

**Syntax:**

```
market Name [visibility, evolution]
```

**Example:**

```owm
market LLM API [0.35, 0.62]
```

### 2.11 Comments

```owm
// This is a comment — ignored by the renderer
```

---

## 3. Evolution Axis Positioning Guide

The horizontal axis represents component evolution from novel (left) to commodity (right).

| Stage | Range | Typical Values | Characteristics | Examples |
|-------|-------|----------------|-----------------|----------|
| **Genesis** | 0.05-0.20 | 0.10-0.15 | Novel, poorly understood, high uncertainty, few providers, no standards | Novel AI capability, new interaction paradigm, experimental algorithm, first-of-kind integration |
| **Custom-Built** | 0.25-0.45 | 0.30-0.40 | Understood but bespoke, requires significant engineering, emerging practices | Proprietary data pipeline, custom fine-tuned model, in-house RAG system, company-specific workflow engine |
| **Product (+Rental)** | 0.50-0.70 | 0.55-0.65 | Available as products or services, multiple providers, feature differentiation, established practices | SaaS tools, commercial APIs, managed LLM services, CI/CD platforms, CRM systems |
| **Commodity (+Utility)** | 0.75-0.95 | 0.80-0.90 | Standardized, interchangeable providers, utility pricing, well-defined interfaces | Cloud compute, object storage, email delivery, payment processing, DNS, CDN |

**Diagnostic questions for positioning:**

1. **How many providers exist?** 0-1 = Genesis (0.10), 2-5 = Custom (0.30), 5-20 = Product (0.55), 20+ = Commodity (0.85)
2. **Is there a published standard or specification?** No = Genesis/Custom, Emerging = Product, Yes (RFC/ISO) = Commodity
3. **Could you buy this off the shelf today?** No = Genesis/Custom, Yes with configuration = Product, Yes as utility = Commodity
4. **How well-understood is the approach?** Experimental = Genesis, Proven-but-bespoke = Custom, Best practice = Product, Invisible/assumed = Commodity

---

## 4. Visibility Axis Positioning Guide

The vertical axis represents how visible a component is in the value chain, from user-facing (top) to deep infrastructure (bottom).

| Layer | Range | Description | Examples |
|-------|-------|-------------|----------|
| **User / Anchor** | 0.90-0.97 | The user themselves or their direct touchpoint | Customer, End User, Developer |
| **User needs** | 0.78-0.89 | What the user directly interacts with or requests | Quick Resolution, Code Suggestion, Search Results |
| **Visible capabilities** | 0.60-0.77 | Features the user perceives but does not directly control | Chat Interface, Dashboard, Notification System |
| **Supporting activities** | 0.40-0.59 | Internal processes that enable visible capabilities | AI Response Engine, Context Pipeline, Auth Service |
| **Data and services** | 0.20-0.39 | Technical components one or more layers removed from user awareness | Knowledge Base, Vector Index, Model Registry, Customer DB |
| **Infrastructure** | 0.05-0.19 | Commodity infrastructure and utilities | Cloud Compute, Object Storage, Network, DNS |

**Positioning heuristic:** Count dependency hops from the anchor. Each hop drops visibility by roughly 0.12-0.18 units. Anchor at 0.95 -> needs at 0.80 -> capabilities at 0.65 -> supporting at 0.50 -> data at 0.35 -> infrastructure at 0.12.

---

## 5. LLM Map Generation Protocol

Follow these steps to produce a valid, insightful OWM map from a domain description.

### Step 1 -- Identify the Anchor

- Determine the primary user, customer, or stakeholder. This is the anchor.
- Place the anchor at visibility 0.95, evolution 0.50 (centered horizontally; the user is not themselves "evolved" -- they just exist).
- Identify their top 2-3 needs. These become the first layer of components at visibility 0.78-0.89.

### Step 2 -- Build the Value Chain

For each user need, ask recursively:

1. "What capability is required to fulfill this need?"
2. "What does that capability depend on?"
3. "And what does that depend on?"

Continue until you reach commodity infrastructure. Each answer becomes a component. Aim for **8-15 components total** -- this is the sweet spot for a readable, useful map. Below 8, the map lacks insight. Above 20, it becomes cluttered.

### Step 3 -- Position on the Evolution Axis

For each component, answer the four diagnostic questions from Section 3 above. Use the answers to select a position within the appropriate stage range. Be specific -- do not cluster components at the same evolution value. Spread them across distinct positions.

**Common pitfall:** Defaulting everything to 0.50. Force yourself to commit: is this component closer to Genesis or Commodity? Use the diagnostic questions, not intuition.

### Step 4 -- Position on the Visibility Axis

Apply the hop-counting heuristic from Section 4. Also consider:

- Does the user know this component exists? Yes = higher visibility.
- Does the user interact with this component directly? Yes = 0.70+.
- Is this purely behind the scenes? = 0.20-0.45.

**Spacing rule:** No two components at the same visibility value. Separate by at least 0.04 for readability.

### Step 5 -- Draw Links

Connect every component to its dependencies using `->` syntax. Verify:

- Every component (except the anchor) has at least one incoming link (something depends on it) OR one outgoing link (it depends on something).
- No orphan components. An orphan is a bug.
- The anchor connects downward to user needs.

### Step 6 -- Add Evolution Movement

Identify 1-3 components that are actively evolving (moving rightward). These are the strategic signals in the map. Add `evolve` directives for each.

Typical evolution movements:

- Custom-built component being replaced by a product: evolve from ~0.35 to ~0.55
- Product becoming commodity: evolve from ~0.60 to ~0.80
- Genesis innovation maturing: evolve from ~0.12 to ~0.30

### Step 7 -- Add Strategic Annotations

Where the strategic decision is clear, add `build`, `buy`, or `outsource` labels:

- **Build** components in Genesis/Custom that provide competitive advantage.
- **Buy** components in Product stage that are not differentiating.
- **Outsource** components in Commodity stage.

Add 1-2 `note` directives for the most important strategic insight on the map.

### Step 8 -- Validate

Before outputting, check every item in this list:

- [ ] `title` and `style wardley` are present
- [ ] Exactly one `anchor` exists
- [ ] All coordinates are within 0.0-1.0
- [ ] No two components share the same name
- [ ] No two components occupy the same `[visibility, evolution]` coordinate
- [ ] Every component connects to the value chain (no orphans)
- [ ] Links reference exact component names (case-sensitive match)
- [ ] `evolve` targets are greater than the component's current evolution value
- [ ] Component count is between 8 and 20
- [ ] A Wardley Mapping practitioner would not dispute the evolution positioning of any component by more than one stage

---

## 6. Worked Examples

### Example 1: AI Code Assistant (Simple -- 8 components)

A developer-facing AI code assistant integrated into an IDE.

```owm
title AI Code Assistant
style wardley

anchor Developer [0.95, 0.50]
component Code Editing [0.82, 0.72]
component AI Suggestions [0.82, 0.42]
component Context Pipeline [0.58, 0.32]
component LLM Inference [0.45, 0.62]
component Codebase Index [0.35, 0.38]
component IDE Platform [0.68, 0.78]
component Git [0.22, 0.88]

Developer->Code Editing
Developer->AI Suggestions
Code Editing->IDE Platform
AI Suggestions->Context Pipeline
AI Suggestions->LLM Inference
Context Pipeline->Codebase Index
Codebase Index->Git
IDE Platform->Git

evolve AI Suggestions 0.58 label [10, -5]
evolve Context Pipeline 0.48

build Context Pipeline
buy LLM Inference
```

**Positioning rationale:**

- **AI Suggestions (0.42):** Custom-Built stage. Multiple products exist (Copilot, Cursor) but deep customization is still required for enterprise contexts. Evolving toward Product.
- **Context Pipeline (0.32):** Custom-Built. RAG-based context retrieval for code is bespoke and rapidly maturing. This is where competitive differentiation lives.
- **LLM Inference (0.62):** Product stage. Available as API services from multiple providers (OpenAI, Anthropic, Google). Buy, do not build.
- **IDE Platform (0.78):** Commodity. VS Code, JetBrains -- standardized platforms.
- **Git (0.88):** Commodity utility. Universal, interchangeable providers.

### Example 2: AI Customer Support (Medium -- 12 components)

An AI-powered customer support system handling first-line resolution.

```owm
title AI Customer Support Platform
style wardley

anchor Customer [0.95, 0.50]
component Quick Resolution [0.84, 0.55]
component Issue Escalation [0.84, 0.72]
component Chat Interface [0.72, 0.68]
component AI Response Engine [0.58, 0.38]
component Context Retrieval [0.46, 0.35]
component Knowledge Base [0.34, 0.52]
component LLM Inference [0.42, 0.62]
component Customer Data [0.30, 0.58]
component Ticketing System [0.62, 0.74]
component Analytics [0.50, 0.55]
component Compute [0.12, 0.88]

Customer->Quick Resolution
Customer->Issue Escalation
Quick Resolution->Chat Interface
Quick Resolution->AI Response Engine
Issue Escalation->Ticketing System
Chat Interface->AI Response Engine
AI Response Engine->Context Retrieval
AI Response Engine->LLM Inference
Context Retrieval->Knowledge Base
Context Retrieval->Customer Data
Ticketing System->Customer Data
Analytics->AI Response Engine
Analytics->Ticketing System
LLM Inference->Compute
Knowledge Base->Compute

evolve AI Response Engine 0.55 label [10, -5]
evolve Context Retrieval 0.50

build AI Response Engine
build Context Retrieval
buy LLM Inference
buy Ticketing System

note Strategic moat: proprietary context retrieval over company knowledge [0.42, 0.15]
```

**Positioning rationale:**

- **AI Response Engine (0.38):** Custom-Built. The core differentiator. Combines retrieval, prompt engineering, and domain logic in a way that is not yet standardized. Evolving toward Product as patterns solidify.
- **Context Retrieval (0.35):** Custom-Built. RAG pipelines for domain-specific knowledge are bespoke. Strong investment target.
- **Knowledge Base (0.52):** Product stage. Knowledge management tools exist (Confluence, Notion) but require configuration.
- **Chat Interface (0.68):** Product. Intercom, Zendesk, and others provide this as a service.
- **Ticketing System (0.74):** Late Product / early Commodity. Jira, Zendesk -- buy, do not build.
- **Compute (0.88):** Commodity utility.

### Example 3: AI-Powered Marketplace (Complex -- 15 components with pipeline)

A two-sided marketplace using AI for matching, pricing, and trust.

```owm
title AI-Powered Services Marketplace
style wardley

anchor Buyer [0.95, 0.50]
component Service Discovery [0.83, 0.55]
component Trust and Safety [0.83, 0.42]
component Booking Flow [0.72, 0.70]
component AI Matching Engine [0.60, 0.30]
component Dynamic Pricing [0.58, 0.28]
component Review System [0.68, 0.65]
component Provider Profiles [0.65, 0.58]
component Fraud Detection [0.52, 0.45]
component Search Index [0.44, 0.62]
component ML Models [0.38, 0.35]
pipeline ML Models [0.18, 0.55]
component Ranking Model [0.37, 0.48]
component Pricing Model [0.37, 0.25]
component Fraud Model [0.37, 0.40]
component User Data [0.28, 0.58]
component Transaction Data [0.26, 0.62]
component Payment Processing [0.55, 0.85]
component Compute [0.10, 0.90]
component Object Storage [0.08, 0.88]

Buyer->Service Discovery
Buyer->Trust and Safety
Service Discovery->Booking Flow
Service Discovery->AI Matching Engine
Trust and Safety->Fraud Detection
Trust and Safety->Review System
Booking Flow->Payment Processing
Booking Flow->Provider Profiles
AI Matching Engine->Search Index
AI Matching Engine->ML Models
Dynamic Pricing->ML Models
Dynamic Pricing->Transaction Data
Fraud Detection->ML Models
Fraud Detection->User Data
Review System->User Data
Provider Profiles->User Data
Search Index->User Data
ML Models->Compute
User Data->Object Storage
Transaction Data->Object Storage

evolve AI Matching Engine 0.48 label [10, -5]
evolve Dynamic Pricing 0.42

build AI Matching Engine
build Dynamic Pricing
buy Payment Processing
outsource Compute

note Key differentiator: proprietary matching + pricing models trained on marketplace data [0.18, 0.08]
note Fraud detection increasingly table-stakes -- evolving to product [0.52, 0.56]
```

**Positioning rationale:**

- **AI Matching Engine (0.30):** Custom-Built, bordering Genesis. Marketplace-specific matching combining availability, quality signals, geography, and buyer preferences. This is the core moat. Evolving as best practices emerge.
- **Dynamic Pricing (0.28):** Custom-Built / Genesis. Algorithmic pricing specific to this marketplace's supply-demand dynamics. Highly proprietary.
- **ML Models pipeline (0.18-0.55):** The pipeline groups three models at different evolution stages: Pricing Model (0.25, most novel) through Ranking Model (0.48, more established patterns).
- **Payment Processing (0.85):** Commodity. Stripe, Adyen -- interchangeable utility.
- **Fraud Detection (0.45):** Late Custom-Built. Many tools exist but marketplace-specific fraud patterns still require custom work.
- **Search Index (0.62):** Product. Elasticsearch, Algolia -- available as services.

---

## 7. Rendering and Sharing

**Instant rendering:** Paste the OWM text block into https://onlinewardleymaps.com. The map renders immediately in the browser. No account required.

**URL sharing:** The OWM text is encoded into the URL fragment (after `#`). Copy the browser URL to share the map with anyone. The recipient sees the rendered map without needing the raw text.

**Export formats:**

- **SVG** -- vector format, ideal for documents and presentations. Scales without quality loss.
- **PNG** -- raster format, suitable for chat messages and quick sharing.

**Version control:** Store OWM text as `.owm` files or within Markdown code blocks in your repository. Standard `git diff` shows exactly what changed between map versions -- which components moved, which links were added. This is a major advantage over image-based map tools.

**Embedding in documentation:** Wrap OWM blocks in triple-backtick fences with `owm` language hint for syntax highlighting in editors that support it:

````
```owm
title My Map
style wardley
...
```
````

---

## 8. Common OWM Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| Coordinates out of range | Values below 0.0 or above 1.0 cause rendering errors or invisible components | Keep all values within 0.05-0.95 for reliable display |
| Missing `style wardley` | Map renders as a generic node graph without Wardley Map axes and styling | Always include `style wardley` on line 2 |
| Orphan components | A component with no links floats disconnected, adding visual noise without insight | Every component must connect to the value chain via at least one link |
| Name mismatch in links | `AI Engine->LLM` fails if the component is named `AI Response Engine` | Link names must match component declarations exactly, including case and spacing |
| Same visibility for many components | Multiple components at the same y-value overlap and become unreadable | Space components by at least 0.04 on the visibility axis |
| Too many components | Maps with more than 20 components are cluttered and lose strategic clarity | Target 8-15 components. Split into sub-maps if you need more detail |
| Evolve target less than current | `evolve X 0.30` when X is already at 0.40 is invalid -- evolution moves rightward only | Evolve target must be greater than the component's current evolution value |
| Missing anchor | Without an anchor, the map has no clear entry point or user perspective | Always define exactly one `anchor` for the primary user |
| Putting the anchor at low visibility | Anchor at 0.30 buries the user at the bottom of the map | Anchor visibility should be 0.93-0.97 |
| Confusing axis order | Writing `[evolution, visibility]` instead of `[visibility, evolution]` | OWM coordinates are always `[visibility, evolution]` -- vertical axis first, horizontal second |
