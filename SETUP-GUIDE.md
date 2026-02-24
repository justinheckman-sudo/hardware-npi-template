# K1 Kiosk - Claude Setup Guide

This document explains the Claude Code environment setup for the K1 Kiosk vault - a complete template for hardware NPI program management.

## 🎯 What This Vault Is

**K1 Kiosk** is a **production-ready template** for hardware NPI (New Product Introduction) program management. While configured for K1 Proto build tracking, it's designed to be:

- ✅ **Cloned and customized** for other hardware programs
- ✅ **Used as-is** for K1 tracking
- ✅ **Referenced** for NPI documentation best practices
- ✅ **Distributed** to other teams via git

**Based on:** Production workflows from W3 Hardware Wallet NPI program
**Structure:** Complete directory organization with templates and automation
**Documentation:** ~70KB of guides, templates, and instructions

## 🚀 Quick Start

| Action | Command | Time |
|--------|---------|------|
| **List all commands** | `/hub:help` | Instant |
| **Generate weekly report** | `/hub:weekly-report` | 2-5 min |
| **Create build summary** | `/hub:build-summary Proto` | 10-20 min |
| **Generate MIL** | `/hub:mil Proto` | 2-5 min |
| **Master MIL** | `/hub:master-mil` | 5-10 min |
| **Check readiness** | `/hub:readiness EVT` | 5-10 min |
| **Build comparison** | `/hub:compare Proto EVT` | 5-10 min |
| **Weekly agenda** | `/hub:agenda` | 2-5 min |
| **Weekly briefing** | `/hub:briefing` | 5 min |
| **Validate vault** | `/hub:backlinks` | 2 min |

**First time setup:**
1. Restart Claude Code to activate skills (one-time)
2. Install `uv` for Glean MCP: `curl -LsSf https://astral.sh/uv/install.sh | sh`
3. On first Glean use, authenticate via browser OAuth (prompted automatically)
4. (Optional) Configure Google Drive MCP - see `GOOGLE-DRIVE-MCP-SETUP.md` (10-15 min)

## 📦 What Was Configured

### 1. Complete Directory Structure (20 directories)

```
hardware-npi-template/
├── Archive/                      # Archived content
├── Builds/
│   └── Proto/                   # Build phase (add EVT, DVT, PVT as needed)
│       ├── Build Reports/       # Daily reports (9 examples included)
│       └── Weekly Reports/      # Weekly summaries (generated)
├── Communication/
│   ├── Daily-Updates/          # Daily vault summaries
│   └── Weekly-Updates/         # Weekly program status
├── Decisions/
│   └── ✅ Decided/             # Finalized decisions
├── Meetings/                    # Meeting notes and agendas
├── Quality/
│   ├── MIL/                    # Manufacturing Issue Log
│   └── Changes/                # Change tracking
├── Technical-Notes/             # Analysis and validation
├── Risks/
│   └── ✅ Resolved/            # Resolved risks
└── Resources/
    ├── Templates/              # 3 document templates
    └── Automations/            # Automation documentation
```

**Every directory includes a README** explaining its purpose and usage.

### 2. CLAUDE.md (27KB - Comprehensive Instructions)

**Location:** `/Users/jheckman/hardware-npi-template/CLAUDE.md`

**Contains:**
- Repository overview and template nature
- Complete directory structure documentation
- File naming conventions for all document types
- Build terminology and phase context
- Content standards and executive communication guidelines
- **Fully embedded skill documentation** with complete instructions
- Cross-referencing guidelines and live document patterns
- Build phase documentation structure
- Document templates overview
- Vault expansion guide (5 phases)
- Comparison with W3 setup

**Size progression:**
- Initial: 178 lines (6.7KB)
- Enhanced: 550 lines (20KB)
- **Current: 750+ lines (27KB)** with embedded skills

### 3. Documentation Files (6 comprehensive guides)

**Root documentation:**
- ✅ **README.md** (7.1KB) - Project overview, quick start, directory structure
- ✅ **SETUP-GUIDE.md** (this file) - Claude automation setup and usage
- ✅ **GOOGLE-DRIVE-MCP-SETUP.md** (14KB) - Google Drive integration (optional)
- ✅ **TEMPLATE-CUSTOMIZATION.md** (8.5KB) - How to adapt for other programs
- ✅ **GIT-SETUP-GUIDE.md** (6.7KB) - Git configuration and workflow
- ✅ **CLAUDE.md** (27KB) - Complete Claude Code instructions

**Total documentation:** ~70KB of production-ready guides

### 4. Document Templates (3 templates)

**Location:** `Resources/Templates/`

- ✅ **daily-build-report-template.md** - Daily build status with all sections
- ✅ **decision-document-template.md** - Formal decision docs with metadata
- ✅ **risk-document-template.md** - Risk register entry with assessment

**Usage:** Copy template → Rename following conventions → Fill in → Link from related docs

### 5. Directory READMEs (8 comprehensive guides)

Each major directory includes a README explaining:
- Purpose and structure
- File naming conventions
- Document structure and best practices
- Cross-referencing guidelines
- Related documents and resources

**Directories with READMEs:**
- Communication/
- Decisions/
- Risks/
- Meetings/
- Quality/
- Technical-Notes/
- Resources/

### 6. K1 Automation Plugin

**Location:** `~/.claude/plugins/local/hardware-npi-automation/`

**Plugin structure:**
```
hardware-npi-automation/
├── README.md                    # Plugin documentation
├── .claude-plugin/
│   └── plugin.json             # Plugin metadata (v1.0.0)
└── skills/
    ├── hub/                    # Unified command interface
    │   └── SKILL.md
    ├── weekly-report/          # Weekly build status generator
    │   └── SKILL.md
    ├── build-summary/          # Build phase retrospective
    │   └── SKILL.md
    ├── mil-generator/          # Manufacturing Issue Log extraction
    │   └── SKILL.md
    ├── readiness-assessment/   # Build gate readiness evaluation
    │   └── SKILL.md
    └── backlink-validator/     # Vault integrity checker
        └── SKILL.md
```

**10 production-ready skills** with comprehensive documentation embedded in CLAUDE.md

#### Available Skills

**`/hub:help`** - Show all commands
- **Purpose:** List all available automation commands
- **Output:** Command list with descriptions

**`/hub:weekly-report [date]`** - Weekly build status
- **Purpose:** Generate comprehensive weekly build status reports
- **Output:** `Communication/Weekly-Updates/YYYY-MM/WXX/YYYY-MM-DD-K1-Proto-Weekly.md`
- **Features:** Executive summary, program highlights, build metrics, issue tracking, trends

**`/hub:build-summary <phase>`** - Build phase retrospective
- **Purpose:** Comprehensive build summary with 15 sections
- **Output:** `Builds/[Phase]/[Phase]-Build-Summary.md`
- **Features:** Objectives, metrics, lessons learned, GO/NO-GO recommendation

**`/hub:mil <phase>`** - Manufacturing Issue Log
- **Purpose:** Extract and analyze MIL from daily reports
- **Output:** `Quality/MIL/{Phase}-Manufacturing-Issue-Log.md` + CSV
- **Features:** Intelligent deduplication, root cause analysis, issue tracking

**`/hub:master-mil`** - Cross-build MIL aggregation
- **Purpose:** Aggregate issues across all build phases
- **Output:** `Quality/MIL/Master-MIL.md` + CSV
- **Features:** Issue lineage tracking, recurring issue detection

**`/hub:readiness <phase> [previous-phase]`** - Build gate assessment
- **Purpose:** Data-driven readiness evaluation for next build phase
- **Output:** `Builds/{Phase}/{Phase}-Readiness-Assessment-{Date}.md`
- **Features:** 7-domain gate criteria, GO/NO-GO recommendation, blockers

**`/hub:compare <build1> <build2>`** - Build-over-build analysis
- **Purpose:** Quality comparison with strategic insights
- **Output:** `Build-Comparison-{Build1}-vs-{Build2}-{Date}.md`
- **Features:** Yield trends, quality delta, recommendations

**`/hub:agenda [date]`** - Weekly core team agenda
- **Purpose:** Generate weekly core team meeting agenda
- **Output:** `Meetings/YYYY-MM/WXX/YYYY-MM-DD-K1-Core-Team-Agenda.md`

**`/hub:briefing [date]`** - Personal weekly prep briefing
- **Purpose:** Strategic weekly planning document
- **Output:** `Communication/Weekly-Updates/YYYY-MM/WXX/YYYY-MM-DD-Weekly-Prep-Briefing.md`

**`/hub:backlinks`** - Vault integrity check
- **Purpose:** Validate wiki-style links across vault
- **Output:** `Backlink-Validation-Report-YYYY-MM-DD.md`
- **Features:** Broken link detection, orphaned documents, repair suggestions

All skills are **fully documented in CLAUDE.md** with complete instructions, data sources, and validation checklists.

### 7. Glean MCP (Pre-configured)

**Configuration:** `.claude/mcp.json` (checked into repo — no setup required)

**Prerequisite:** `uv` must be installed:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Authentication:** On first use, Glean opens a browser window for OAuth. No tokens or secrets to manage.

**Capabilities once authenticated:**
- Search across your organization's knowledge base (Confluence, Docs, Slack, Jira, etc.)
- Ask questions and get AI-synthesized answers from enterprise content
- Use a specific Glean agent by setting `APPLICATION_ID` env var (optional)

> This uses the Square-internal `mcp_glean` package via `uvx`. If adapting for a non-Square organization, update the server entry in `.claude/mcp.json`.

### 8. Google Drive Integration (Optional)

**Setup guide:** `GOOGLE-DRIVE-MCP-SETUP.md`

**Capabilities once configured:**
- Search Google Drive for K1 documents
- Read document contents (Docs, Sheets, Slides, PDFs)
- Auto-sync documents to vault with intelligent categorization
- Track sync state for incremental updates

**Configuration:** MCP (Model Context Protocol) server in `~/.config/claude-code/mcp.json`

**Time to setup:** 10-15 minutes (includes OAuth authentication)

### 9. Git Configuration

**Files configured:**
- ✅ `.gitignore` - Optimized for Obsidian vaults (ignores workspace, cache, .claude/)
- ✅ `.gitattributes` - Line ending management (LF for markdown/JSON)
- ✅ `GIT-SETUP-GUIDE.md` - Complete git workflow documentation

### 10. Example Content

**Included:**
- ✅ 9 daily build reports (K1 Proto D1-D9)
- ✅ Consistent formatting demonstrations
- ✅ Issue tracking examples (🔴🟡✅)
- ✅ Cross-referencing patterns

## 🚀 How to Use

### For K1 Program (As-Is)

1. **Navigate to vault:**
   ```bash
   cd /Users/jheckman/hardware-npi-template
   ```

2. **Start Claude Code:**
   - Claude automatically loads CLAUDE.md
   - Skills available via `/hub:*` commands

3. **Create daily reports:**
   - Prompt: "Create my first daily build report for today"
   - Or use template from `Resources/Templates/daily-build-report-template.md`
   - Name: `YYYY-MM-DD-K1-Proto-DX.md`
   - Save to `Builds/Proto/Build Reports/`

4. **Use automation skills:**
   ```
   /hub:help                            # List all commands
   /hub:weekly-report 2026-02-07        # Generate weekly report
   /hub:build-summary Proto             # Create build retrospective
   /hub:mil Proto                       # Extract Manufacturing Issue Log
   /hub:master-mil                      # Cross-build MIL aggregation
   /hub:readiness EVT                   # Generate gate assessment
   /hub:compare Proto EVT               # Build-over-build analysis
   /hub:agenda                          # Weekly core team agenda
   /hub:briefing                        # Personal weekly prep
   /hub:backlinks                       # Validate vault links
   ```

5. **Sync from Google Drive (if configured):**
   ```
   "Sync K1 documents from Google Drive to vault"
   ```

### For New Programs (Clone & Customize)

**See `TEMPLATE-CUSTOMIZATION.md` for complete guide.**

**Quick steps:**
1. Clone repository
2. Find-and-replace program names (K1 → YourProgram)
3. Rename automation plugin (hardware-npi-automation → yourprogram-automation)
4. Update SKILL.md files with new paths
5. Update CLAUDE.md with program details
6. Initialize git

**Time to customize:** ~30 minutes

### For Team Demos

**Showcase these capabilities:**

1. **Complete Template Structure**
   - Show full directory organization with 20 directories
   - Demonstrate README files in each directory
   - Highlight templates in Resources/Templates/

2. **Consistent Documentation Patterns**
   - Daily build reports with standard structure
   - Status indicators (🔴🟡✅) for quick scanning
   - Cross-referencing with wiki-style links

3. **Automated Synthesis (10 Skills)**
   - `/hub:help` - Show all available commands
   - `/hub:weekly-report` - Executive-ready weekly summaries
   - `/hub:build-summary` - Comprehensive 15-section retrospectives
   - `/hub:mil` - Intelligent MIL extraction with analytics
   - `/hub:master-mil` - Cross-build MIL aggregation
   - `/hub:readiness` - Data-driven gate evaluations
   - `/hub:compare` - Build-over-build quality analysis
   - `/hub:agenda` - Weekly core team meeting agendas
   - `/hub:briefing` - Personal weekly prep briefings
   - `/hub:backlinks` - Vault integrity checking

4. **Knowledge Graph Integrity**
   - Run backlink validator
   - Show vault health assessment
   - Demonstrate broken link detection and auto-fix

5. **Google Drive Integration (Optional)**
   - Document search and sync from Google Drive
   - Auto-categorization by content type
   - Incremental sync with state tracking

6. **Template Customization**
   - Show TEMPLATE-CUSTOMIZATION.md
   - Demonstrate 30-minute clone-and-customize workflow
   - Highlight reusable structure for any hardware program

## 📊 Comparison with W3 Setup

| Feature | W3 Vault (Production) | K1 Vault (Template) |
|---------|----------------------|---------------------|
| **Directory Structure** | ✅ Complete (20 dirs) | ✅ Complete (20 dirs) |
| **CLAUDE.md** | ✅ 708 lines (34KB) | ✅ 750+ lines (27KB) |
| **Automation Plugin** | ✅ w3-automation (7 skills) | ✅ hardware-npi-automation (10 skills) |
| **Google Drive MCP** | ✅ Configured | ✅ Setup guide included |
| **Document Templates** | ❌ None | ✅ 3 templates |
| **Directory READMEs** | ❌ Minimal | ✅ 8 comprehensive |
| **Customization Guide** | ❌ None | ✅ Complete (8.5KB) |
| **Git Documentation** | ❌ Basic | ✅ Complete (6.7KB) |
| **README** | ❌ Basic | ✅ Comprehensive (7.1KB) |
| **Total Documentation** | ~34KB | ~62KB |
| **Template-Ready** | ❌ Production-specific | ✅ Clone & customize |

**Key differences:**
- **W3:** Production vault for specific program
- **K1:** Reusable template for any hardware program

## 🔧 Technical Details

### Skills Fully Embedded in CLAUDE.md

Unlike typical setups where skills are only in SKILL.md files, K1 has **complete skill instructions embedded in CLAUDE.md**:

**Benefits:**
- Self-contained documentation
- Users can read CLAUDE.md to understand everything
- No need to reference separate files
- Demo audiences see full instructions
- Easier to maintain consistency

**All 10 skills documented in CLAUDE.md:**

| Skill | Documentation Size | Key Sections |
|-------|-------------------|--------------|
| **Help** | ~20 lines | Command listing |
| **Weekly Report** | ~100 lines | Data sources, 3-step process, output template |
| **Build Summary** | ~120 lines | 15 sections, strategic features, validation |
| **MIL Generator** | ~110 lines | Extraction logic, deduplication, analytics |
| **Master MIL** | ~80 lines | Cross-build aggregation, issue lineage |
| **Readiness Assessment** | ~100 lines | 7-domain criteria, GO/NO-GO, blockers |
| **Build Comparator** | ~80 lines | Build-over-build analysis, quality delta |
| **Core Team Agenda** | ~60 lines | Weekly meeting agenda generation |
| **Weekly Briefing** | ~70 lines | Personal weekly prep document |
| **Backlink Validator** | ~80 lines | Validation scope, 4-step process, auto-fix |

**Total embedded skill documentation:** ~820 lines in CLAUDE.md

Each skill includes:
- Purpose and command syntax
- Data sources with file paths
- Step-by-step generation process
- Complete output format templates
- Validation checklists
- Important notes and best practices
- When to use / when NOT to use guidance

### Plugin Configuration

**plugin.json:**
```json
{
  "name": "hardware-npi-automation",
  "description": "K1 Proto build tracking automation skills",
  "author": {
    "name": "Justin Heckman",
    "email": "justin@block.xyz"
  },
  "version": "1.0.0"
}
```

**SKILL.md frontmatter:**
```yaml
---
name: hub:weekly-report
description: This skill should be used when...
version: 1.0.0
---
```

## 🎓 Next Steps

### To Activate Skills (First Time)

**Important:** Restart Claude Code for skills to be recognized.

1. Exit Claude Code
2. Restart Claude Code
3. Navigate to `/Users/jheckman/hardware-npi-template`
4. Test: `/hub:weekly-report` (should show as available skill)

### To Add More Skills

1. Create skill directory:
   ```bash
   mkdir -p ~/.claude/plugins/local/hardware-npi-automation/skills/new-skill
   ```

2. Create `SKILL.md`:
   ```markdown
   ---
   name: hub:new-skill
   description: When to use this skill
   version: 1.0.0
   ---

   # Skill instructions here
   ```

3. Update CLAUDE.md "Available Skills" section
4. Restart Claude Code

### To Customize for New Program

**See `TEMPLATE-CUSTOMIZATION.md` for complete guide.**

**Quick commands:**
```bash
# Clone and rename
git clone <url> my-program-vault
cd my-program-vault

# Update program name
sed -i '' 's/K1/MyProgram/g' CLAUDE.md
sed -i '' 's/hardware-npi-template/my-program-vault/g' CLAUDE.md
sed -i '' 's/hub:/myprogram:/g' CLAUDE.md

# Rename plugin
mv ~/.claude/plugins/local/hardware-npi-automation \
   ~/.claude/plugins/local/myprogram-automation

# Update plugin files (manual)
# Edit: plugin.json, skills/*/SKILL.md

# Initialize git
rm -rf .git
git init
git add .
git commit -m "Initial commit: MyProgram vault"
```

### To Use Templates

**Daily build report:**
```bash
cp Resources/Templates/daily-build-report-template.md \
   Builds/Proto/Build\ Reports/2026-02-12-K1-Proto-D10.md
# Fill in template sections
```

**Decision document:**
```bash
cp Resources/Templates/decision-document-template.md \
   Decisions/2026-02-12-K1-Decision-Topic.md
# Fill in template sections
```

**Risk document:**
```bash
cp Resources/Templates/risk-document-template.md \
   Risks/RISK-004-K1-Risk-Title.md
# Fill in template sections
```

## 🐛 Troubleshooting

### Skills Not Showing Up

**Problem:** `/hub:weekly-report` not recognized

**Solutions:**
1. Restart Claude Code (most common fix)
2. Verify plugin exists: `ls ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json`
3. Validate plugin.json: `cat ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json`
4. Check SKILL.md frontmatter (proper YAML)
5. Verify skill name format: `hub:skill-name`

### Weekly Report Not Generating

**Problem:** Report generation fails or incomplete

**Solutions:**
1. Verify daily reports exist for the week
2. Check naming: `YYYY-MM-DD-K1-Proto-DX.md`
3. Ensure you're in hardware-npi-template directory when running
4. Check daily reports follow standard structure
5. Review CLAUDE.md for expected format

### Backlink Validator Failing

**Problem:** Validation errors or fails to run

**Solutions:**
1. Check read/write permissions on vault
2. Verify markdown files are properly formatted
3. Look for syntax errors in wiki-style links
4. Ensure vault path is correct
5. Check for corrupted markdown files

### Skills Not Loading After Customization

**Problem:** Renamed skills don't work

**Solutions:**
1. Update all occurrences of skill name
2. Check SKILL.md frontmatter matches directory name
3. Verify plugin.json: `cat ~/.claude/plugins/local/yourprogram-automation/.claude-plugin/plugin.json`
4. Ensure plugin name in plugin.json matches directory name
5. Update CLAUDE.md references
6. Restart Claude Code

### Google Drive Sync Not Working

**Problem:** Can't access Google Drive documents

**Solutions:**
1. Verify MCP server is configured: `cat ~/.config/claude-code/mcp.json`
2. Check Node.js/npm installed: `node --version`
3. Re-authenticate: Clear `~/.config/@modelcontextprotocol/server-gdrive/` and restart
4. Test with simple query: "List files in my Google Drive"
5. See `GOOGLE-DRIVE-MCP-SETUP.md` for detailed troubleshooting

### Skill Execution Taking Too Long

**Problem:** Skills like `/hub:build-summary` or `/hub:mil-generator` are slow

**Explanation:**
- These skills use Opus model for deep synthesis (expected: 5-10 minutes)
- They read ALL daily reports and analyze comprehensively
- This is intentional for high-quality output

**Not a bug:** This is normal behavior for comprehensive analysis skills

## 📚 Documentation Reference

**Primary documents:**
- **CLAUDE.md** (27KB) - Complete instructions for Claude Code
- **README.md** (7.1KB) - Project overview and quick start
- **SETUP-GUIDE.md** (this file) - Claude automation setup
- **GOOGLE-DRIVE-MCP-SETUP.md** (14KB) - Google Drive integration guide
- **TEMPLATE-CUSTOMIZATION.md** (8.5KB) - How to adapt template
- **GIT-SETUP-GUIDE.md** (6.7KB) - Git configuration and workflow

**Directory READMEs:**
- Communication/README.md - Communication guidelines
- Decisions/README.md - Decision documentation
- Risks/README.md - Risk management
- Meetings/README.md - Meeting notes
- Quality/README.md - Quality tracking
- Technical-Notes/README.md - Technical docs
- Resources/README.md - Templates and automation

**Templates:**
- Resources/Templates/daily-build-report-template.md
- Resources/Templates/decision-document-template.md
- Resources/Templates/risk-document-template.md

**Plugin documentation:**
- ~/.claude/plugins/local/hardware-npi-automation/README.md

## 🌐 External Resources

- **Claude Code Documentation:** https://claude.ai/code
- **Obsidian Documentation:** https://help.obsidian.md/
- **W3 Reference Vault:** `/Users/jheckman/w3-hw-wallet/`
- **Plugin Location:** `~/.claude/plugins/local/hardware-npi-automation/`

## ✅ Verification Checklist

Before distributing to teams, verify:
- [ ] All directories created (20 total)
- [ ] All README files present (8 directories)
- [ ] All templates created (3 files)
- [ ] All root documentation present (6 files: README, SETUP, GIT, TEMPLATE, GOOGLE-DRIVE, CLAUDE)
- [ ] Plugin configured with 10 skills working (`/hub:help` to verify)
- [ ] Git files configured (.gitignore, .gitattributes)
- [ ] Example content included (9 daily reports)
- [ ] CLAUDE.md up to date (27KB, 750+ lines)
- [ ] All 10 skills fully embedded in CLAUDE.md
- [ ] `uv` installed and Glean OAuth completed on first use
- [ ] Google Drive MCP setup guide complete
- [ ] Customization guide complete

---

**Template Version:** 1.0.0
**Last Updated:** 2026-02-16
**Maintained By:** Justin Heckman (justin@block.xyz)

**Note:** Google Drive integration is **optional**. The vault works fully without it. See `GOOGLE-DRIVE-MCP-SETUP.md` if you want to enable document sync from Google Drive.
