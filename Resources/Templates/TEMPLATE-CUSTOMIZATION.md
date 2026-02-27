# Template Customization Guide

This guide walks you through adapting the Hardware NPI Vault template for your own hardware program.

## 🎯 Overview

The Hardware NPI Vault is designed as a **universal template** for hardware NPI program management. Follow this guide to customize it for your specific program.

## 📝 Step-by-Step Customization

### Step 1: Clone and Rename

**Clone the repository:**
```bash
git clone <repository-url> my-program-vault
cd my-program-vault
```

**Decide on your naming:**
- Program name: e.g., "Phoenix", "Titan", "Orion"
- Build phase: e.g., "Proto", "EVT", "DVT"
- Vault name: e.g., "w3-hw-wallet", "phoenix-tracker"

### Step 2: Update Directory Structure

**Rename build phase directory (if needed):**
```bash
cd Builds
mv Proto YourPhase
cd YourPhase/Build\ Reports
```

**Update daily report naming:**
- Old: `YYYY-MM-DD-[PROGRAM]-Proto-DX.md`
- New: `YYYY-MM-DD-YourProgram-YourPhase-DX.md`

### Step 3: Customize CLAUDE.md

**Find and replace throughout CLAUDE.md:**

```bash
# Program name
sed -i '' 's/[PROGRAM]/YourProgram/g' CLAUDE.md

# Vault path
sed -i '' 's/hardware-npi-template/your-vault-name/g' CLAUDE.md

# Build phase
sed -i '' 's/Proto/YourPhase/g' CLAUDE.md

# Skill prefix
sed -i '' 's/k1:/yourprogram:/g' CLAUDE.md
```

**Or manually update these sections:**
1. **Repository Overview** - Update vault purpose and program name
2. **Structure** - Update directory paths
3. **File Naming Conventions** - Update example filenames
4. **Claude Code Skills** - Update skill names and paths
5. **Technical Content Context** - Update program description

### Step 4: Customize Automation Plugin

**Rename plugin directory:**
```bash
cd ~/.claude/plugins/local
mv hardware-npi-automation yourprogram-automation
cd yourprogram-automation
```

**Update plugin.json:**
```json
{
  "name": "yourprogram-automation",
  "description": "YourProgram build tracking automation skills",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  },
  "version": "1.0.0"
}
```

**Update each SKILL.md file:**

For each skill in `skills/*/SKILL.md`, update:
1. **Frontmatter**:
   ```yaml
   ---
   name: yourprogram:weekly-report
   description: This skill should be used when the user asks to "generate YourProgram weekly report"...
   ---
   ```

2. **File paths**: Replace `/Users/jheckman/hardware-npi-template/` with your vault path

3. **Naming patterns**: Replace `[PROGRAM]-Proto-DX` with `YourProgram-YourPhase-DX`

4. **Output locations**: Update output paths for generated reports

### Step 5: Update Templates

**In Resources/Templates/, update:**

1. **Daily build report template:**
   - Header: `# YourProgram YourPhase Build Report - D[X]`
   - File naming instructions
   - Program-specific sections

2. **Weekly report template:**
   - Header: `# YourProgram YourPhase - Weekly Report`
   - Program-specific metrics

3. **Decision template:**
   - Program name in examples
   - Relevant decision types for your program

4. **Risk template:**
   - Risk ID format: `RISK-XXX-[PROGRAM]-Title`
   - Program-specific risk categories

### Step 6: Customize Terminology

**Update build terminology in CLAUDE.md:**

If your program uses different terminology:
- **SMT** → Your board assembly term
- **FATP** → Your final assembly term
- **MLB/SPE/Sensor** → Your board names
- **WMY** → Your factory location

**Find and replace:**
```bash
sed -i '' 's/MLB/YourBoardName/g' CLAUDE.md
sed -i '' 's/WMY/YourFactory/g' CLAUDE.md
```

### Step 7: Update README.md

**Customize README.md:**
1. Replace "[PROGRAM]" with your program name
2. Update repository URL
3. Update author information
4. Add program-specific use cases
5. Update examples with your program name

### Step 8: Initialize Git

**Remove existing git history (if cloned):**
```bash
rm -rf .git
git init
```

**Update .gitignore if needed:**
- Add program-specific files to ignore
- Add any custom automation scripts

**Create initial commit:**
```bash
git add .
git commit -m "Initial commit: YourProgram vault based on this template

- Customized for YourProgram tracking
- Updated all naming conventions
- Configured automation skills
- Ready for team use"
```

### Step 9: Configure MCP Servers

The vault includes a pre-configured `.claude/mcp.json` with two MCP servers — **Glean** (enterprise search) and **Google Drive** (document sync). These are checked into the repo so they're available to all users automatically.

**Glean MCP (included, requires `uv`)**

The Glean MCP uses OAuth browser authentication — no tokens or secrets to manage.

**Prerequisite:** Install `uv` if not already installed:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

On first use, Glean will open a browser window for OAuth authentication. Once authenticated, it stays active for your session.

> **Note:** This uses the Square-internal Glean fork (`mcp_glean` via `uvx`). If adapting for a non-Square organization, update the server entry in `.claude/mcp.json` to use your organization's Glean MCP package.

**Google Drive MCP (optional setup)**

See `GOOGLE-DRIVE-MCP-SETUP.md` for the full Google Drive setup guide (10-15 minutes).

### Step 10: Validate Setup

**Checklist:**
- [ ] All references to "[PROGRAM]" updated to your program name
- [ ] All file paths updated to your vault location
- [ ] Plugin renamed and skills updated
- [ ] CLAUDE.md customized with your program details
- [ ] Templates updated with your program name
- [ ] Build phase directories created
- [ ] Git initialized and .gitignore configured
- [ ] README.md updated with your information
- [ ] `uv` installed for Glean MCP (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
- [ ] Glean OAuth completed on first use (browser prompt)

**Test automation:**
1. Restart Claude Code
2. Navigate to your vault
3. Try `/yourprogram:weekly-report` to verify skills load
4. Create a test daily report following your naming convention
5. Run `/yourprogram:backlink-validator`

## 🎨 Advanced Customization

### Adding New Build Phases

**Create new phase structure:**
```bash
mkdir -p Builds/NewPhase/{Build\ Reports,Weekly\ Reports}
```

**Add to CLAUDE.md:**
Update the "Build Phase Documentation" section with new phase details.

### Adding Custom Skills

**Create new skill:**
```bash
mkdir -p ~/.claude/plugins/local/yourprogram-automation/skills/your-new-skill
```

**Create SKILL.md:**
```markdown
---
name: yourprogram:your-new-skill
description: When to use this skill
version: 1.0.0
---

# Your New Skill

[Instructions for Claude Code]
```

**Document in CLAUDE.md:**
Add new skill to "Available Skills" section with full details.

### Customizing Report Formats

**Modify report structure in SKILL.md files:**
1. Update template markdown in `Format Output` section
2. Add/remove sections as needed
3. Customize emoji indicators
4. Update synthesis instructions

### Adding Program-Specific Metrics

**In weekly-report SKILL.md:**
1. Add custom metrics to "Extract and synthesize" list
2. Update "Build Progress" section template
3. Add new sections to output format

**In CLAUDE.md:**
1. Document new metrics in "Build Report Structure"
2. Update "Hardware Build Phase Context" with definitions
3. Add to "Skills vs Manual Reporting" comparison

## 🔄 Maintaining Consistency

**When updating the template:**
1. Update CLAUDE.md first (source of truth)
2. Update SKILL.md files to match
3. Update templates in Resources/Templates/
4. Update README.md if structure changes
5. Test all skills after changes

**Version control:**
```bash
git commit -m "feat: add custom metric tracking

- Added [metric] to daily report template
- Updated weekly-report skill to extract [metric]
- Documented in CLAUDE.md"
```

## 📊 Example: Template → Phoenix Conversion

**Before (this template):**
- Vault: `hardware-npi-template`
- Program: "[PROGRAM]"
- Build: "[Phase]"
- Plugin: `hardware-npi-automation`
- Skills: `/hub:weekly-report`

**After (Phoenix):**
- Vault: `phoenix-tracker` (renamed)
- Program: "Phoenix"
- Build: "Proto"
- Plugin: `phoenix-automation`
- Skills: `/phoenix:weekly-report`

**Commands run:**
```bash
# Clone and rename
git clone <url> phoenix-tracker
cd phoenix-tracker

# Update CLAUDE.md
sed -i '' 's/[PROGRAM]/Phoenix/g' CLAUDE.md
sed -i '' 's/hardware-npi-template/phoenix-tracker/g' CLAUDE.md
sed -i '' 's/k1:/phoenix:/g' CLAUDE.md

# Update plugin

# Edit plugin.json and SKILL.md files manually

# Initialize git
rm -rf .git
git init
git add .
git commit -m "Initial commit: Phoenix vault"
```

## 🎓 Tips for Teams

**Rolling out to teams:**
1. Create a "getting started" video walkthrough
2. Provide filled-in example reports
3. Run a training session on using skills
4. Create a Slack channel for questions
5. Designate a vault "champion" for each team

**Common customizations by team:**
- **Software teams**: Add sprint tracking, feature flags
- **Hardware teams**: Add more detailed yield metrics
- **Manufacturing teams**: Add line efficiency, rework tracking
- **Quality teams**: Add test coverage, defect density

## 🆘 Troubleshooting

**Skills not appearing:**
- Restart Claude Code
- Check plugin.json syntax
- Verify skill names match pattern `yourprogram:skill-name`
- Check SKILL.md frontmatter formatting

**Paths not working:**
- Use absolute paths in SKILL.md files
- Verify vault location with `pwd`
- Check for typos in directory names

**Reports generating incorrectly:**
- Verify daily report naming matches pattern
- Check SKILL.md template format
- Ensure daily reports follow standard structure

## 📚 Resources

- **Claude Code Docs**: https://claude.ai/code
- **Obsidian Help**: https://help.obsidian.md/

---

**Need help?** Open an issue or contact the template maintainer.
