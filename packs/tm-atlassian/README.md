# tm-atlassian

Atlassian integration: Jira project management & Confluence knowledge base via MCP.

## MCP Server

Uses the official `@anthropic/atlassian-mcp-server`. Requires:
- `ATLASSIAN_SITE_URL` — your Atlassian site (e.g., `https://yoursite.atlassian.net`)
- `ATLASSIAN_USER_EMAIL` — your Atlassian email
- `ATLASSIAN_API_TOKEN` — API token from https://id.atlassian.com/manage-profile/security/api-tokens

## Vendored Skills

5 Atlassian skills available in `vendor/official-plugins/skills/atlassian--*`:
- triage-issue
- search-company-knowledge
- generate-status-report
- create-page
- update-issue
