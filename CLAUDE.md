# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Overview

**Obsidian vault template** for hardware NPI (New Product Introduction) program management and build tracking. This is a documentation vault, not a software project. Files are markdown notes for Obsidian.

**Template repository:** `hardware-npi-template` — clone and customize for your program. See `TEMPLATE-CUSTOMIZATION.md` for the adaptation guide.

## Structure

```
/path/to/your-vault/
├── Builds/[Phase]/
│   ├── Build Reports/          # YYYY-MM-DD-[PROGRAM]-[Phase]-DX.md daily reports
│   ├── Weekly Reports/         # Generated weekly summaries
│   └── [Phase]-Build-Summary.md
├── Communication/
│   ├── Daily-Updates/YYYY-MM/
│   └── Weekly-Updates/YYYY-MM/WXX/
├── Decisions/                  # ✅ Decided/ subfolder
├── Meetings/YYYY-MM/WXX/
├── Quality/
│   ├── MIL/                    # Manufacturing Issue Log
│   └── Changes/
├── Technical-Notes/
├── Risks/                      # ✅ Resolved/ subfolder
├── Resources/
│   └── Templates/
└── Archive/
```

## File Naming Conventions

| Document type | Format | Location |
|---|---|---|
| Daily Build Reports | `YYYY-MM-DD-[PROGRAM]-[Phase]-DX.md` | `Builds/[Phase]/Build Reports/` |
| Weekly Reports | `YYYY-MM-DD-[PROGRAM]-Proto-Weekly.md` | `Communication/Weekly-Updates/YYYY-MM/WXX/` |
| Weekly Briefing | `YYYY-MM-DD-Weekly-Prep-Briefing.md` | `Communication/Weekly-Updates/YYYY-MM/WXX/` |
| Core Team Agenda | `YYYY-MM-DD-[PROGRAM]-Core-Team-Agenda.md` | `Meetings/YYYY-MM/WXX/` |
| Meeting Notes | `YYYY-MM-DD-[PROGRAM]-Meeting-Topic.md` | `Meetings/YYYY-MM/WXX/` |
| Decisions | `YYYY-MM-DD-[PROGRAM]-Decision-Topic.md` | `Decisions/` |
| MIL Documents | `[Phase]-Manufacturing-Issue-Log.md` | `Quality/MIL/` |
| Daily Updates | `Daily_Vault_Update_YYYY-MM-DD.md` | `Communication/Daily-Updates/YYYY-MM/` |

**Always use YYYY-MM-DD date format.**

## Claude Code Skills (`~/.claude/plugins/local/hardware-npi-automation/skills/`)

Invoke with `/hub:<name>`. **Prefer skills over manual drafting for executive/high-stakes documents.**

| Skill | Command | Output location |
|---|---|---|
| **Readiness Assessment** ⭐ | `/hub:readiness <phase> [prev]` | `Builds/{Phase}/` |
| Weekly Report | `/hub:weekly-report [date]` | `Communication/Weekly-Updates/YYYY-MM/WXX/` |
| Core Team Agenda | `/hub:agenda [date]` | `Meetings/YYYY-MM/WXX/` |
| Weekly Briefing | `/hub:briefing [date]` | `Communication/Weekly-Updates/YYYY-MM/WXX/` |
| MIL Generator | `/hub:mil <phase>` | `Quality/MIL/` |
| Build Summary | `/hub:build-summary <phase>` | `Builds/{Phase}/` |
| Build Comparator | `/hub:compare <b1> <b2>` | Vault root |
| Master MIL | `/hub:master-mil` | `Quality/MIL/` |
| Backlink Validator | `/hub:backlinks` | Vault root report |
| Cross-Document Linker | `/hub:cross-link [scope]` | In-place edits |
| Session Wrap-Up | `/hub:wrap-up` | Checklist |
| Daily Update | `/hub:daily-update` | `Communication/Daily-Updates/YYYY-MM/` |
| Documentation Currency | `/hub:doc-currency` | Report |
| Resolution Metrics | `/hub:resolution-metrics [phase]` | Vault root report |
| Drive Sync | `/hub:sync` | Vault sync |

**When to use skills:** Readiness assessments, weekly reports, agendas, MIL generation, executive reviews (Opus, deep synthesis, 5-10 min, zero placeholders).
**When to draft manually:** Quick daily build reports, simple status notes, speed matters.

## Obsidian Conventions

- **Wiki links:** `[[Document-Name]]` (no `.md` extension)
- **Frontmatter:** YAML metadata (program, build_phase, tags, dates)
- **Backlinks:** All documents should link to related docs. Maintain rich backlink networks.

## Cross-Referencing

- Build reports: `[[2026-02-02-[PROGRAM]-Proto-D1]]`
- Decisions: `[[2026-02-01-[PROGRAM]-ATE-Fixture-Decision]]`
- Issues: `[EE-XXXX](https://your-jira-instance/browse/EE-XXXX)`
- All documents should link to related docs to create a knowledge graph

## Content Standards

### Never fabricate

**NEVER invent status, metrics, yields, or events without source documentation.** If data is unavailable, use `[NEED UPDATE]` or `[TBD]`.

```markdown
✅ SMT progress: [UPDATE LIVE]
✅ Expected FATP start: [NEED UPDATE from MTE team]
❌ Team completed SMT with 98% yield ahead of schedule.  ← fabricated
```

### Executive communication

- No personal callouts in executive summaries ("Justin is OOO"). DRI assignments in action items are fine.
- Use purpose-driven language grounded in documented decisions — not narrative invention:
  - ✅ "Proto build is intentionally scoped to validate board bring-up and test station readiness..."
  - ❌ "Days 1-2 focused on SMT start and early unit validation." (no source doc)

### Decision documentation

Always use `[[wikilinks]]` for decisions. Include Owner/DRI, Date, Impact, and link.

```markdown
**ATE Fixture Approach: WBF Fixture** - [[2026-02-01-[PROGRAM]-ATE-Fixture-Decision]]
- **Decision:** Use WBF fixture for Proto main build testing (ETA WMY 2/5)
- **Owner:** Test Engineering Team
- **Date:** 2026-02-01 | **Impact:** Full test coverage by Day 7
```

## Live Document Patterns

Agendas use `[UPDATE LIVE]`, `[NEED UPDATE from X team]`, `[NEED CLARITY]` for real-time fill-ins. Pre-populate with historical context, documented decisions, named DRIs, and supporting doc links — leave only dynamic status as placeholders.

```markdown
### Build Status
- **Timeline**: MIH 2/1, SMT input 2/2
- SMT progress: [UPDATE LIVE]
- FATP status: [NEED UPDATE from team]
```

## NPI Build Phases & Terminology

**Phases:** Proto (design validation) → EVT → DVT → PVT → MP

**Key terms:** SMT (board assembly), FATP (final assembly/test/pack), ATE (Automated Test Equipment), MIL (Manufacturing Issue Log), FAI (First Article Inspection), MLB (Main Logic Board), SPE (Secure Processing Element), BFT (Board Functional Test), DL (Download/firmware station), MIH (Material In House), DRI (Directly Responsible Individual), CTB (Clear To Build)

**Status indicators:** 🟢 On track · 🟡 Watching · 🔴 Critical blocker

## Document Templates

- **Build Reporting:** `Resources/Templates/` — daily build status (exec summary, issues 🔴🟡✅, SMT/FATP yields, next 24-48 hours)
- **Weekly Report:** Weekly executive report, published Friday EOD. For high-stakes reports, use `/hub:weekly-report` instead.

## Google Drive Integration

Claude Code can sync program documents from Google Drive via the Google Drive MCP server. See `GOOGLE-DRIVE-MCP-SETUP.md` for setup. Use `/hub:sync` to pull latest documents.
