# Quick Start Guide

Get up and running with the Hardware NPI Tracking Template in 30 minutes.

## ⚡ 5-Minute Setup

### 1. Clone the Repository

```bash
git clone <repository-url> my-program-vault
cd my-program-vault
```

### 2. Install Requirements

- **Obsidian**: https://obsidian.md/ (Download and install)
- **Claude Code**: https://claude.ai/code (Install CLI)

### 3. Open in Obsidian

1. Launch Obsidian
2. Click "Open folder as vault"
3. Select `my-program-vault` directory
4. Vault opens with complete structure

### 4. Verify Claude Code Plugin

The automation plugin needs to be copied to Claude's plugin directory:

```bash
# Copy the plugin to Claude Code's plugin directory
cp -r .claude-plugin-template ~/.claude/plugins/local/k1-automation

# Restart Claude Code
# (Exit and restart the CLI)
```

**Note:** The plugin is pre-configured as `k1-automation`. You'll rename it when customizing.

## 🚀 15-Minute Customization

### Option A: Use as K1 (No Changes Needed)

If you're actually tracking a K1 program:
1. Start creating daily reports in `Builds/Proto/Build Reports/`
2. Use templates from `Resources/Templates/`
3. Generate weekly reports: `/k1:weekly-report`

**Done!** Skip to "First Documents" section below.

### Option B: Customize for Your Program

If you're adapting for a different program:

```bash
# 1. Update program name throughout
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' 's/K1/YourProgram/g' {} +

# 2. Update vault path references
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' 's/k1-kiosk/your-vault-name/g' {} +

# 3. Update skill names
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' 's/k1:/yourprogram:/g' {} +

# 4. Rename automation plugin
mv ~/.claude/plugins/local/k1-automation ~/.claude/plugins/local/yourprogram-automation

# 5. Update plugin.json
cd ~/.claude/plugins/local/yourprogram-automation
# Edit .claude-plugin/plugin.json - change "name" to "yourprogram-automation"

# 6. Update SKILL.md files
# Edit skills/*/SKILL.md - change "name:" to "yourprogram:skill-name"

# 7. Restart Claude Code
```

**Time:** ~15 minutes for full customization

**Detailed guide:** See `TEMPLATE-CUSTOMIZATION.md` for step-by-step instructions.

## 📝 First Documents (10 minutes)

### Create Your First Daily Report

```bash
# 1. Copy template
cp Resources/Templates/daily-build-report-template.md \
   "Builds/Proto/Build Reports/2026-02-16-YourProgram-Proto-D1.md"

# 2. Open in Obsidian and fill in:
#    - Executive Summary
#    - Build Status (SMT/FATP progress)
#    - Top Accomplishments
#    - Active Issues
#    - Next 24-48 Hours

# 3. Save and link to any Jira issues or Slack threads
```

### Create 2-3 More Daily Reports

Repeat the above for days 2-3 to have enough data for automation.

### Generate Your First Weekly Report

```bash
# In Claude Code (from your vault directory)
cd /path/to/your-vault
claude

# Run the skill
/yourprogram:weekly-report 2026-02-16
```

**Output:** `Builds/Proto/Weekly Reports/2026-02-16-YourProgram-Proto-Weekly.md`

**Time to generate:** ~5 minutes

## ✅ Verification Checklist

Before sharing with your team:

- [ ] Obsidian opens vault successfully
- [ ] Claude Code plugin installed and renamed
- [ ] Program name updated throughout (if customized)
- [ ] Created at least 3 daily reports
- [ ] Generated first weekly report successfully
- [ ] Skills show up in Claude Code (`/yourprogram:` autocompletes)
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
- Restart Claude Code (most common fix)
- Check plugin location: `~/.claude/plugins/local/yourprogram-automation/`
- Verify plugin.json syntax

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
