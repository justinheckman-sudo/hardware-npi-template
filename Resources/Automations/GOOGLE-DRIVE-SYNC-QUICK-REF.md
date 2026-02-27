# Google Drive Sync - Quick Reference

## 🚀 Quick Commands

### Search Google Drive
```
"Search Google Drive for [PROGRAM] documents"
"Find [PROGRAM] build reports from last week"
"Show recent [PROGRAM] Proto documents"
```

### Read Documents
```
"Read the [PROGRAM] Proto Build Summary from Google Drive"
"Show me the latest [PROGRAM] MIL from Drive"
```

### Sync to Vault
```
"Sync [PROGRAM] documents from Google Drive to vault"
"Sync [PROGRAM] build reports modified in the last week"
"Sync all [PROGRAM] Proto documents from Drive"
```

---

## 📁 Auto-Categorization

Documents are automatically routed based on keywords:

| Keywords in Filename | Destination in Vault |
|----------------------|----------------------|
| Daily Report, Build Report | `Builds/Proto/Build Reports/` |
| MIL, Manufacturing Issue | `Quality/MIL/` |
| Touch, NFC, Display | `Technical-Notes/` |
| Decision, Strategy | `Decisions/` |
| Meeting, Sync, Agenda | `Meetings/YYYY-MM/` |
| Change List, Change Log | `Quality/Changes/` |

---

## ⚙️ Configuration

**Global Config:** `~/.config/claude-code/mcp.json`
**Vault Config:** `/path/to/your-vault/.claude/mcp.json`
**Sync State:** `.sync_drive_state.json` (auto-generated)

---

## 🔍 Common Workflows

### Daily Sync Routine
```
"Sync [PROGRAM] documents modified today from Google Drive"
```

### Weekly Full Sync
```
"Sync all [PROGRAM] documents from Google Drive modified this week"
```

### Specific Category Sync
```
"Sync [PROGRAM] build reports from Drive"
"Sync [PROGRAM] MIL documents from Drive"
"Sync [PROGRAM] meeting notes from Drive"
```

---

## 🚫 Auto-Excluded Files

The sync automatically skips:
- **Vendor docs:** `[EXTERNAL]`, `[Wistron]`, `[Green]`
- **Large files:** >5MB
- **Unsupported:** Videos, ZIP files
- **Not modified:** Files unchanged since last sync

---

## 🔐 Security Notes

- OAuth tokens stored securely in `~/.config/@modelcontextprotocol/server-gdrive/`
- Read-only access (cannot modify or delete files in Drive)
- Tokens NOT committed to git
- Revoke access: https://myaccount.google.com/permissions

---

## 🆘 Quick Troubleshooting

**MCP not working?**
→ Restart Claude Code completely

**OAuth not opening?**
→ Check default browser settings

**Can't find documents?**
→ Verify document is shared with your Google account

**Sync failed?**
→ Check file size (<5MB) and sharing permissions

---

## 📚 Full Documentation

- **Setup Guide:** [[GOOGLE-DRIVE-MCP-SETUP]]
- **Setup Status:** `.claude/MCP-SETUP-STATUS.md`
- **Integration Guide:** [[CLAUDE.md]] (Google Drive Integration section)

---

**Quick Start:** Just ask Claude Code to search or sync your program documents from Google Drive!
