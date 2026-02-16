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
**Documentation:** 55KB of guides, templates, and instructions

## 📦 What Was Configured

### 1. Complete Directory Structure (20 directories)

```
k1-kiosk/
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

**Location:** `/Users/jheckman/k1-kiosk/CLAUDE.md`

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

### 3. Documentation Files (5 comprehensive guides)

**Root documentation:**
- ✅ **README.md** (7.1KB) - Project overview, quick start, directory structure
- ✅ **SETUP-GUIDE.md** (this file) - Claude automation setup and usage
- ✅ **GIT-SETUP-GUIDE.md** (6.7KB) - Git configuration and workflow
- ✅ **TEMPLATE-CUSTOMIZATION.md** (8.5KB) - How to adapt for other programs
- ✅ **CLAUDE.md** (27KB) - Complete Claude Code instructions

**Total documentation:** 55KB of production-ready guides

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

**Location:** `~/.claude/plugins/local/k1-automation/`

**Plugin structure:**
```
k1-automation/
├── README.md                    # Plugin documentation
├── .claude-plugin/
│   └── plugin.json             # Plugin metadata (v1.0.0)
└── skills/
    ├── weekly-report/
    │   └── SKILL.md            # Weekly report generator (203 lines)
    └── backlink-validator/
        └── SKILL.md            # Backlink validator (150 lines)
```

#### Available Skills

**`/k1:weekly-report [date]`**
- **Purpose:** Generate comprehensive weekly build status reports
- **Process:** Reads all daily reports → Synthesizes → Generates executive report
- **Output:** `Builds/Proto/Weekly Reports/YYYY-MM-DD-K1-Proto-Weekly.md`
- **Features:**
  - Executive summary with build health indicator
  - Build progress (SMT/FATP metrics)
  - Issues categorized (🔴🟡✅)
  - Week-over-week trends
  - Links to source documents
- **Fully documented in CLAUDE.md** with complete instructions

**`/k1:backlink-validator`**
- **Purpose:** Validate wiki-style links across vault
- **Process:** Scans all markdown → Validates links → Identifies issues → Generates report
- **Output:** `Backlink-Validation-Report-YYYY-MM-DD.md`
- **Features:**
  - Broken link detection
  - Orphaned document identification
  - Vault health score
  - Auto-fix mode with backups
- **Fully documented in CLAUDE.md** with complete instructions

**Future skills (documented as coming soon):**
- `/k1:mil-generator` - Extract MIL from daily reports
- `/k1:build-summary` - Generate build phase retrospective

### 7. Git Configuration

**Files configured:**
- ✅ `.gitignore` - Optimized for Obsidian vaults (ignores workspace, cache, .claude/)
- ✅ `.gitattributes` - Line ending management (LF for markdown/JSON)
- ✅ `GIT-SETUP-GUIDE.md` - Complete git workflow documentation

### 8. Example Content

**Included:**
- ✅ 9 daily build reports (K1 Proto D1-D9)
- ✅ Consistent formatting demonstrations
- ✅ Issue tracking examples (🔴🟡✅)
- ✅ Cross-referencing patterns

## 🚀 How to Use

### For K1 Program (As-Is)

1. **Navigate to vault:**
   ```bash
   cd /Users/jheckman/k1-kiosk
   ```

2. **Start Claude Code:**
   - Claude automatically loads CLAUDE.md
   - Skills available via `/k1:*` commands

3. **Create daily reports:**
   - Use template from `Resources/Templates/daily-build-report-template.md`
   - Name: `YYYY-MM-DD-K1-Proto-DX.md`
   - Save to `Builds/Proto/Build Reports/`

4. **Generate weekly report:**
   ```
   /k1:weekly-report 2026-02-07
   ```

5. **Validate vault:**
   ```
   /k1:backlink-validator
   ```

### For New Programs (Clone & Customize)

**See `TEMPLATE-CUSTOMIZATION.md` for complete guide.**

**Quick steps:**
1. Clone repository
2. Find-and-replace program names (K1 → YourProgram)
3. Rename automation plugin (k1-automation → yourprogram-automation)
4. Update SKILL.md files with new paths
5. Update CLAUDE.md with program details
6. Initialize git

**Time to customize:** ~30 minutes

### For Team Demos

**Showcase these capabilities:**

1. **Complete Template Structure**
   - Show full directory organization
   - Demonstrate README files in each directory
   - Highlight templates in Resources/Templates/

2. **Consistent Documentation Patterns**
   - Daily build reports with standard structure
   - Status indicators (🔴🟡✅) for quick scanning
   - Cross-referencing with wiki-style links

3. **Automated Reporting**
   - Live generation of weekly report
   - Synthesis across multiple daily reports
   - Executive-ready output with zero placeholders

4. **Knowledge Graph Integrity**
   - Run backlink validator
   - Show vault health assessment
   - Demonstrate broken link detection

5. **Template Customization**
   - Show TEMPLATE-CUSTOMIZATION.md
   - Demonstrate simple find-and-replace approach
   - Explain 30-minute setup for new programs

## 📊 Comparison with W3 Setup

| Feature | W3 Vault (Production) | K1 Vault (Template) |
|---------|----------------------|---------------------|
| **Directory Structure** | ✅ Complete (20 dirs) | ✅ Complete (20 dirs) |
| **CLAUDE.md** | ✅ 708 lines (34KB) | ✅ 750 lines (27KB) |
| **Automation Plugin** | ✅ w3-automation (7 skills) | ✅ k1-automation (2 skills) |
| **Document Templates** | ❌ None | ✅ 3 templates |
| **Directory READMEs** | ❌ Minimal | ✅ 8 comprehensive |
| **Customization Guide** | ❌ None | ✅ Complete (8.5KB) |
| **Git Documentation** | ❌ Basic | ✅ Complete (6.7KB) |
| **README** | ❌ Basic | ✅ Comprehensive (7.1KB) |
| **Total Documentation** | ~34KB | ~55KB |
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

**Weekly Report Skill in CLAUDE.md includes:**
- Data sources and file paths
- 3-step generation process
- Full markdown output template
- Validation checklist
- Important notes and best practices
- ~100 lines of detailed instructions

**Backlink Validator Skill in CLAUDE.md includes:**
- Validation scope
- 4-step validation process
- Report format template
- Auto-fix protocols
- Safety requirements
- ~80 lines of detailed instructions

### Plugin Configuration

**plugin.json:**
```json
{
  "name": "k1-automation",
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
name: k1:weekly-report
description: This skill should be used when...
version: 1.0.0
---
```

## 🎓 Next Steps

### To Activate Skills (First Time)

**Important:** Restart Claude Code for skills to be recognized.

1. Exit Claude Code
2. Restart Claude Code
3. Navigate to `/Users/jheckman/k1-kiosk`
4. Test: `/k1:weekly-report` (should show as available skill)

### To Add More Skills

1. Create skill directory:
   ```bash
   mkdir -p ~/.claude/plugins/local/k1-automation/skills/new-skill
   ```

2. Create `SKILL.md`:
   ```markdown
   ---
   name: k1:new-skill
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
sed -i '' 's/k1-kiosk/my-program-vault/g' CLAUDE.md
sed -i '' 's/k1:/myprogram:/g' CLAUDE.md

# Rename plugin
mv ~/.claude/plugins/local/k1-automation \
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

**Problem:** `/k1:weekly-report` not recognized

**Solutions:**
1. Restart Claude Code (most common fix)
2. Check plugin location: `~/.claude/plugins/local/k1-automation/`
3. Verify plugin.json syntax (valid JSON)
4. Check SKILL.md frontmatter (proper YAML)
5. Verify skill name format: `k1:skill-name`

### Weekly Report Not Generating

**Problem:** Report generation fails or incomplete

**Solutions:**
1. Verify daily reports exist for the week
2. Check naming: `YYYY-MM-DD-K1-Proto-DX.md`
3. Ensure you're in k1-kiosk directory when running
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
3. Verify plugin.json name matches directory
4. Update CLAUDE.md references
5. Restart Claude Code

## 📚 Documentation Reference

**Primary documents:**
- **CLAUDE.md** (27KB) - Complete instructions for Claude Code
- **README.md** (7.1KB) - Project overview and quick start
- **TEMPLATE-CUSTOMIZATION.md** (8.5KB) - How to adapt template
- **GIT-SETUP-GUIDE.md** (6.7KB) - Git configuration and workflow
- **SETUP-GUIDE.md** (this file) - Claude automation setup

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
- ~/.claude/plugins/local/k1-automation/README.md

## 🌐 External Resources

- **Claude Code Documentation:** https://claude.ai/code
- **Obsidian Documentation:** https://help.obsidian.md/
- **W3 Reference Vault:** `/Users/jheckman/w3-hw-wallet/`
- **Plugin Location:** `~/.claude/plugins/local/k1-automation/`

## ✅ Verification Checklist

Before distributing to teams, verify:
- [ ] All directories created (20 total)
- [ ] All README files present (8 directories)
- [ ] All templates created (3 files)
- [ ] All root documentation present (5 files)
- [ ] Plugin configured and skills working
- [ ] Git files configured (.gitignore, .gitattributes)
- [ ] Example content included (9 daily reports)
- [ ] CLAUDE.md up to date (27KB, 750+ lines)
- [ ] Skills fully embedded in CLAUDE.md
- [ ] Customization guide complete

---

**Template Version:** 1.0.0
**Last Updated:** 2026-02-12
**Maintained By:** Justin Heckman (justin@block.xyz)
