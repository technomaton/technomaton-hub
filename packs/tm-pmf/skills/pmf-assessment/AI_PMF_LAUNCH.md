<!-- License: CC-BY-4.0 — Attribution: Miqdad Jaffer (Product Lead, OpenAI) -->

# AI Product-Market Fit — Launch and Scaling

## 1. Launch Strategy Canvas

Score each dimension as Green / Yellow / Red before making any scaling decision.

### Scoring Rubric

| Dimension | Green (Go) | Yellow (Caution) | Red (Stop) |
|-----------|-----------|-----------------|-----------|
| **Customer Readiness** | Segment >1000 users, retention >60%, willingness-to-pay confirmed | Segment 100-1000, retention 40-60%, WTP assumed but not validated | Segment <100, retention <40%, WTP unknown |
| **Product Readiness** | Unfair advantage clear, viral potential identified, unique positioning | Some advantage, limited viral mechanics, differentiated but not unique | No clear advantage, no viral potential, commodity offering |
| **Company Readiness** | Tech feasible and proven, GTM viable, team has capacity | Tech stretch goal, GTM unclear, team needs 1-2 hires | Tech unknown or unproven, no GTM plan, critical team gaps |
| **Competition Readiness** | Weak competitors, high barriers to entry, low supplier power | Mixed competitor landscape, medium barriers | Strong incumbents, low barriers to entry, high supplier power |

### Decision Rules

```
ALL Green       → Scale aggressively
Mixed Yellow    → Proceed with caution; create mitigation plan for each Yellow
Any Red         → STOP — address the Red dimension before scaling
Multiple Red    → Return to D3 (Develop) phase; fundamental gaps exist
```

### Canvas Assessment Template

```
Date: _______________
Product: _______________
Assessor: _______________

Customer Readiness:  [ ] Green  [ ] Yellow  [ ] Red
  Evidence: _______________
  Segment size: ___
  Retention rate: ___%
  WTP evidence: _______________

Product Readiness:   [ ] Green  [ ] Yellow  [ ] Red
  Evidence: _______________
  Unfair advantage: _______________
  Viral mechanic: _______________

Company Readiness:   [ ] Green  [ ] Yellow  [ ] Red
  Evidence: _______________
  Tech status: _______________
  GTM plan: _______________
  Team gaps: _______________

Competition Readiness: [ ] Green  [ ] Yellow  [ ] Red
  Evidence: _______________
  Key competitors: _______________
  Barrier strength: _______________

Overall Decision: [ ] Scale  [ ] Proceed with caution  [ ] Stop
Mitigation plan (if Yellow): _______________
Blocker resolution (if Red): _______________
```

---

## 2. Pre-Launch Checklist

Structured assessment for launch readiness. All items must be checked before scaling.

### Core Readiness

```
## Pre-Launch Assessment

### Problem Validation
- [ ] Pain x Frequency x AI Advantage score >= 21/30
- [ ] Invisible pain points documented (not just obvious ones)
- [ ] Problem validated with 10+ user conversations

### Product Validation
- [ ] 4D phases completed (D1-D4 exit criteria met)
- [ ] Autonomy level defined (launching at Level 1 or 2)
- [ ] Trust layer operational (user can override/correct/escalate)
- [ ] First-10-seconds experience validated

### Metrics and Monitoring
- [ ] Dual metrics defined (traditional + AI-specific)
- [ ] Monitoring dashboard operational
- [ ] Alert thresholds configured for critical failures

### Economics
- [ ] Cost model validated at 10x current scale
- [ ] Unit economics positive or path to positive documented
- [ ] Revenue model tested with early users

### Defensibility
- [ ] At least one moat identified and under construction
- [ ] Moat type documented (data, context, workflow, integration)

### Risk
- [ ] Launch Strategy Canvas: all 4 dimensions Green
- [ ] Hallucination/failure scenarios documented with mitigations
- [ ] Rollback plan tested and operational
- [ ] Escalation path to human support verified
```

### Launch Readiness Score

| Items Checked | Readiness Level | Action |
|--------------|----------------|--------|
| 15/15 | Full readiness | Launch and scale |
| 12-14 | Near ready | Address gaps within 1 sprint, then launch |
| 9-11 | Significant gaps | Return to relevant 4D phase |
| <9 | Not ready | Do not launch; fundamental work remains |

---

## 3. Scaling Decision Framework

### When to Scale vs. When to Iterate

#### Scale Signals (all must be present)

| Signal | Threshold | How to Measure |
|--------|-----------|---------------|
| Override rate | <20% | Track user edits/rejections of AI output |
| Speed delta | >3x faster than manual process | Time comparison: AI-assisted vs. unassisted |
| Workflow stickiness | >70% weekly active usage | DAU/WAU ratio among activated users |
| Canvas dimensions | All 4 Green | Launch Strategy Canvas assessment |

#### Iterate Signals (any one triggers iteration)

| Signal | Threshold | Recommended Action |
|--------|-----------|-------------------|
| Override rate | >40% | Return to D2 — reasoning blueprint needs revision |
| Users abandon mid-task | >25% drop-off | Return to D4 — UX trust layer is failing |
| Single-use pattern | Users try once and don't return | Return to D1 — problem may not be recurring |
| Any Canvas dimension Red | One or more Red | Address Red dimension before continuing |

#### Pivot Signals (fundamental direction change needed)

| Signal | Indicator | Decision |
|--------|-----------|----------|
| AI advantage score drops | Model improvements commoditize your edge | Pivot to adjacent problem or different moat |
| Moat erosion | Competitors replicate your context/data advantage | Accelerate moat building or find new defensibility |
| Cost scaling faster than revenue | Unit economics worsen at scale | Re-architect for efficiency or change pricing model |
| User expectations outpace capability | Satisfaction drops despite improvement | Narrow scope or reposition expectations |

### Scaling Decision Tree

```
START: Review current metrics
│
├─ All Scale Signals met?
│   ├─ Yes → Check Canvas
│   │   ├─ All Green → SCALE
│   │   └─ Any Yellow/Red → ADDRESS first, then reassess
│   └─ No → Check which signals are missing
│       ├─ Override rate too high → ITERATE on reasoning (D2)
│       ├─ Speed delta too low → ITERATE on architecture (D3)
│       ├─ Stickiness too low → ITERATE on problem fit (D1)
│       └─ Multiple missing → RETURN to earliest failing D-phase
│
├─ Any Pivot Signals present?
│   ├─ Yes → Conduct pivot assessment
│   │   ├─ Adjacent problem available → PIVOT scope
│   │   ├─ New moat identifiable → PIVOT strategy
│   │   └─ Neither → Consider sunsetting
│   └─ No → Continue iteration cycle
│
└─ Review cadence: Reassess every 2 weeks during scaling
```

### Monthly Scaling Health Check

```
Month: ___  Product: ___

Scale Signals:
  Override rate:      ___% (target: <20%)
  Speed delta:        ___x (target: >3x)
  Workflow stickiness: ___% (target: >70%)
  Canvas status:      ___

Iterate Signals (any present?):
  [ ] Override rate >40%
  [ ] Mid-task abandonment >25%
  [ ] Single-use pattern detected
  [ ] Canvas dimension turned Red

Pivot Signals (any present?):
  [ ] AI advantage score declining
  [ ] Moat erosion detected
  [ ] Unit economics worsening
  [ ] User satisfaction dropping despite improvements

Decision: [ ] Continue scaling  [ ] Pause and iterate  [ ] Pivot  [ ] Reassess in 2 weeks
Action items: _______________
```
