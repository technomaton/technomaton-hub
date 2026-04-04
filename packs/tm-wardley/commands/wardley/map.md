---
description: "Generate a Wardley Map in OWM format for a product, service, or initiative"
allowed-tools: Read, Grep, Glob, Agent
model: opus
---

# Generate Wardley Map

Generate a Wardley Map in OWM (Online Wardley Maps) text format for the product, service, or initiative specified in $ARGUMENTS.

Invoke @wardley-mapper to:

1. **Identify the anchor** — who is the primary user and what are their needs
2. **Build the value chain** — map needs through capabilities to infrastructure dependencies
3. **Position components** — on visibility (Y) and evolution (X) axes using the Component Characteristics Table
4. **Add movement** — mark components that are actively evolving
5. **Annotate** — add build/buy/outsource labels and strategic notes

The output includes:
- Complete OWM text block (pasteable into https://onlinewardleymaps.com)
- Positioning rationale for each component
- Key strategic observations derived from the map
- Evolution highlights showing which components are moving and why

If $ARGUMENTS is empty, ask the user what product, service, or initiative to map.

Default output language is Czech. If the user writes in English, respond in English.
