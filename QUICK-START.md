# Quick Start Guide

Get up and running with the Hardware NPI Tracking Template in 30 minutes.

## ⚡ 5-Minute Setup

### 1. Clone the Repository

```bash
git clone https://github.com/justinheckman-sudo/hardware-npi-template.git my-program-vault
cd my-program-vault
```

- Update `my-program-vault` to your desired name
### 2. Install Requirements

- **Obsidian**: https://obsidian.md/ (Download and install)
- **Claude Code**: [go/claudecode](https://dev-guides.sqprod.co/docs/tools/claude-code/getting-started) (Homebrew install)

### 3. Open in Obsidian

1. Launch Obsidian
2. Click "Open folder as vault"
3. Select `my-program-vault` directory
4. Vault opens with complete structure

### 4. Install Claude Code Plugin

Run the installer script from the vault root:
```bash
./install.sh
```

The script will:
- Install the Claude Code plugin to `~/.claude/plugins/local/`
- Install command files to `~/.claude/commands/hub/` (what makes skills visible)
- Optionally customize the vault for your program name and command prefix

Then:
- **Restart Claude Code** (required for skills to load)
- Test with `/hub:help` to confirm all commands are available

## 🚀 15-Minute Customization

### Customize for Your Program

Prompt Claude Code with specific customization instructions:

```
Customize this hardware NPI template for my program. Please ask me for:
1. Program name (replaces "K1" throughout)
2. Vault directory name (replaces "hardware-npi-template")
3. Build phase (replaces "Proto" or keep as-is)
4. Plugin command prefix (keep /hub: or customize to /myprogram:)

Then:
- Update all markdown files with my program details
- Update vault path references in CLAUDE.md and skill files
- Rename automation plugin directory if I want a custom name
- Update plugin.json with my program name and description
- Update SKILL.md files with correct paths and naming
- Verify everything is configured correctly
```

**What to expect:**
- Claude Code will ask you 4 questions
- It will show you what changes it's making
- It will verify the configuration at the end
- **Time:** ~5-10 minutes (interactive)

**Need more control?** See `TEMPLATE-CUSTOMIZATION.md` for detailed manual customization steps.

## 📦 Add Your Project Context (10-20 minutes)

Before creating new documents, populate the vault with existing project documentation. This provides the foundation for meaningful daily reports and automated synthesis.

### Why Add Context First?

Most hardware programs have existing documentation scattered across:
- Google Drive (build reports, one-pagers, design docs)
- Confluence (specifications, meeting notes)
- Slack (decisions, issue discussions)
- Email (vendor communications, status updates)
- JIRA (issue tracking, test results)

**Centralizing this context in the vault enables:**
- Automated synthesis across all documents
- Rich backlink networks and knowledge graphs
- Historical context for decision-making
- Team onboarding and knowledge transfer

### Import from Google Drive (Recommended)

If your team uses Google Drive, set up the MCP integration for seamless sync:

1. **See setup guide:** `GOOGLE-DRIVE-MCP-SETUP.md` (15-20 minute one-time setup)

2. **Sync documents:** Once configured, ask Claude Code:
   ```
   Sync documents from Google Drive containing "[YourProgram]" in the filename,
   modified in the last 30 days. Organize by category (build reports, meetings,
   technical notes, decisions) and add proper frontmatter.
   ```

3. **What gets imported:**
   - Build reports → `Builds/[Phase]/Build Reports/`
   - Meeting notes → `Meetings/YYYY-MM/`
   - Technical analysis → `Technical-Notes/`
   - Design docs → `Technical-Notes/`
   - One-pagers → `Technical-Notes/`

**Time:** Initial setup (15-20 min), subsequent syncs (2-5 min)

### Manual Import (Alternative)

If not using Google Drive MCP, manually add key documents:

**Priority 1: Recent Build Status (if available)**
- Copy last 5-10 daily build reports
- Ask Claude Code to convert and organize:
  ```
  I have 5 build status emails from the past 2 weeks. Help me convert them
  to daily build report format and organize in Builds/Proto/Build Reports/
  ```

**Priority 2: Key Decisions & Context**
- Copy recent program decisions (scope, architecture, strategy)
- Place in `Decisions/` with proper naming: `YYYY-MM-DD-Program-Decision-Topic.md`
- Ask Claude Code:
  ```
  Help me create decision documents from these 3 key decisions [paste content]
  ```

**Priority 3: Active Risks**
- Copy current risk register or risk items
- Place in `Risks/` with format: `RISK-XXX-Program-Title.md`

**Priority 4: Recent Meetings**
- Copy last 2-3 core team meeting notes
- Place in `Meetings/YYYY-MM/WXX/`
- Use format: `YYYY-MM-DD-Program-Meeting-Type.md`

**Priority 5: Technical Documentation**
- Key design docs, test results, validation reports
- Place in `Technical-Notes/`
- Use descriptive names with dates

### Organize and Link

Once documents are added, ask Claude Code to help with organization:

```
Review all documents in the vault and:
1. Ensure proper frontmatter (dates, tags, program name)
2. Add wiki-style links between related documents
3. Validate file naming follows conventions
4. Identify any orphaned documents
```

Then validate the knowledge graph:
```
/hub:backlinks
```

### What You Should Have

After adding context, your vault should include:
- [ ] 5-10 historical documents showing program status
- [ ] Key decisions documented
- [ ] Active risks captured
- [ ] Recent meeting notes
- [ ] Technical specs or one-pagers
- [ ] All documents properly named and organized
- [ ] Cross-references and backlinks between related docs

**Time investment:** 10-20 minutes upfront, massive time savings on synthesis

## 📝 First Documents (5 minutes)

### Create Your First Daily Report

Ask Claude Code to help you:

```
Create my first daily build report for today. I need:
- File in Builds/Proto/Build Reports/ with today's date
- Use the daily report template structure
- Help me fill in the key sections based on today's build activities
```

Claude Code will:
- Create the file with proper naming (YYYY-MM-DD-Program-Proto-D1.md)
- Set up all the standard sections
- Guide you through what to include in each section
- Add proper frontmatter and formatting

**Time:** ~5 minutes (interactive)

### Create 2-3 More Daily Reports

Repeat the process for days 2-3. You can also prompt:
```
Create tomorrow's daily build report template
```

**Why 2-3 reports?** This gives you enough data to test the automation skills.

### Generate Your First Weekly Report

Once you have 3+ daily reports, generate a weekly summary:

```
/hub:weekly-report
```

Claude Code will:
- Auto-detect all daily reports for the week
- Synthesize build progress, accomplishments, and issues
- Generate executive-ready weekly summary
- Save to Communication/Weekly-Updates/

**Output:** Complete weekly report in ~5 minutes

### Test Other Automations

Try these commands to see what the template can do:

```
/hub:help                    # List all available commands
/hub:build-summary Proto     # Generate comprehensive build retrospective
/hub:mil Proto               # Extract Manufacturing Issue Log
/hub:backlinks               # Validate vault knowledge graph
```

## ✅ Verification Checklist

Before sharing with your team:

- [ ] Obsidian opens vault successfully
- [ ] Plugin installed: `ls ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json` returns a path
- [ ] Command files installed: `ls ~/.claude/commands/hub/` shows .md files
- [ ] Skills work: `/hub:help` shows available commands in Claude Code
- [ ] Program name updated throughout (if customized)
- [ ] Created at least 3 daily reports
- [ ] Generated first weekly report successfully: `/hub:weekly-report` (or your custom prefix)
- [ ] All READMEs reviewed and make sense for your program
- [ ] Git repository initialized (optional)

## 🎯 Next Steps

### Immediate (First Week)

1. **Create daily reports** - Use template, 5-10 min per day
2. **Generate weekly reports** - Every Friday, 5 minutes
3. **Document decisions** - Use decision template as needed
4. **Track risks** - Use risk template for any identified risks

### Short-term (First Month)

1. **Customize templates** - Adjust to your team's needs
2. **Add team members** - Share vault, train on basics
3. **Establish rhythm** - Daily reports, weekly synth, monthly review
4. **Validate backlinks** - Run `/yourprogram:backlink-validator` weekly

### Long-term (Ongoing)

1. **Generate build summaries** - After each build phase completion
2. **Expand structure** - Add directories as needed (see Vault Expansion Guide in CLAUDE.md)
3. **Capture learnings** - Use technical notes for analysis
4. **Iterate process** - Improve templates based on usage

## 📚 Key Resources

### Essential Reading (30 minutes)

1. **README.md** (5 min) - What this is and why use it
2. **SETUP-GUIDE.md** (15 min) - How automation works
3. **TEMPLATE-CUSTOMIZATION.md** (10 min) - How to customize

### Reference Documentation

- **CLAUDE.md** - Complete instructions (read as needed)
- **GIT-SETUP-GUIDE.md** - Version control setup
- **Directory READMEs** - Usage guide for each directory

### Templates

- `Resources/Templates/daily-build-report-template.md`
- `Resources/Templates/decision-document-template.md`
- `Resources/Templates/risk-document-template.md`

## 🆘 Troubleshooting

**Skills not showing up?**
- Run `./install.sh` again — the most common cause is missing command files in `~/.claude/commands/hub/`
- Verify command files exist: `ls ~/.claude/commands/hub/`
- Verify plugin exists: `ls ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json`
- Check plugin.json is valid JSON: `cat ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json`

**Weekly report not generating?**
- Need at least 2-3 daily reports for the week
- Check daily report naming: `YYYY-MM-DD-Program-Phase-DX.md`
- Ensure you're in the vault directory when running Claude Code

**Customization script failed?**
- See `TEMPLATE-CUSTOMIZATION.md` for manual steps
- Most issues are path-related or syntax in sed commands

**Need help?**
- See `SETUP-GUIDE.md` Troubleshooting section
- Check individual directory READMEs
- Review CLAUDE.md for detailed guidance

## 💡 Tips for Success

1. **Start simple** - Just daily reports for first week
2. **Use templates** - Copy-paste, don't start from scratch
3. **Be consistent** - Same format, same time each day
4. **Link everything** - Use wiki-style links `[[Document Name]]`
5. **Run automation weekly** - See the value early
6. **Iterate based on feedback** - Adjust templates to your needs

## 🎓 Training Your Team

**For new users (30 min):**
1. Show them this Quick Start (5 min)
2. Walk through creating a daily report (10 min)
3. Demo weekly report generation (5 min)
4. Answer questions (10 min)

**For vault champions:**
- Complete customization themselves
- Read full SETUP-GUIDE.md
- Review TEMPLATE-CUSTOMIZATION.md
- Understand all automation skills

## 📊 Success Metrics

After 2 weeks you should see:
- ✅ Daily reports created consistently (5 per week)
- ✅ Weekly reports generated automatically
- ✅ Time savings (2 hours → 5 minutes for weekly reports)
- ✅ Team finding information easily
- ✅ Decisions documented and linked

If not seeing these, review process and adjust.

---

**Questions?** See full documentation in `README.md` and `SETUP-GUIDE.md`

**Ready to start?** Create your first daily report and begin building your knowledge base!
