# Claude Code Skill Template

This document provides a template for creating new Claude Code skills that can be cloned and adapted for any NPI program.

## What is a Claude Code Skill?

A **Claude Code skill** is a custom slash command that uses Claude's Task tool with Opus model for high-quality document synthesis and automation. Skills are more powerful than bash scripts because they:

- Use Opus for deep strategic synthesis
- Automatically scan vault for relevant context
- Generate executive-ready documents with zero placeholders
- Provide comprehensive analysis across multiple data sources

## Skill Plugin Structure

```
~/.claude/plugins/local/[project]-automation/
├── .claude-plugin/
│   └── plugin.json              # Plugin metadata and version
└── skills/
    ├── hub-weekly-report/
    │   └── SKILL.md
    ├── hub-build-summary/
    │   └── SKILL.md
    ├── hub-mil/
    │   └── SKILL.md
    ├── hub-readiness/
    │   └── SKILL.md
    ├── hub-compare/
    │   └── SKILL.md
    ├── hub-master-mil/
    │   └── SKILL.md
    ├── hub-agenda/
    │   └── SKILL.md
    ├── hub-briefing/
    │   └── SKILL.md
    └── hub-backlinks/
        └── SKILL.md
```

## Plugin Configuration (plugin.json)

```json
{
  "name": "[project]-automation",
  "description": "[Project] NPI program automation skills with unified command interface for build quality analysis, reporting, and validation",
  "author": {
    "name": "Your Name",
    "email": "your.email@company.com"
  },
  "version": "1.0.0"
}
```

**Customization:**
- Replace `[project]` with your program name (e.g., `k1`, `w3`, `project-x`)
- Update author information
- Start with version `1.0.0`

## SKILL.md Template

```markdown
---
name: hub-[skill-name]
description: This skill should be used when the user asks to "[action]", "[trigger phrase]", or mentions "[keywords]"
version: 1.0.0
---

# [Skill Display Name]

[One sentence description of what this skill does]

## When to Use This Skill

Use this skill when the user:
- [Trigger condition 1]
- [Trigger condition 2]
- [Trigger condition 3]

## Your Mission

[Detailed description of what you need to accomplish]

## Data Sources to Read and Synthesize

### 1. [Primary Source]
**Location:** `/Users/[username]/[vault]/[path]/`

**Extract:**
- [Data point 1]
- [Data point 2]

### 2. [Secondary Source]
**Location:** `/Users/[username]/[vault]/[path]/`

**Extract:**
- [Data point 1]

## [Generation/Analysis] Process

### Step 1: [Name]
1. [Action 1]
2. [Action 2]

### Step 2: [Name]
1. [Action 1]
2. [Action 2]

## Output Format

Write the output to: `[Path]/[Filename-Pattern].md`

**Structure:**
```markdown
# [Document Title]

## Section 1
[Content]

## Section 2
[Content]
```

## Key Rules

1. **[Rule Category]**
   - [Specific rule]
   - [Specific rule]

2. **[Rule Category]**
   - [Specific rule]

## Quality Check

Before writing the output:
- [ ] Checklist item 1
- [ ] Checklist item 2
- [ ] Checklist item 3

[Closing statement about importance/quality]
```

## Variable Placeholders to Replace

When cloning this template for a new project, search and replace these variables:

| Variable | Example | Description |
|----------|---------|-------------|
| `[project]` | `k1`, `w3`, `project-x` | Program/project identifier (lowercase, hyphenated) |
| `[PROJECT]` | `K1`, `W3`, `Project-X` | Program/project name (properly capitalized) |
| `[username]` | `jheckman` | Unix username for vault path |
| `[vault]` | `hardware-npi-template`, `w3-hw-wallet` | Vault directory name |
| `[skill-name]` | `weekly-report`, `mil`, `readiness` | Skill identifier (lowercase, hyphenated) |
| `[Skill Display Name]` | `Weekly Report Generator`, `MIL Generator` | Human-readable skill name |
| `[action]` | `generate weekly report`, `create MIL` | Primary action verb phrase |
| `[trigger phrase]` | `weekly status`, `issue tracking` | Alternative phrases that trigger skill |
| `[keywords]` | `weekly`, `MIL`, `readiness` | Keywords in user messages |

## Common Skill Patterns

### 1. Report Generation Skills

**Purpose:** Synthesize data from multiple sources into structured report
**Examples:** `hub-weekly-report`, `hub-build-summary`

**Key Elements:**
- Data sources (daily reports, decisions, meetings, risks)
- Report structure (sections and subsections)
- Synthesis rules (how to aggregate and summarize)
- Output format (markdown with specific sections)

### 2. Issue Tracking Skills

**Purpose:** Extract and organize issues from various sources
**Examples:** `hub-mil`, `hub-master-mil`

**Key Elements:**
- Issue extraction rules (from reports, logs, etc.)
- Deduplication logic (how to identify same issue)
- Categorization (severity, component, status)
- Output formats (markdown + CSV)

### 3. Assessment Skills

**Purpose:** Evaluate readiness or quality using data-driven criteria
**Examples:** `hub-readiness`, `hub-compare`

**Key Elements:**
- Data gathering (build summaries, MIL, risks, decisions)
- Criteria checklist (GO/NO-GO conditions)
- Metrics calculation (yields, resolution rates, trends)
- Recommendation generation (actionable next steps)

### 4. Planning Skills

**Purpose:** Generate planning documents for meetings or weeks
**Examples:** `hub-agenda`, `hub-briefing`

**Key Elements:**
- Context gathering (recent activity, upcoming events)
- Structured format (standard sections)
- Action-oriented content (decisions needed, follow-ups)
- Forward-looking guidance (what to prepare, what to watch)

### 5. Validation Skills

**Purpose:** Check vault integrity or data quality
**Examples:** `hub-backlinks`

**Key Elements:**
- Scanning rules (what to check)
- Validation criteria (what's correct/incorrect)
- Error reporting (clear issue identification)
- Optional auto-fix capability

## Naming Conventions

### Skill Naming
- **Pattern:** `hub-[function]`
- **Examples:** `hub-weekly-report`, `hub-mil`, `hub-readiness`
- **Guidelines:**
  - Use lowercase, hyphenated names
  - Keep names short (1-3 words)
  - Use action-oriented names when possible
  - Prefer `hub-` prefix for consistency

### Output File Naming
- **Date prefix:** `YYYY-MM-DD-` for chronological files
- **Program prefix:** `[PROJECT]-` for program-specific files
- **Type suffix:** `-Report.md`, `-Summary.md`, `-Assessment.md`
- **Examples:**
  - `2026-02-17-K1-NPI-Weekly.md`
  - `Proto-Build-Summary.md`
  - `DVT-Readiness-Assessment-2026-02-17.md`

## Vault Path Adaptation

When adapting skills for a new vault structure, update these common paths:

### K1 Structure (Simple)
```
/Users/[username]/hardware-npi-template/
├── Builds/[Phase]/
│   ├── Build Reports/
│   └── Weekly Reports/
├── Quality/MIL/
├── Risks/
├── Decisions/
├── Meetings/YYYY-MM/WXX/
└── Technical-Notes/
```

### W3 Structure (Comprehensive)
```
/Users/[username]/w3-hw-wallet/
├── Programs/W3-Hardware-Wallet/
│   ├── Builds/[Phase]/
│   ├── Quality/MIL/
│   └── Risks/
├── Communication/
│   ├── Daily-Updates/
│   └── Weekly-Updates/YYYY-MM/WXX/
├── Decisions/
└── Meetings/YYYY-MM/WXX/
```

### Your Custom Structure
Document your vault paths here when creating a new project.

## Step-by-Step Cloning Guide

### 1. Create Plugin Directory
```bash
mkdir -p ~/.claude/plugins/local/[project]-automation/.claude-plugin
mkdir -p ~/.claude/plugins/local/[project]-automation/skills
```

### 2. Copy plugin.json
```bash
cp ~/.claude/plugins/local/hardware-npi-automation/.claude-plugin/plugin.json \
   ~/.claude/plugins/local/[project]-automation/.claude-plugin/plugin.json
```

### 3. Update plugin.json
- Replace `k1` with your project name
- Update description
- Set version to `1.0.0`

### 4. Copy Skills
```bash
# Copy all skills at once
cp -r ~/.claude/plugins/local/hardware-npi-automation/skills/* \
      ~/.claude/plugins/local/[project]-automation/skills/
```

### 5. Search and Replace in All Skills
For each SKILL.md file:
```bash
# Replace vault paths
find ~/.claude/plugins/local/[project]-automation/skills -name "SKILL.md" -exec \
  sed -i '' 's|/Users/jheckman/hardware-npi-template|/Users/[username]/[vault]|g' {} \;

# Replace program name
find ~/.claude/plugins/local/[project]-automation/skills -name "SKILL.md" -exec \
  sed -i '' 's/K1/[PROJECT]/g' {} \;
```

### 6. Restart Claude Code
```bash
# Claude Code needs to be restarted to recognize new plugins
```

### 7. Test Skills
Test each skill to verify it works with your vault structure:
```
/hub-weekly-report
/hub-build-summary Proto
/hub-mil Proto
```

## Best Practices

### Writing SKILL.md Files
1. **Be explicit about data sources**: Provide exact paths and file patterns
2. **Use clear section headers**: Make it easy to scan and understand
3. **Provide examples**: Show command usage and expected outputs
4. **Include validation checklists**: Help ensure quality before output
5. **Document error handling**: What happens when data is missing

### Designing Skills
1. **Single responsibility**: Each skill should do one thing well
2. **Data-driven**: Skills should extract real data, not fabricate status
3. **Executable-ready**: Output should be usable with minimal manual editing
4. **Context-aware**: Use Opus to synthesize across multiple sources
5. **Scalable**: Design skills that work for Proto through PVT builds

### Testing Skills
1. **Start with simple cases**: Test with minimal data first
2. **Verify output format**: Check all sections are populated
3. **Validate data accuracy**: Compare to source documents
4. **Test edge cases**: Missing files, malformed data, empty results
5. **Check performance**: Opus skills take 5-10 minutes, expect that

## Common Issues & Solutions

### Issue: Skill not recognized
**Solution:** Restart Claude Code after creating/modifying skills

### Issue: Wrong vault paths
**Solution:** Search SKILL.md files for hardcoded paths and update them

### Issue: Skill generates placeholders like `[NEED UPDATE]`
**Solution:** Check that data sources exist and are accessible

### Issue: Skill takes too long
**Solution:** Opus skills are slower (5-10 min) - this is normal for deep synthesis

### Issue: Output format is inconsistent
**Solution:** Provide more explicit format examples in SKILL.md

## Version History

**1.0.0** - Initial template based on K1 and W3 automation patterns
- 9 core skills (weekly report, build summary, MIL, readiness, compare, master MIL, agenda, briefing, backlinks)
- Hub-based naming convention
- Opus-powered synthesis approach
- Cross-program cloning support

## References

**Example Implementations:**
- K1 Automation: `~/.claude/plugins/local/hardware-npi-automation/`
- W3 Automation: `~/.claude/plugins/local/hub/`

**Documentation:**
- K1 CLAUDE.md: `/Users/jheckman/hardware-npi-template/CLAUDE.md`
- W3 CLAUDE.md: `/Users/jheckman/w3-hw-wallet/CLAUDE.md`

## Contributing

When you create new skills or improve existing ones:
1. Document them in this template
2. Share patterns that work well
3. Update the version history
4. Add to best practices section

---

**Version:** 1.0.0
**Created:** 2026-02-17
**Maintained by:** Justin Heckman
