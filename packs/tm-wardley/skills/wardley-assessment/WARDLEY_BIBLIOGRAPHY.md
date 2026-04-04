<!-- Source citations and attribution for the tm-wardley knowledge base. -->

# Wardley Mapping — Bibliography & Attribution

## Primary Sources

### [wardley-book] Simon Wardley, "Wardley Maps"
- **URL:** https://medium.com/wardleymaps
- **License:** CC-BY-SA-4.0
- **Nature:** The foundational text on Wardley Mapping. Multi-chapter book published freely on Medium.
- **Used in:** WARDLEY_CORE.md, WARDLEY_DOCTRINE.md, WARDLEY_CLIMATE.md, WARDLEY_PLAYS.md, WARDLEY_ILC.md

### [wardley-on-being-lost] Simon Wardley, "On Being Lost"
- **URL:** https://blog.gardeviance.org/2015/02/an-introduction-to-wardley-value-chain.html
- **License:** CC-BY-SA-4.0
- **Nature:** The original presentation introducing Wardley Mapping methodology.
- **Used in:** WARDLEY_CORE.md (foundational concepts)

### [mosior-learn] Ben Mosior, "Learn Wardley Mapping"
- **URL:** https://learnwardleymapping.com
- **License:** CC-BY-SA-4.0
- **Nature:** Curated learning path and pattern descriptions for Wardley Mapping.
- **Used in:** WARDLEY_CLIMATE.md, WARDLEY_DOCTRINE.md (pattern categorization and descriptions)

### [owm-project] Online Wardley Maps
- **URL:** https://onlinewardleymaps.com
- **Docs:** https://docs.onlinewardleymaps.com
- **License:** MIT
- **Nature:** Open-source tool for creating and rendering Wardley Maps using the OWM text format.
- **Used in:** WARDLEY_OWM.md (syntax reference, rendering workflow)

## Secondary Sources

### [wardley-leadership] Wardley Leadership Strategies
- **URL:** https://www.wardleyleadershipstrategies.com
- **Nature:** Blog applying Wardley Mapping to leadership and organizational strategy.
- **Used in:** WARDLEY_ILC.md (ILC ecosystem patterns), WARDLEY_CLIMATE.md (climatic pattern application)

### [awesome-wardley] Wardley Maps Community
- **URL:** https://github.com/wardley-maps-community/awesome-wardley-maps
- **Nature:** Curated list of Wardley Mapping resources, tools, and examples.
- **Used in:** WARDLEY_OWM.md (tool ecosystem reference)

### [lethain-wardley] Will Larson, "Generating a Wardley Map with LLM"
- **URL:** https://lethain.com/ces-ai-generate-wardley-map-llm/
- **Nature:** Practical guide to LLM-based Wardley Map generation.
- **Used in:** WARDLEY_OWM.md (LLM generation approach), WARDLEY_AI.md (AI ecosystem mapping)

## File-to-Source Mapping

| Knowledge File | Primary Sources | Secondary Sources | TECHNOMATON Synthesis |
|---------------|----------------|-------------------|----------------------|
| WARDLEY_CORE.md | [wardley-book] ch. 1-4, [wardley-on-being-lost] | — | Worked example, agent protocol |
| WARDLEY_DOCTRINE.md | [wardley-book] ch. 11, [mosior-learn] | — | Scoring rubric, assessment protocol, evolution alignment |
| WARDLEY_CLIMATE.md | [wardley-book] ch. 9-10, [mosior-learn] | [wardley-leadership] | AI manifestations, pattern interaction matrix |
| WARDLEY_PLAYS.md | [wardley-book] ch. 12-15 | — | AI-specific plays, play selection protocol |
| WARDLEY_ILC.md | [wardley-book] ch. 5-6 | [wardley-leadership] | AI ILC cycle, assessment protocol |
| WARDLEY_OWM.md | [owm-project] | [awesome-wardley], [lethain-wardley] | LLM generation protocol, worked examples |
| WARDLEY_AI.md | — | [lethain-wardley] | Original synthesis: AI stack map, wrapper trap, context defensibility |
| WARDLEY_BIBLIOGRAPHY.md | — | — | This file |

## Attribution Notes

- All content from Simon Wardley's book is used under CC-BY-SA-4.0 and adapted (not copied verbatim) for AI agent consumption.
- Ben Mosior's content is used under CC-BY-SA-4.0 for pattern categorization and learning path structure.
- OWM syntax reference is based on the MIT-licensed OnlineWardleyMaps project documentation.
- WARDLEY_AI.md is entirely TECHNOMATON original synthesis, MIT licensed.
- The Moat Evolution Matrix in WARDLEY_AI.md bridges to the PMF framework's Five-Moat Taxonomy (from tm-pmf pack, adapted from Miqdad Jaffer's work).

## Quotes Attribution

Quotes used in knowledge files are attributed inline. Key recurring attributions:

- "All models are wrong, but some are useful." — George Box (used as map caveat)
- "The map is not the territory." — Alfred Korzybski (used in WARDLEY_CORE.md)
- Simon Wardley quotes are from [wardley-book] unless otherwise noted.
