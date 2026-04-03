<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->

# AI PMF Metrics — Measurement Framework

> **Purpose:** Agent-readable reference for measuring AI product-market fit with dual metric systems.
> **Usage:** Lookup by metric type, false PMF detection, cost analysis, pricing model selection, validation staging.

---

## Section 1: Dual Success Metrics

AI products require TWO parallel measurement systems: traditional product metrics and AI-specific indicators.

### Traditional Metrics (Necessary but Insufficient)

| Metric | What It Measures | PMF Signal | Measurement Method |
|--------|-----------------|-----------|-------------------|
| Engagement (DAU/MAU) | Usage frequency | >40% = strong habit | Analytics platform |
| Retention (D7/D30) | Staying power | D30 >30% = promising | Cohort analysis |
| Conversion | Willingness to pay | >5% free->paid = validated | Funnel tracking |
| NPS | Satisfaction | >40 = strong advocacy | Survey (quarterly) |

### AI-Specific Metrics (The Real PMF Indicators)

| Metric | What It Measures | PMF Signal | False PMF Trap |
|--------|-----------------|-----------|---------------|
| Override Rate | % outputs accepted without editing | <20% = high trust | High engagement + high override = false PMF |
| Speed Delta | Time saved vs old workflow | >3x = strong value | Speed without accuracy = liability |
| Workflow Stickiness | Became default tool for this task | >70% = embedded | Stickiness from lock-in != stickiness from value |
| Correction Velocity | How fast users correct AI errors | Decreasing trend = learning | Flat = model not improving from feedback |
| Escalation Ratio | How often users escalate AI->human | <15% = autonomous enough | 0% may mean users don't trust enough to try |

### Metric Cross-Reference Matrix

| Traditional Metric | AI Metric to Pair | What the Combination Reveals |
|-------------------|------------------|----------------------------|
| High DAU/MAU | + High Override Rate | Users checking but not trusting — false PMF |
| High Retention | + Low Speed Delta | Habit without value — vulnerable to alternatives |
| High Conversion | + High Escalation Ratio | Paying but not autonomous — cost scaling risk |
| High NPS | + Low Workflow Stickiness | Enthusiasm without dependency — churn risk |

---

## False PMF Warning Signs

| Pattern | Symptoms | Root Cause | Resolution |
|---------|----------|-----------|------------|
| Check-but-rewrite | High engagement + high override rate (~90%) | Users distrust outputs, use AI as draft generator only | Improve output quality; study what users change |
| Habit without value | High retention + low speed delta | Routine usage without measurable time savings | Identify and optimize the core value loop |
| Shallow engagement | Low escalation + low override | Users not engaging deeply enough with outputs | Improve onboarding; demonstrate capability range |
| Enthusiasm without embedding | High NPS + low workflow stickiness | Users like it but haven't integrated it | Build integrations; reduce friction to embed |

### False PMF Case Example

> A legal AI startup showed strong engagement metrics. Lawyers used it daily. But override rate was ~90% — they checked every AI output and rewrote nearly everything. The product was an "expensive spell-checker," not a PMF product.

---

## Section 2: Seven Hidden Costs of AI Products

| # | Cost | Description | Typical Impact | Mitigation |
|---|------|-------------|---------------|-----------|
| 1 | Hallucination Cost | Detecting, preventing, and recovering from incorrect outputs | Support tickets, trust damage, legal risk | Confidence scoring, citation, human-in-loop |
| 2 | Latency Cost | User wait time for AI processing | Abandonment, perceived sluggishness | Streaming, caching, model selection per task |
| 3 | Evaluation Cost | Testing AI quality at scale (no unit tests for probabilistic systems) | Engineering time, eval infrastructure | Automated eval suites, A/B testing |
| 4 | Token Burn | API/inference costs per interaction | "Margins look fine at 1K users, crumble at 100K" | Token optimization, caching, model tiering |
| 5 | Retrieval Cost | RAG infrastructure, embedding, vector DB | Infrastructure complexity and expense | Retrieval quality monitoring, chunking optimization |
| 6 | Support Cost | Users confused by probabilistic outputs | Higher support volume than deterministic software | Better UX, expectation setting, guided interactions |
| 7 | Trust Restoration Cost | Recovering from trust-breaking incidents | Churn spike, reputation damage | Incident playbooks, transparent communication |

### Cost Scaling Model

> "Inference costs are the new AWS bill."

| User Scale | Primary Cost Concern | Critical Action |
|-----------|---------------------|-----------------|
| 1K users | Evaluation Cost | Build eval infrastructure early |
| 10K users | Token Burn + Latency Cost | Implement caching, model tiering |
| 100K users | All costs compound | Full cost optimization pipeline |
| 1M users | Token Burn dominates | Proprietary model or aggressive optimization |

### Hidden Cost Audit Checklist

```
For each cost, estimate monthly impact:
- [ ] Hallucination Cost: $____ (support + trust damage + legal exposure)
- [ ] Latency Cost: $____ (lost conversions + infrastructure)
- [ ] Evaluation Cost: $____ (engineering time + tooling)
- [ ] Token Burn: $____ (API costs at current and projected scale)
- [ ] Retrieval Cost: $____ (vector DB + embedding + infrastructure)
- [ ] Support Cost: $____ (tickets attributable to AI confusion)
- [ ] Trust Restoration Cost: $____ (incident response + churn recovery)

Total Hidden AI Cost: $____
Cost per user per month: $____
Cost as % of revenue: ____%
```

---

## Section 3: Three AI Pricing Models

| Model | Risk Level | Best For | Warning |
|-------|-----------|----------|---------|
| Usage-Based | Highest | API/platform products | "Most AI products fail with this — users afraid to use them" |
| Seat-Based | Medium | Enterprise SaaS | Most enterprise-friendly, predictable for buyer |
| Outcome-Based | Lowest (if AI delivers) | High-ROI vertical products | "Closest thing to printing money if AI delivers measurable ROI" |

### Pricing Model Selection Matrix

| Factor | Usage-Based | Seat-Based | Outcome-Based |
|--------|------------|-----------|--------------|
| Revenue predictability | Low | High | Medium |
| User adoption friction | High (cost anxiety) | Low | Low |
| Alignment with value | Medium | Low | High |
| Enterprise readiness | Low | High | Medium |
| Scales with usage | Yes | No | Yes |
| Margin risk | High (token costs) | Low | Medium |

### Value Pricing Heuristic

> "AI products can usually capture 10-30% of the value they create."

| Value Created | Capture Rate | Price Point |
|--------------|-------------|-------------|
| Saves $1,000/month/user | 10-30% | $100-$300/month |
| Saves 10 hours/week | 10-30% of hourly cost | Varies by role |
| Increases revenue by $X | 10-30% of incremental revenue | Performance-based |

---

## Section 4: 10-100-1000 Validation Loop

### Stage Definitions

| Stage | Volume | What You Learn | Exit Criteria |
|-------|--------|---------------|---------------|
| 10 conversations | Problem clarity | Is it real, recurring, painful, cognitively expensive? | 8/10 confirm pain unprompted |
| 100 prototype interactions | Reasoning stability | Reasoning steps, clarification quality, retrieval quality, failure patterns | <15% hallucination rate, consistent reasoning |
| 1,000 logs | System reliability | Hallucination triggers, retrieval drift, context overflow, cost explosions, latency | Error rate <5%, cost model validated, latency <3s p95 |

### Stage Detail: 10 Conversations

| Checkpoint | Question | Pass Criteria |
|-----------|----------|--------------|
| Pain reality | Do prospects describe this pain without prompting? | 8/10 confirm |
| Pain frequency | How often does this problem occur? | Daily or weekly |
| Pain severity | What happens when the problem isn't solved? | Measurable cost or risk |
| AI suitability | Is this problem cognitively expensive? | Involves pattern recognition, synthesis, or generation |

### Stage Detail: 100 Prototype Interactions

| Checkpoint | Question | Pass Criteria |
|-----------|----------|--------------|
| Reasoning quality | Are reasoning steps logical and traceable? | >85% of outputs follow sound logic |
| Clarification | Does the AI ask good clarifying questions? | Users report feeling understood |
| Retrieval | Is retrieved context relevant? | >90% retrieval relevance |
| Failure patterns | Are failures predictable and manageable? | Failure modes are documented and bounded |

### Stage Detail: 1,000 Logs

| Checkpoint | Question | Pass Criteria |
|-----------|----------|--------------|
| Error rate | What % of outputs contain errors? | <5% |
| Cost model | Does unit economics work at scale? | Positive margin at projected scale |
| Latency | Is response time acceptable? | <3s p95 |
| Drift | Is quality stable over time? | No degradation trend |

### Stress Test Protocol

> "Purposely sabotage — remove key info, feed contradictions, overload context windows, introduce noise, test edge cases."

| Test Type | Method | What It Reveals |
|-----------|--------|----------------|
| Information removal | Strip key context from inputs | Hallucination tendencies |
| Contradiction injection | Feed conflicting information | Reasoning robustness |
| Context overflow | Exceed typical input length | Degradation patterns |
| Noise injection | Add irrelevant information | Signal extraction ability |
| Edge cases | Test boundary conditions | Failure mode coverage |

---

## Metric Dashboard Template

### Weekly Review Metrics

```
Traditional Metrics:
- DAU/MAU: ____% (target: >40%)
- D7 Retention: ____% (target: >50%)
- D30 Retention: ____% (target: >30%)
- Conversion: ____% (target: >5%)
- NPS: ____ (target: >40)

AI-Specific Metrics:
- Override Rate: ____% (target: <20%)
- Speed Delta: ____x (target: >3x)
- Workflow Stickiness: ____% (target: >70%)
- Correction Velocity: ____ (target: decreasing)
- Escalation Ratio: ____% (target: <15%)

Hidden Costs:
- Cost per user: $____
- Token burn trend: ____
- Support ticket volume (AI-related): ____

Validation Stage: [10 / 100 / 1,000]
Current blockers: ____
```

---

## Quick Reference: PMF Confidence Levels

| Confidence | Traditional Metrics | AI Metrics | Hidden Costs | Validation Stage |
|-----------|-------------------|-----------|-------------|-----------------|
| No PMF | Below all thresholds | High override, low stickiness | Unknown or unsustainable | <10 conversations |
| False PMF | Some thresholds met | Override >50%, stickiness <40% | Not measured | 10-100 |
| Early PMF | Most thresholds met | Override <30%, stickiness >50% | Measured, manageable | 100-1,000 |
| Strong PMF | All thresholds exceeded | Override <20%, stickiness >70% | Optimized, sustainable | >1,000 validated |
