# Claude Code Plugin Template

This directory contains the automation plugin for the Hardware NPI Tracking Template.

## Installation

After cloning the repository, copy this plugin to Claude Code's plugin directory:

```bash
# From the repository root
cp -r .claude-plugin-template ~/.claude/plugins/local/hardware-npi-automation

# Restart Claude Code
```

## Customization

If you're adapting this template for your program, you'll need to:

1. **Rename the plugin directory:**
   ```bash
   mv ~/.claude/plugins/local/hardware-npi-automation \
      ~/.claude/plugins/local/yourprogram-automation
   ```

2. **Update plugin.json:**
   ```bash
   # Edit ~/.claude/plugins/local/yourprogram-automation/.claude-plugin/plugin.json
   # Change "name" to "yourprogram-automation"
   # Update "description" with your program name
   ```

3. **Update each SKILL.md:**
   - Change `name:` from `hub:skill-name` to `yourprogram:skill-name`
   - Update vault paths from `/Users/jheckman/hardware-npi-template/` to your vault path
   - Update file naming patterns from `[PROGRAM]-Proto` to your program-phase

4. **Restart Claude Code**

## Plugin Contents

```
hardware-npi-automation/
├── .claude-plugin/
│   └── plugin.json         # Plugin metadata
├── README.md               # This file
└── skills/
    ├── hub/
    │   └── SKILL.md        # Unified command interface
    ├── weekly-report/
    │   └── SKILL.md        # Weekly report generator
    ├── build-summary/
    │   └── SKILL.md        # Build phase retrospective
    ├── mil-generator/
    │   └── SKILL.md        # Manufacturing Issue Log
    ├── readiness-assessment/
    │   └── SKILL.md        # Build gate readiness
    └── backlink-validator/
        └── SKILL.md        # Backlink validator
```

## Available Skills

### `/hub:weekly-report [date]`
Generate comprehensive weekly build status reports by synthesizing daily reports.

**Time:** ~5 minutes
**Output:** `Builds/Proto/Weekly Reports/YYYY-MM-DD-[PROGRAM]-Proto-Weekly.md`

### `/hub:build-summary <phase>`
Generate comprehensive build phase retrospective with 15 sections.

**Time:** ~10-20 minutes
**Output:** `Builds/[Phase]/[Phase]-Build-Summary.md`

### `/hub:backlink-validator`
Validate wiki-style links and identify broken references.

**Time:** ~2 minutes
**Output:** `Backlink-Validation-Report-YYYY-MM-DD.md`

## Troubleshooting

**Skills not showing up?**
1. Restart Claude Code (most common fix)
2. Check plugin location: `~/.claude/plugins/local/hardware-npi-automation/`
3. Verify plugin.json is valid JSON
4. Check SKILL.md files have proper frontmatter

**Skills renamed but not working?**
1. Verify all SKILL.md files updated with new names
2. Check plugin.json name matches directory name
3. Restart Claude Code after changes

## Documentation

Complete documentation for each skill is in:
- `CLAUDE.md` - Full instructions embedded
- `SETUP-GUIDE.md` - Usage and troubleshooting
- `TEMPLATE-CUSTOMIZATION.md` - Customization steps

## Support

See the main repository README and documentation for support resources.
