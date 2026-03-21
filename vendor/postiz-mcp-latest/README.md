# Postiz Content MCP

Reusable stdio MCP server for Postiz content operations.

## What It Does

- Lists connected Postiz integrations
- Evaluates Postiz channel health against optional expected integrations
- Lists recent posts over a time window
- Uploads media by URL through Postiz
- Creates draft or scheduled posts through the generic Postiz `/posts` surface
- Writes mutation logs to `data/changes.jsonl`
- Returns explicit `completion_state` and `should_continue` fields in tool responses

## Configuration

The server loads configuration in this order:

1. repo-local `.env`
2. `POSTIZ_CONTENT_MCP_ENV` if set
3. process environment

Required:

- `POSTIZ_API_KEY`

Optional:

- `POSTIZ_BASE_URL` default `https://api.postiz.com/public/v1`
- `POSTIZ_CONTENT_MCP_CHANGE_LOG_PATH`
- `POSTIZ_EXPECTED_INTEGRATION_IDS` comma-separated integration ids

## Tools

- `get_postiz_integrations`
- `get_postiz_channel_health`
- `list_postiz_posts`
- `upload_postiz_media_from_url`
- `create_postiz_post`

## Local Run

```bash
python3 src/index.py
```

## Tests

```bash
pytest tests -q
```

## Codex / Claude Setup

Ready-made client snippets live in `clients/`:

- `clients/codex.config.toml.example`
- `clients/mcp.json.example`
- `clients/claude.mcpServers.json.example`

The default examples point at the Mac mini path:

- server: `/Users/openclawmac/mcp-servers/postiz-content-mcp/src/index.py`
- app-specific env: `/Users/openclawmac/mcp-servers/postiz-content-mcp/profiles/clueless.env`

Recommended flow:

1. Copy `profiles/clueless.env.example` to `profiles/clueless.env`
2. Fill in the app-specific Postiz credentials there
3. Copy the matching client snippet into Codex or Claude MCP config
