---
description: "Strategic positioning compass — integrated VUCA + PMF assessment for product direction decisions"
allowed-tools: Read, Write, Grep, Glob, Agent
model: opus
---

# /strategy/compass

Generate a strategic compass for the product or initiative specified in $ARGUMENTS.

This is a lighter version of `/strategy/audit` focused on positioning decisions. Invoke `@strategy-conductor` to run both frameworks, then distill the results into a 2x2 positioning matrix.

## 2x2 Positioning Matrix

- **X-axis**: PMF Strength (opportunity score + moat strength)
- **Y-axis**: VUCA Maturity (communication quality + decision quality)

### Quadrants

| | Strong PMF | Weak PMF |
|---|---|---|
| **Strong VUCA** | Scale confidently | Pivot the offering |
| **Weak VUCA** | Fix communication before scaling | Foundational work needed |

- **Strong PMF + Strong VUCA** = "Scale confidently" — both the product direction and the communication/execution quality support growth.
- **Strong PMF + Weak VUCA** = "Fix communication before scaling" — the product has market fit but communication, decisions, or collaboration will bottleneck growth.
- **Weak PMF + Strong VUCA** = "Pivot the offering" — execution quality is high but the product is aimed at the wrong problem or market.
- **Weak PMF + Weak VUCA** = "Foundational work needed" — address both product direction and operational quality before investing in growth.

## Expected Output

1. The 2x2 matrix with the assessed position marked
2. Brief justification for the quadrant placement (2-3 sentences)
3. The single most important strategic action based on the quadrant position

If $ARGUMENTS is empty, ask the user what product or initiative to assess.
