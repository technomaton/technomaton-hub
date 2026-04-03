<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->
<!-- Sources: [jaffer-4d-method], [jaffer-pmf] — see AI_PMF_BIBLIOGRAPHY.md -->

# AI Product-Market Fit — Product Development

## 1. The 4D Method: Discover, Design, Develop, Deploy

### Overview

```
D1 Discover → D2 Design → D3 Develop → D4 Deploy
   (Find)       (Architect)   (Validate)   (Trust)
```

Each phase has explicit exit criteria. Do not advance without meeting them.

---

### D1 — Discover: Finding the Cognitive Labor

**Objective:** Find difficult THINKING, not difficult steps.

#### 5 Types of Hidden Cognitive Work

| Type | Description | Detection Signal | Example |
|------|-------------|-----------------|---------|
| **Cognitive load hotspots** | Hesitation, second-guessing, re-checking, context-assembly | Users pause, re-read, or switch tabs repeatedly | Doctor cross-referencing 4 systems before prescribing |
| **Unstructured interpretation** | Reading, summarizing, extracting from messy sources | Users manually parse documents, emails, or transcripts | Lawyer reviewing 200-page contract for 5 key clauses |
| **Variable workflows** | Paths differ based on judgment, nuance, or context | Same task done differently by different experts | Support agent choosing escalation path based on tone |
| **Ambiguous intent zones** | Users want something but cannot articulate the steps | Users describe goals, not procedures | "Make this report better" or "find me the right candidate" |
| **Context dependency** | Constant tab-switching, searching, file-gathering | Users assemble information before they can think | Analyst pulling data from 6 sources before starting analysis |

#### Critical Diagnostic

> "Is this **AI-shaped** (ambiguity, reasoning, judgment) or **logic-shaped** (deterministic rules)?"

| AI-Shaped Problem | Logic-Shaped Problem |
|-------------------|---------------------|
| Requires interpretation of ambiguous inputs | Has clear if/then rules |
| Output quality varies by context | Output is deterministic |
| Experts disagree on the "right" answer | Correct answer is objectively verifiable |
| Involves natural language or unstructured data | Involves structured data with defined schemas |

#### Failure Mode

> "Teams assume AI justifies building AI, when the problem needed workflow clarity, not intelligence."

**Red flags that the problem is not AI-shaped:**
- A flowchart could solve it
- The bottleneck is data access, not data interpretation
- Users need faster software, not smarter software

#### Exit Criteria

```
- [ ] Documented cognitive labor map (all 5 types assessed)
- [ ] AI-shaped problems identified and separated from logic-shaped ones
- [ ] At least 3 cognitive labor hotspots validated with user observation
- [ ] Problem statement articulated as "thinking work" not "step work"
```

---

### D2 — Design: Architect the Reasoning, Not the Interface

**Objective:** Specify how the AI thinks before specifying how it looks.

#### 5 Components to Specify

| Component | Description | Key Questions | Deliverable |
|-----------|-------------|---------------|-------------|
| **Reasoning blueprint** | Step-by-step AI logic sequence | What chain of thought solves this? What order? What branches? | Documented reasoning flow with decision points |
| **Context pipeline** | What AI sees first, retrieves, ignores, asks for | What context is essential vs. noise? What must be fetched vs. given? | Context specification with priority ranking |
| **Memory strategy** | Selective persistence of preferences, patterns, decisions | What should AI remember across sessions? What should it forget? | Memory schema with retention rules |
| **Tool strategy** | APIs, actions, permissions with constraints and confirmations | What can AI execute? What requires human approval? What is forbidden? | Tool manifest with permission levels |
| **Failure-first design** | Worst-case hallucinations, cascade failures, harm vectors | What is the worst thing AI could do? How do we detect and recover? | Failure catalog with mitigation for each scenario |

#### Warning

> "If you design interface first and intelligence second, product behaves unpredictably."

**Correct order:**
1. Reasoning blueprint (how AI thinks)
2. Context pipeline (what AI knows)
3. Memory + Tools (what AI remembers and does)
4. Failure design (what AI must not do)
5. Interface (how user interacts) — LAST

#### Exit Criteria

```
- [ ] AI PRD with all 5 components specified
- [ ] Reasoning blueprint tested with 5+ sample inputs manually
- [ ] Failure catalog with ≥10 failure scenarios documented
- [ ] Context pipeline priorities ranked and validated
- [ ] Tool permissions defined with explicit deny-list
```

---

### D3 — Develop: 10-100-1000 Validation Loop

**Objective:** Validate progressively from problem clarity to system reliability.

#### Validation Stages

| Stage | Volume | Purpose | What You Learn | Key Metrics |
|-------|--------|---------|---------------|-------------|
| **10 conversations** | 10 | Problem clarity | Is it real, recurring, painful, cognitively expensive? | Problem confirmation rate, user emotional response |
| **100 prototype interactions** | 100 | Reasoning stability | Reasoning steps, clarification quality, retrieval quality, failure patterns | Reasoning accuracy, clarification rate, retrieval precision |
| **1000 logs** | 1000 | System reliability | Hallucination triggers, retrieval drift, missing context, multi-step collapse, cost explosions, latency | Error rate, p95 latency, cost per interaction, failure clustering |

#### Mandatory Stress-Testing

> "Purposely sabotage — remove key info, feed contradictions, overload context, introduce noise."

| Sabotage Method | What It Reveals |
|----------------|----------------|
| Remove key information | Does AI ask for it or hallucinate? |
| Feed contradictory inputs | Does AI flag contradiction or pick arbitrarily? |
| Overload context window | Does AI degrade gracefully or collapse? |
| Introduce noisy/irrelevant data | Does AI filter or get distracted? |
| Chain 10+ dependent steps | Does AI maintain coherence or drift? |

#### Cost and Latency Modeling

> "AI appears cheap but scales expensively."

| Scale | Must Model |
|-------|-----------|
| 10K users | Token cost, API calls, storage |
| 100K users | Above + caching strategy, rate limits, queue management |
| 1M users | Above + model optimization, fine-tuning ROI, infrastructure |

```
Cost Model Template:
- Cost per interaction: $___
- Average interactions per user per day: ___
- Monthly cost at 10K users: $___
- Monthly cost at 100K users: $___
- Monthly cost at 1M users: $___
- Revenue per user per month: $___
- Break-even interactions per user: ___
```

#### Exit Criteria

```
- [ ] 10 conversations confirm problem is real and recurring
- [ ] 100 interactions show reasoning stability >80%
- [ ] 1000 logs analyzed with failure modes cataloged
- [ ] Stress tests completed (all 5 sabotage methods)
- [ ] Cost model validated at 10x current scale
- [ ] p95 latency within acceptable bounds for use case
```

---

### D4 — Deploy: Trust Before Autonomy

**Objective:** Build user trust before expanding AI autonomy.

#### Core Insight

> "AI products fail because the experience around the model is weak."

#### First 10 Seconds Rule

> First 10 seconds > first 10 features.

| Timing | User Must Experience |
|--------|-------------------|
| 0-3 seconds | AI understands my context (not a blank slate) |
| 3-7 seconds | AI produces something useful (not a loading spinner) |
| 7-10 seconds | AI shows me how to correct or refine (not a dead end) |

#### Exit Criteria

```
- [ ] Trust layer operational (user can override, correct, escalate)
- [ ] Autonomy level defined (see Autonomy Staircase below)
- [ ] First-10-seconds experience validated with 20+ users
- [ ] Graceful degradation tested for model outage scenarios
- [ ] Monitoring dashboard live with key reliability metrics
```

---

## 2. Autonomy Staircase

### 4 Progressive Levels

| Level | AI Role | User Role | Trust Signal | Progression Criteria |
|-------|---------|-----------|-------------|---------------------|
| **1. Suggest** | Recommends options | Decides and executes | Low — AI is advisory | User accepts >60% of suggestions |
| **2. Draft** | Produces draft output | Reviews and edits | Medium — AI does first pass | Override rate drops below 30% |
| **3. Approve** | Executes with approval gate | Approves or rejects | High — AI is trusted | <10% rejection rate |
| **4. Execute** | Acts autonomously | Monitors exceptions | Full — AI is autonomous | <1% error rate, escalation working |

### Rules

- **Launch rule:** Products launch in safe, reversible sandbox mode and earn autonomy.
- **Progression rule:** Never skip levels. Each level must be earned through metrics.
- **Regression rule:** If error rates increase at any level, drop back one level immediately.

### Warning

> "If you scale before building trust, you're just scaling churn."

### Level Assessment Checklist

```
Current Level: ___

Level 1 → 2 Readiness:
- [ ] Suggestion acceptance rate >60% for 30 consecutive days
- [ ] Zero critical failures in suggestion mode
- [ ] User feedback: "I trust the suggestions"

Level 2 → 3 Readiness:
- [ ] Override rate <30% for 30 consecutive days
- [ ] Edit distance on drafts decreasing month-over-month
- [ ] User feedback: "Drafts need only minor tweaks"

Level 3 → 4 Readiness:
- [ ] Rejection rate <10% for 60 consecutive days
- [ ] Escalation path tested and working
- [ ] User feedback: "I trust it to act on my behalf"
- [ ] Rollback mechanism tested and operational
```

---

## 3. Five Layers of an AI System

| Layer | Description | Differentiability | PM Ownership | Investment Priority |
|-------|-------------|-------------------|-------------|-------------------|
| **Model** | LLM / foundation model | Lowest — commoditized | Low | Use best available; don't build |
| **Context** | What the model knows about the user/task | High — most underestimated | High | Invest heavily; this is your moat |
| **Retrieval / RAG** | How information is fetched and injected | Medium-High | Medium | Critical infrastructure |
| **Tool / Action** | What AI can execute | Medium | Medium | Differentiated by domain |
| **UX** | How user interacts with AI | High | Highest — "PMs own this entirely" | Primary differentiator |

### Key Insight

> "Bad retrieval looks exactly like hallucination to the user."

### Layer Diagnostic

| Symptom | Likely Layer Problem |
|---------|---------------------|
| AI gives wrong facts | Retrieval layer — wrong docs fetched or none fetched |
| AI gives generic answers | Context layer — insufficient user/task context |
| AI can't complete the task | Tool layer — missing API or permission |
| AI feels robotic or frustrating | UX layer — interaction design problem |
| AI is slow or expensive | Model layer — wrong model for the task |

### Investment Decision Matrix

```
If differentiating on intelligence → invest in Context + Retrieval
If differentiating on capability → invest in Tool + Action
If differentiating on experience → invest in UX
If none of the above → reconsider whether AI is necessary
```

---

## 4. Six Laws of AI UX

| # | Law | Principle | Implementation | Anti-Pattern |
|---|-----|-----------|---------------|-------------|
| 1 | **Invisible Setup** | Capture context automatically | No onboarding forms — infer from behavior, connected tools, and usage patterns | Forcing users through a 10-step setup wizard |
| 2 | **Cognitive Offloading** | Reduce mental effort at peak moments | Surface relevant information before user asks; anticipate next action | Requiring users to recall and manually input context |
| 3 | **Adaptive Interfaces** | Dynamic UX adapting to intent | Interface morphs based on detected task; power users get different UI than beginners | One-size-fits-all static interface |
| 4 | **Predictable Surprise** | Impressive but never rogue | Delight within bounds; never take unexpected actions; always explain reasoning | AI takes autonomous action user didn't expect or want |
| 5 | **Context Is King** | Model with context = partner; without = parrot | Maximize context injection at every turn; use memory, retrieval, user history | Treating every conversation as starting from zero |
| 6 | **Failure-First Design** | Design around failure, not success | Every interaction has a graceful degradation path; always offer a fallback | Assuming AI will always produce correct output |

### UX Law Compliance Checklist

```
- [ ] Law 1: User reaches value in <3 interactions with no manual setup
- [ ] Law 2: AI proactively surfaces relevant info in >50% of interactions
- [ ] Law 3: Interface adapts to at least 2 distinct user modes
- [ ] Law 4: AI never takes action without user awareness; reasoning visible
- [ ] Law 5: Context from previous sessions persists and improves responses
- [ ] Law 6: Every AI response has a fallback path (retry, human escalation, manual override)
```
