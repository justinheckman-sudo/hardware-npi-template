# Google Drive MCP Setup Guide

## Overview

This guide walks you through setting up the **Google Drive MCP (Model Context Protocol) server** for use with Claude Code. Once configured, Claude Code can:

- Search for documents in Google Drive
- Read document contents (Docs, Sheets, Slides, PDFs)
- Access documents shared with your Google account
- Sync documents to your Obsidian vault

**Time to Complete:** 10-15 minutes

---

## Prerequisites

Before starting, ensure you have:

- **Node.js and npm** installed (for running the MCP server)
- **Claude Code** installed and configured
- **Google account** with access to the documents you want to sync
- **Obsidian vault** set up (this repository)

---

## Step 1: Install Node.js and npm

The Google Drive MCP server runs as a Node.js package via `npx`.

### Check if Node.js is installed:

```bash
node --version
npm --version
npx --version
```

If not installed, download from: https://nodejs.org/

---

## Step 2: Configure Google Drive MCP Server

The MCP server configuration lives in a JSON file that Claude Code reads on startup.

### Configuration File Location

**Primary location (recommended):**
```
~/.config/claude-code/mcp.json
```

**Alternative location (for vault-specific config):**
```
/path/to/your-vault/.claude/mcp.json
```

**Note:** Most users should use the primary location in `~/.config/claude-code/` for global MCP settings.

### Create the Configuration

If the file doesn't exist, create it:

```bash
mkdir -p ~/.config/claude-code
```

Edit `~/.config/claude-code/mcp.json` and add:

```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-gdrive"
      ]
    }
  }
}
```

**What this does:**
- **"gdrive"**: Name of the MCP server (used internally by Claude Code)
- **"command": "npx"**: Uses npx to run the package without global installation
- **"-y"**: Automatically confirms package installation
- **"@modelcontextprotocol/server-gdrive"**: Official Google Drive MCP server package

---

## Step 3: Authenticate with Google Drive

The Google Drive MCP server uses OAuth 2.0 to authenticate with your Google account.

### First-Time Authentication

1. **Restart Claude Code** after adding the configuration
2. **Make a request** that requires Google Drive access:
   ```
   "List files in my Google Drive"
   ```
3. **Follow the OAuth flow:**
   - A browser window will open
   - Sign in to your Google account
   - Grant permissions to the MCP server
   - You'll be redirected to a success page

### Permissions Requested

The MCP server will request these Google Drive scopes:
- **`drive.readonly`**: Read all files in your Drive
- **`drive.metadata.readonly`**: View metadata (file names, modified dates, etc.)

**Important:** The MCP server has **read-only** access. It cannot modify, delete, or create files in your Drive.

### OAuth Token Storage

OAuth tokens are stored securely by the MCP server. **Do not commit** these tokens to git.

**Token location (typically):**
```
~/.config/@modelcontextprotocol/server-gdrive/
```

---

## Step 4: Verify Setup

Test that the MCP server is working correctly.

### Test 1: List Files

In Claude Code, try:
```
"List files in my Google Drive modified in the last week"
```

**Expected result:** Claude should call the MCP tool and show you a list of files.

### Test 2: Read a Document

```
"Read the document named '[Document Name]' from Google Drive"
```

Replace `[Document Name]` with an actual document in your Drive.

**Expected result:** Claude should fetch and display the document content.

### Test 3: Search for Documents

```
"Search Google Drive for documents containing '[PROGRAM] Proto'"
```

**Expected result:** Claude should return matching documents.

---

## Step 5: Understanding MCP Tool Capabilities

Once configured, Claude Code has access to these Google Drive tools:

| Tool | Purpose | Example |
|------|---------|---------|
| **`gdrive_search`** | Search for files by name, content, or modified date | "Find all [PROGRAM] build reports from last week" |
| **`gdrive_read`** | Read content of a specific file | "Read the [PROGRAM] Proto Build Summary" |
| **`gdrive_list_folders`** | List folders in Drive | "Show me all folders in the [PROGRAM] Program folder" |
| **`gdrive_get_file_metadata`** | Get file details (size, modified date, owner) | "When was '[PROGRAM] MIL' last modified?" |

**Note:** Exact tool names may vary depending on MCP server version. Use `--verbose` mode in Claude Code to see tool calls.

---

## Step 6: Configuring for Document Sync

To enable automated syncing of program documents from Google Drive to your vault:

### 6.1: Create Sync Configuration

Edit `CLAUDE.md` in your vault and add sync instructions:

```markdown
## Google Drive Sync

Claude Code can sync program documents from Google Drive to this vault.

### Sync Strategy
- Search for documents with "[PROGRAM]" in the name
- Search within your Program Management folder
- Filter by modified date (only sync new/updated files)
- Exclude vendor documents: `[EXTERNAL]`, `[Wistron]`, etc.

### File Categories
Documents are automatically categorized and routed:

| Category | Keywords | Vault Location |
|----------|----------|----------------|
| Build Reports | Daily Report, Build Report | `Builds/Proto/Build Reports/` |
| MIL | MIL, Manufacturing Issue | `Quality/MIL/` |
| Technical Notes | Touch, NFC, Display, Analysis | `Technical-Notes/` |
| Decisions | Decision, Strategy | `Decisions/` |
| Meeting Notes | Meeting, Sync, Agenda | `Meetings/` |

### Usage
Ask Claude Code to sync documents:
```
"Sync program documents from Google Drive to vault"
```
```

### 6.2: Create Sync Script (Optional)

For automated syncing, create a shell script wrapper:

**File:** `Resources/Automations/scripts/sync_k1_drive.sh`

```bash
#!/bin/bash

# NPI Google Drive Sync Script
# Syncs program documents from Google Drive to Obsidian vault

set -e

VAULT_PATH="/path/to/your-vault"

echo "======================================================================"
echo "NPI GOOGLE DRIVE SYNC"
echo "======================================================================"
echo "Vault Path: $VAULT_PATH"
echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# Change to vault directory
cd "$VAULT_PATH"

# Ask Claude Code to perform the sync
# Note: This requires Claude Code CLI integration
echo "Requesting sync via Claude Code..."
echo "Please run this script from within a Claude Code session:"
echo ""
echo '  "Sync program documents from Google Drive to vault"'
echo ""

echo "======================================================================"
```

Make it executable:
```bash
chmod +x Resources/Automations/scripts/sync_k1_drive.sh
```

---

## Step 7: Best Practices

### Security

- **Never commit OAuth tokens** to git
- Store tokens securely (handled automatically by MCP server)
- **Audit access regularly:** Check which apps have Drive access at https://myaccount.google.com/permissions
- **Rotate tokens periodically** if needed (revoke and re-authenticate)

### Performance

- **File size limits:** The MCP server may timeout on very large files (>10MB)
- **Rate limits:** Google Drive API has rate limits; avoid rapid repeated requests
- **Caching:** Consider caching synced documents locally to reduce API calls

### Organization

- **Use naming conventions: Ensure documents in Drive have consistent naming (e.g., `[PROGRAM]-Proto-Daily-Report-YYYY-MM-DD`)
- **Folder structure:** Organize Drive folders to match vault structure where possible
- **Vendor filtering:** Exclude vendor documents to avoid syncing external content

---

## Troubleshooting

### Issue: MCP Server Not Starting

**Symptoms:**
- Claude Code doesn't recognize Google Drive tools
- Error messages about missing MCP server

**Solutions:**
1. Verify `npx` is installed: `npx --version`
2. Check configuration file exists: `cat ~/.config/claude-code/mcp.json`
3. Restart Claude Code completely (quit and relaunch)
4. Check Claude Code logs for errors

### Issue: Authentication Failing

**Symptoms:**
- OAuth flow doesn't open browser
- Permission denied errors
- Token expired errors

**Solutions:**
1. **Clear cached credentials:**
   ```bash
   rm -rf ~/.config/@modelcontextprotocol/server-gdrive/
   ```
2. **Re-authenticate:**
   - Restart Claude Code
   - Try accessing Drive again (OAuth flow will restart)
3. **Check browser:** Ensure your default browser is set correctly

### Issue: Can't Find Documents

**Symptoms:**
- Search returns no results
- Known documents aren't found

**Solutions:**
1. **Check sharing:** Ensure documents are shared with your Google account
2. **Verify naming:** Confirm document names match search queries
3. **Test in Drive:** Search for the document directly in Google Drive web UI
4. **Permissions:** Ensure you have at least "Viewer" access to the documents

### Issue: Rate Limit Errors

**Symptoms:**
- `429 Too Many Requests` errors
- Intermittent failures during sync

**Solutions:**
1. **Wait before retrying:** Google Drive API rate limits reset after 1-5 minutes
2. **Reduce request frequency:** Don't sync multiple times in quick succession
3. **Use incremental sync:** Only sync files modified since last sync (not full scans)

### Issue: Large Files Timing Out

**Symptoms:**
- Sync fails on specific large documents
- Timeout errors

**Solutions:**
1. **Skip large files:** Configure sync to skip files >5MB
2. **Download manually:** For very large files, download directly from Drive
3. **Split documents:** Consider splitting large documents into smaller parts

---

## Advanced Configuration

### Using Vault-Specific MCP Config

If you want different MCP settings per vault, use the vault-specific config:

**Create:** `/path/to/your-vault/.claude/mcp.json`

```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-gdrive"
      ],
      "env": {
        "VAULT_NAME": "your-vault"
      }
    }
  }
}
```

**Note:** Vault-specific configs override global configs when working in that vault.

### Environment Variables

You can pass environment variables to the MCP server:

```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gdrive"],
      "env": {
        "GOOGLE_DRIVE_FOLDER_ID": "1abc123...",
        "LOG_LEVEL": "debug"
      }
    }
  }
}
```

### Multiple MCP Servers

You can run multiple MCP servers simultaneously:

```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gdrive"]
    },
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-...",
        "SLACK_TEAM_ID": "T1234567890"
      }
    }
  }
}
```

---

## Related Documentation

- **MCP Protocol Docs:** https://modelcontextprotocol.io/
- **Google Drive API:** https://developers.google.com/drive/api
- **Claude Code Setup:** [[SETUP-GUIDE]]
- **Vault Structure:** [[CLAUDE.md]]


---

## Example Workflows

### Workflow 1: Sync Program Build Reports

```
User: "Sync all [PROGRAM] Proto build reports from Google Drive"

Claude: [Searches Drive for "[PROGRAM] Proto" + "Build Report"]
        [Reads each document]
        [Converts to markdown]
        [Saves to Builds/Proto/Build Reports/]
        [Generates sync report]
```

### Workflow 2: Find Latest MIL

```
User: "What's the latest version of the [PROGRAM] MIL in Google Drive?"

Claude: [Searches for "[PROGRAM] MIL"]
        [Sorts by modified date]
        [Shows file metadata]
        [Optionally: reads and summarizes]
```

### Workflow 3: Weekly Sync Routine

```
User: "Sync all [PROGRAM] documents modified in the last week"

Claude: [Searches with modifiedTime filter]
        [Reads new/updated documents]
        [Auto-categorizes by filename]
        [Saves to appropriate vault locations]
        [Generates sync report with stats]
```

---

## Support

For issues or questions:

1. **Check this guide** for troubleshooting steps
2. **Review Claude Code logs** for detailed error messages
3. **Test MCP connection** with simple queries first
4. **Ask Claude Code for help:** "Debug Google Drive MCP connection"

For MCP server issues, check:
- GitHub: https://github.com/modelcontextprotocol/servers
- Discord: https://discord.gg/modelcontextprotocol

---

**Last Updated:** 2026-02-16
**MCP Package Version:** `@modelcontextprotocol/server-gdrive` (latest)
**Claude Code Version:** Compatible with Claude Code 1.x+
