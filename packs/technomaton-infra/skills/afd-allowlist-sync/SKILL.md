---
name: afd-allowlist-sync
description: Generate idempotent az commands to sync Front Door WAF allowlist for X-Azure-FDID; do not execute.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Write
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
---
# AFD Allowlist Sync
Read config/azure.env.json; output az commands to allow listed FDIDs and deny others.
