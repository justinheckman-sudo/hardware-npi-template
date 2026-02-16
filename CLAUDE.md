# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an **Obsidian vault template** for hardware NPI (New Product Introduction) program management and build tracking. While currently configured for K1 hardware builds, this vault serves as a **reusable template** that teams can clone and customize for their own programs.

**Key characteristics:**
- **Documentation vault**, not a software development project
- **Complete template structure** with directories, templates, and automation
- **Production-ready** based on real NPI program management workflows
- **Easily customizable** - see `TEMPLATE-CUSTOMIZATION.md` for adaptation guide
- **Git-ready** for distribution and version control

**Intended use:**
1. **As-is** for K1 program tracking
2. **As a template** for other hardware programs (clone and customize)
3. **As a reference** for NPI documentation best practices

## Structure

```
/Users/jheckman/k1-kiosk/
├── .obsidian/              # Obsidian configuration (workspace, plugins, etc.)
├── Builds/                 # Build phase documentation
│   └── Proto/             # Proto build phase (add EVT, DVT, PVT as needed)
│       ├── Build Reports/ # Daily build reports (YYYY-MM-DD-K1-Proto-DX.md)
│       ├── Weekly Reports/  # Weekly summaries (generated)
│       └── Proto-Build-Summary.md  # Complete overview (generated after build)
├── Communication/          # Stakeholder communications
│   ├── Daily-Updates/     # Daily vault activity summaries
│   │   └── YYYY-MM/      # Organized by month
│   └── Weekly-Updates/    # Weekly program status reports
│       └── YYYY-MM/      # Organized by month
│           └── WXX/      # Organized by week number
├── Decisions/              # Strategic and tactical decisions
│   └── ✅ Decided/        # Finalized decisions (archive)
├── Meetings/               # Meeting notes and agendas
│   └── YYYY-MM/          # Organized by month
│       └── WXX/          # Organized by week number
├── Quality/                # Quality tracking
│   ├── MIL/              # Manufacturing Issue Log
│   └── Changes/          # Change log tracking
├── Technical-Notes/        # Analysis, validation, and technical documentation
├── Risks/                  # Risk register
│   └── ✅ Resolved/       # Resolved risks (archive)
├── Resources/              # Templates and reference documentation
│   ├── Templates/        # Document templates (daily reports, decisions, risks, etc.)
│   └── Automations/      # Automation documentation and quick references
├── Archive/                # Archived content
├── CLAUDE.md              # This file - Claude Code project instructions
├── README.md              # Project overview and quick start guide
├── SETUP-GUIDE.md         # Claude Code automation setup
├── GIT-SETUP-GUIDE.md     # Git configuration guide
├── TEMPLATE-CUSTOMIZATION.md  # How to adapt this template for your program
├── .gitignore             # Git ignore rules for Obsidian vaults
└── .gitattributes         # Git attributes for text files
```

**Note:** This is a **complete template structure**. All directories are created and documented with README files. Teams can use this as-is or customize for their specific needs.

## Obsidian-Specific Conventions

**Wiki-style links:** Files reference each other using `[[filename]]` syntax (without `.md` extension).

**Frontmatter:** Some files may use YAML frontmatter for metadata (tags, creation dates, etc.).

**Folder organization:** Projects/topics are organized into subdirectories. Documents use chronological organization.

**Backlinks:** Rich backlink networks create knowledge graphs. Documents should reference related docs to maintain connectivity.

## File Naming Conventions

**Daily Build Reports**: `YYYY-MM-DD-K1-Proto-DX.md`
- Example: `2026-02-02-K1-Proto-D1.md` (Day 1)
- Stored in: `Builds/Proto/Build Reports/`

**Date Format**: Always use **YYYY-MM-DD** for sortability and chronological organization.

## Build Report Structure

Daily build reports follow this standard format:

### Required Sections
1. **Executive Summary** (📊) - High-level overview of the day
2. **Build Status** (📍) - Current SMT/FATP progress
3. **Top Accomplishments** (✅) - Key wins for the day
4. **Active Issues & Risks** (⚠️) - Current concerns
5. **Critical Issues** (🔴) - Build blockers requiring immediate attention
6. **Watching** (🟡) - Potential issues being monitored
7. **Resolved Today** (✅) - Issues closed today
8. **Next 24-48 Hours** (🎯) - Upcoming priorities

### Status Indicators
- 🔴 **Red/Critical**: Build blockers, requires immediate attention
- 🟡 **Yellow/Watching**: Potential impact, being monitored
- ✅ **Green/Resolved**: Closed/completed items

## Hardware Build Phase Context

The vault tracks hardware builds through NPI (New Product Introduction) phases:

- **Proto** (Prototype): Initial prototype builds for design validation and early testing

**Build Terminology**:
- **SMT**: Surface Mount Technology (board assembly line)
- **FATP**: Final Assembly, Test, and Pack (full product assembly line)
- **FAI**: First Article Inspection (quality check on first units)
- **MLB**: Main Logic Board
- **SPE**: Secure Processing Element (security board)
- **ATE**: Automated Test Equipment
- **DL**: Download (firmware programming station)
- **BFT**: Board Functional Test
- **PD**: Production Design
- **WMY**: Wistron Malaysia
- **GSM**: Global Supply Management
- **ETD**: Estimated Time of Departure
- **ETA**: Estimated Time of Arrival

**Yield Metrics**:
- **SMT Yield**: Board-level assembly success rate
- **FATP Yield**: Final assembly and full product testing yield

**Build Status Indicators**:
- 🟢 Green: On track, no concerns
- 🟡 Yellow: Watching closely, minor concerns or conditional items
- 🔴 Red: Critical blocker, requires immediate attention

## Content Standards & Integrity

### Factual Content Only

**NEVER fabricate status updates, metrics, or events without source documentation**
- If information is unavailable, explicitly note it as `[NEED UPDATE]` or `[TBD]`
- Cost figures, dates, and metrics must be sourced from existing documents
- Build status and progress require real-time data, not assumptions

**Example of correct handling**:
```markdown
- SMT progress: [UPDATE LIVE]
- Expected FATP start: [NEED UPDATE from MTE team]
```

### Executive Communication Standards

**No personal callouts in executive summaries**
- Avoid: "Justin is OOO", "Ryan is leading onsite execution"
- Focus on program-level achievements, not individual contributors
- Exception: DRI (Directly Responsible Individual) assignments for actions/decisions are appropriate

**Purpose-driven, forward-looking language**
- Base content on documented decisions and plans
- Avoid fabricating status updates about events without source documentation
- Use language like "Proto build is intentionally scoped to..." rather than "Days 1-2 focused on..."

**Example - Good**:
```markdown
**Proto Build to Validate Design** – Proto build is intentionally scoped to:
- Validate board bring-up and test station readiness
- Complete ATE fixture qualification (DL/BFT coverage)
- Enable early firmware development with functional hardware
```

**Example - Bad (Fabricated)**:
```markdown
**Proto Build Update** – Days 1-2 focused on SMT start and early unit validation.
Team resolved three issues and completed initial testing phase ahead of schedule.
```
(Without source documentation, this fabricates status and progress)

### Decision Documentation

**Reference actual decision documents using [[wikilinks]]**
- Always link to detailed decision documentation when available
- Example: `[[2026-02-01-K1-Proto-Build-Scope]]`

**Document decisions with complete metadata**:
- **Owner/DRI**: Who is responsible
- **Date**: When the decision was made
- **Impact**: What changes as a result
- **Link**: Reference to detailed decision document (if available)

**Example**:
```markdown
1. **ATE Fixture Approach: WBF Fixture for Main Build** - [[2026-02-01-K1-ATE-Fixture-Decision]]
   - **Decision:** Use WBF fixture for Proto main build testing (ETA WMY 2/5)
   - **Owner:** Test Engineering Team
   - **Date:** 2026-02-01
   - **Impact:** Enables full test coverage by Day 7; pre-FAI boards used for bring-up
```

## Cross-Referencing Guidelines

**Wiki Links**: Use `[[Document-Name]]` syntax without `.md` extension

**Referencing Build Reports**: Always link to specific daily reports when discussing events
- Example: `[[2026-02-02-K1-Proto-D1]]`

**Code/File References**: Use `file_path:line_number` format when referencing specific code locations
- Example: "Clients are marked as failed in `connectToServer` function in src/services/process.ts:712"

**Issue References**: Link to Jira/tracking systems with clear identifiers
- Example: "Aura LED cable pinout error ([EE-7235](https://block.atlassian.net/browse/EE-7235))"

**Backlink Importance**: Maintain rich backlink networks - documents should reference related docs to create knowledge graph.

## Live Document Patterns

**Meeting Agendas with Placeholders**:
Meeting agendas and status reports often include `[UPDATE LIVE]` or `[NEED UPDATE]` placeholders for real-time information. These indicate:
- Information to be filled in during the actual meeting/reporting
- Status that changes frequently (build progress, yield, etc.)
- Questions that need team input

**When creating agendas/reports, pre-populate with**:
- Historical context and facts from previous reports
- Clear status indicators and validation gates
- Named owners (DRIs) for each action/decision
- Links to supporting documentation
- Placeholders for live updates: `[UPDATE LIVE]`, `[NEED UPDATE from X team]`, `[NEED CLARITY]`

**Example structure**:
```markdown
### **Proto Build Status**
- **Timeline**: MIH 2/1, SMT input 2/2
- **Current Status**: Day 9 (Monday 2/12)
  - SMT progress: [UPDATE LIVE]
  - Early yield indicators: [UPDATE LIVE]
  - FATP status: [NEED UPDATE from team]
```

## Claude Code Skills

Claude Code skills are custom slash commands that use Claude's Task tool for high-quality document synthesis. Unlike basic automation scripts, skills perform comprehensive vault analysis and strategic synthesis.

**How skills work:**
- Configured as a plugin in `~/.claude/plugins/local/k1-automation/`
- Each skill is a `SKILL.md` markdown file in the skills directory
- Invoked with `/skill-name` command in Claude Code
- Use Opus model for deep synthesis and strategic thinking
- Automatically scan vault for relevant context
- Generate executive-ready documents with zero placeholders

**Plugin structure:**
```
~/.claude/plugins/local/k1-automation/
├── .claude-plugin/
│   └── plugin.json (v1.0.0)
└── skills/
    ├── weekly-report/
    │   └── SKILL.md
    ├── backlink-validator/
    │   └── SKILL.md
    ├── mil-generator/          # Future
    │   └── SKILL.md
    └── build-summary/          # Future
        └── SKILL.md
```

**Note:** You may need to restart Claude Code after creating new skills for them to be recognized.

### Available Skills

| Skill | Command | Purpose |
|-------|---------|---------|
| **Weekly Report** | `/k1:weekly-report [date]` | K1 weekly build status synthesis from daily reports |
| **Build Summary** | `/k1:build-summary <phase>` | Comprehensive build phase retrospective with 15 sections |
| **Backlink Validator** | `/k1:backlink-validator` | Validate vault backlinks and identify orphaned documents |

---

### Weekly Report Skill

**Command:** `/k1:weekly-report [week-ending-date]`

**Purpose:** Generate comprehensive K1 Proto build weekly report using synthesis across daily build reports.

**What it does:**
- Auto-detects all daily reports for the specified week
- Reads complete build status, accomplishments, issues from each day
- Synthesizes build progress (SMT/FATP metrics, yields)
- Aggregates critical issues (🔴), watching items (🟡), resolved items (✅)
- Generates week-over-week trend analysis
- Creates executive-ready weekly summary

**Usage:**
```
/k1:weekly-report 2026-02-07
```
or
```
/k1:weekly-report
```
(auto-detects most recent Friday)

**Output:** `Builds/Proto/Weekly Reports/YYYY-MM-DD-K1-Proto-Weekly.md`

**Data Sources:**
1. **Daily Build Reports** (PRIMARY): `/Users/jheckman/k1-kiosk/Builds/Proto/Build Reports/`
   - Report naming: `YYYY-MM-DD-K1-Proto-DX.md` (where X is day number)
   - Extract: Build progress, accomplishments, critical issues, watching items, resolved issues, material readiness, test station bring-up
2. **Week-over-Week Analysis**: Compare to previous week's report if available

**Report Generation Process:**

**Step 1: Gather Data**
1. Calculate the week date range from the provided date
2. Find all daily reports for that week
3. Read each report completely in chronological order
4. Extract structured data from each report section

**Step 2: Synthesize Content**

- **Executive Summary**: High-level build progress snapshot, major accomplishments, critical issues status, overall build health (🟢🟡🔴)
- **Build Progress**: SMT progress (units completed, yield), FATP progress, test station bring-up status, material readiness
- **Key Accomplishments**: Aggregate and deduplicate accomplishments from all daily reports, highlight major milestones
- **Issues & Risks**: Critical (🔴 build blockers), Watching (🟡 items being monitored), Resolved This Week (✅ issues closed)
- **Next Week Priorities**: Based on "Next 24-48 Hours" sections, critical path items, key deliverables
- **Week-over-Week Trends**: SMT yield improvement, issue resolution rate, material readiness progress

**Step 3: Format Output**
```markdown
# K1 Proto Build - Weekly Report
**Week Ending:** [Date]
**Build Phase:** Proto
**Report Date:** [Today's Date]

---

## 📊 Executive Summary
[High-level summary paragraph]
**Build Health:** [🟢/🟡/🔴]

---

## 📍 Build Progress
### SMT Status
- MLB: [X complete] ([Y%])
- SPE: [X complete] ([Y%])
- Sensor: [X complete] ([Y%])

### FATP Status
- [Status and progress]

### Test Station Bring-Up
- [ATE/DL/BFT progress summary]

---

## ✅ Key Accomplishments
- [Accomplishment 1]
- [Accomplishment 2]

---

## ⚠️ Issues & Risks

### 🔴 Critical (Build Blockers)
- **[Issue Title]** ([Jira Link])
  - **Impact:** [Description]
  - **Mitigation:** [Approach]
  - **Status:** [Current state]

### 🟡 Watching (Potential Impact)
- **[Issue Title]** ([Jira Link])

### ✅ Resolved This Week
- [Resolved issue 1]

---

## 🎯 Next Week Priorities
- [Priority 1]
- [Priority 2]

---

## 📈 Week-over-Week Trends
- [Trend 1: e.g., SMT yield improvement]
- [Trend 2: e.g., Issue resolution rate]

---

## 🔗 Related Documents
- [Link to daily reports]
- [Link to Jira issues]
```

**Important Notes:**
- **Accuracy over speed**: Take time to read and synthesize all daily reports
- **No fabrication**: Only include information explicitly stated in daily reports
- **Clear attribution**: Link to source daily reports and tracking systems
- **Status indicators**: Use 🔴🟡✅ consistently for visual scanning
- **Week-over-week context**: Compare to previous week's report if available

**Validation Checklist:**
- [ ] All daily reports for the week have been read
- [ ] Executive summary accurately reflects the week
- [ ] All critical issues are documented with mitigation plans
- [ ] Build progress metrics are accurate and sourced from daily reports
- [ ] Week-over-week trends are based on data comparison
- [ ] Output file is saved to correct location
- [ ] Report includes links to all source documents

**When to use:** High-stakes weekly updates, executive reviews, program status reporting where depth and accuracy matter.

### Build Summary Skill

**Command:** `/k1:build-summary <build-phase>`

**Purpose:** Generate comprehensive build phase retrospective by synthesizing ALL build documentation into strategic summary.

**What it does:**
- Reads all daily build reports for the phase
- Scans decisions, risks, technical notes from build period
- Aggregates weekly reports
- Synthesizes manufacturing issues (if MIL exists)
- Generates 15-section comprehensive build summary
- Provides GO/NO-GO recommendation for next phase

**Usage:**
```
/k1:build-summary Proto
```
or
```
/k1:build-summary EVT
```

**Output:** `Builds/[Phase]/[Phase]-Build-Summary.md`

**Data Sources:**
1. **Daily Build Reports**: `/Users/jheckman/k1-kiosk/Builds/[Phase]/Build Reports/`
   - ALL reports read chronologically
   - Extract: objectives, metrics, issues, accomplishments, timeline
2. **Weekly Reports**: Synthesized insights if available
3. **Manufacturing Issue Log**: Quality/MIL/ (if exists)
4. **Decisions**: During build period from Decisions/
5. **Risks**: During build period from Risks/
6. **Technical Notes**: Validation results from Technical-Notes/
7. **Meetings**: Key decisions from Meetings/

**15 Comprehensive Sections Generated:**
1. Executive Summary
2. Build Objectives (achievement status)
3. Key Build Metrics (SMT/FATP yields, units, timeline)
4. Final Build Configuration
5. Daily Build Reports Summary (grouped by week)
6. Build Outcomes & Key Learnings
7. Manufacturing Issue Log Analysis
8. Decisions Made During Build
9. Risk Updates
10. Technical Validation Results
11. Weekly Reports (links)
12. Recommendations for Next Build
13. Readiness Assessment for Next Phase
14. Related Documents (all links)
15. Build Statistics

**Strategic Features:**
- **GO/NO-GO Recommendation**: Data-driven readiness assessment
- **Readiness by Domain**: Design, Manufacturing, Quality, Supply Chain, Risk
- **Lessons Learned**: Actionable insights for next phase
- **Process Improvements**: Specific recommendations with rationale
- **Issue Analytics**: Resolution rates, severity distribution, time-to-close
- **Timeline Analysis**: Planned vs actual, key milestones
- **Cross-referencing**: Links to ALL source documents

**Important Notes:**
- **Comprehensive synthesis**: 10-20 minutes to generate (reads ALL documents)
- **No fabrication**: Only includes data from source documents
- **Executive-ready**: Suitable for gate reviews, DMRs, presentations
- **Strategic insights**: Not just data aggregation, tells the build story
- **Actionable**: Clear recommendations with owners and dates

**Validation Checklist:**
- [ ] All daily reports for phase read
- [ ] Timeline accurate (first-to-last day)
- [ ] Metrics extracted from actual reports
- [ ] All 15 sections complete
- [ ] Decisions/risks/technical notes included
- [ ] Recommendations specific with owners/dates
- [ ] GO/NO-GO has clear rationale
- [ ] All source documents linked
- [ ] Output saved to correct location

**When to use:** After build phase completion, before gate reviews, for comprehensive retrospectives, next phase planning, executive presentations.

**When NOT to use:** Build still in progress (use weekly reports), only 1-2 daily reports exist (insufficient data), quick status needed (use weekly report).

### Backlink Validator Skill

**Command:** `/k1:backlink-validator`

**Purpose:** Validate and repair backlinks across the K1 vault to ensure knowledge graph connectivity.

**What it does:**
- Scans all markdown files for wiki-style links (`[[Document Name]]`)
- Validates link targets exist and are accessible
- Identifies broken links and orphaned documents
- Generates comprehensive validation report
- Optionally auto-fixes issues with backup creation

**Usage:**
```
/k1:backlink-validator
```

**Output:** `Backlink-Validation-Report-YYYY-MM-DD.md` (saved to vault root)

**Validation Scope:**

**Documents to Validate:**
- **Daily Build Reports**: `/Users/jheckman/k1-kiosk/Builds/Proto/Build Reports/`
  - Check for links to: Previous/next daily reports, related Jira issues, Slack thread references
- **Weekly Reports** (if they exist): `/Users/jheckman/k1-kiosk/Builds/Proto/Weekly Reports/`
  - Check for links to: Daily reports for that week, related issues and decisions

**Validation Process:**

**Step 1: Scan Vault**
1. Find all markdown files in the vault
2. Read each file to extract wiki-style links: `[[Document Name]]`
3. Build a map of all links and their targets

**Step 2: Validate Links**
For each link found:
1. Check if the target document exists
2. Verify the link uses correct syntax
3. Check if the link target is in the correct location

**Step 3: Identify Issues**
Common backlink issues:
- **Broken links**: Link to non-existent documents
- **Incorrect paths**: Links that don't match actual file locations
- **Missing links**: Documents that should reference each other but don't
- **Orphaned documents**: Files with no incoming or outgoing links

**Step 4: Generate Report**
```markdown
# K1 Backlink Validation Report
**Validation Date:** [Today's Date]
**Vault Path:** /Users/jheckman/k1-kiosk

---

## 📊 Summary
- **Total Documents Scanned:** [N]
- **Total Links Found:** [N]
- **Broken Links:** [N]
- **Orphaned Documents:** [N]
- **Health Status:** [🟢/🟡/🔴]

---

## 🔴 Broken Links
| Document | Broken Link | Issue |
|----------|------------|-------|
| [Doc Name] | [[Target]] | Target file not found |

---

## ⚠️ Orphaned Documents
Documents with no incoming or outgoing links:
- [Document 1]
- [Document 2]

---

## ✅ Validation Passed
- [Document 1]: All links valid
- [Document 2]: All links valid

---

## 🔧 Recommendations
1. [Recommendation 1]
2. [Recommendation 2]
```

**Auto-Fix Mode (Optional):**
If the user requests auto-fix:
1. **Create backup**: Save `.bak` file before modifying any document
2. **Fix broken links**: Update link syntax or paths
3. **Add missing links**: Suggest and add recommended cross-references
4. **Report changes**: Document all modifications made

**Important Notes:**
- **Safety first**: Always create backups before modifying files
- **No assumptions**: Only fix links where the correct target is unambiguous
- **Clear reporting**: Document all issues found, whether fixed or not
- **Suggest improvements**: Recommend additional cross-references that would improve navigation

**Validation Checklist:**
- [ ] All markdown files have been scanned
- [ ] All wiki-style links have been validated
- [ ] Broken links have been identified
- [ ] Orphaned documents have been listed
- [ ] Report has been saved to correct location
- [ ] User has been informed of validation results

**When to use:** Regular vault maintenance, before team demos, when navigation feels broken, quarterly health checks.

### Future Skills (Coming Soon)

**MIL Generator** (`/k1:mil-generator <build-phase>`)
- Extract manufacturing issues from daily reports into structured MIL
- Intelligent deduplication and issue tracking
- Root cause analysis and pattern detection
- Generate both markdown and CSV output
- Creates both markdown and CSV formats
- Tracks issue lifecycle across build phases

---

## Skills vs Manual Reporting

**Claude Code Skills** (/skill-name):
- Deep synthesis (5-10 minutes with Opus)
- Comprehensive vault analysis across multiple sources
- Strategic thinking and narrative generation
- Executive-ready output with minimal refinement needed
- Zero `[NEED UPDATE]` placeholders - all real vault data

**Manual Reports:**
- Quick updates (5-10 minutes)
- Simple copy/paste aggregation
- May require manual refinement
- Good for routine daily updates

**When to use skills:**
- High-stakes documents (executive reviews, program status)
- Complex synthesis required (weekly reports, build summaries)
- Need accurate status (avoid reporting resolved issues as active)
- Strategic planning (roadmap reviews, gate assessments)

**When to do manual:**
- Quick routine updates (daily build status)
- Simple status checks
- Speed matters more than depth

## Working with This Vault

**Adding new notes:** Create markdown files with descriptive names using the naming conventions above (YYYY-MM-DD prefixes for chronological docs).

**Linking notes:** Use `[[Note Name]]` to create links between related documents. Maintain rich backlink networks.

**Project folders:** Group related documents in subdirectories by project/topic name.

## Technical Content Context

Current vault content focuses on K1 Proto hardware build tracking, including:
- Daily build status and progress
- Engineering validation and testing
- Manufacturing issue tracking
- Build material readiness
- Supplier coordination

Documentation follows engineering NPI formats: daily build reports, issue tracking, and status reporting.

## Build Phase Documentation

Build phase documentation is organized within `Builds/` directory. Each build phase includes a comprehensive summary (when complete) and daily reports.

**Purpose:**
- Aggregates all daily build reports into a single comprehensive overview
- Links all related decisions made before, during, and after the build
- Tracks Manufacturing Issue Log (MIL) and issue resolution
- Summarizes key outcomes and learnings for future builds
- Assesses readiness for the next build phase

**Structure:**
```
Builds/
├── Proto/
│   ├── Build Reports/        # Day-by-day detailed reports
│   ├── Weekly Reports/       # Weekly summaries (generated)
│   ├── Proto-Build-Summary.md  # Complete overview (after build)
│   └── MIL/                  # Manufacturing Issue Log (if needed)
└── [Future Build Phases]/
```

**Accessing Build Documentation:**
- Daily reports: `Builds/Proto/Build Reports/`
- Weekly reports: `Builds/Proto/Weekly Reports/`
- Build summary: `Builds/Proto/Proto-Build-Summary.md` (generated after completion)

This organization keeps all build-related documentation together for easy navigation and cross-referencing.

## Document Templates

### Build Reporting Template

**Purpose:** Standardized format for daily hardware build status reports

**Key Sections:** Executive Summary, Build Status, Top Accomplishments, Active Issues & Risks (🔴 Critical/🟡 Watching/✅ Resolved), Build Progress (SMT/FATP yields), Next 24-48 Hours, Related Documents

**Usage:** Follow existing daily report format. Use emoji indicators for quick visual scanning (📊 📍 ✅ ⚠️ 🔴 🟡 🎯 🔗)

**Note:** Review recent daily reports to maintain consistency in format and style.

### Weekly Report Template

**Purpose:** Standardized weekly executive report for K1 Proto build status

**Key Sections:** Executive Summary, Build Progress (SMT/FATP metrics), Key Accomplishments, Issues & Risks (Critical/Watching/Resolved), Week-over-Week Trends, Next Week Priorities, Related Documents

**Reporting cadence:** Weekly on Friday (week-ending report), covers Monday-Friday activity

**Usage notes:**
- This is the primary weekly executive communication vehicle for K1 builds
- Complements (does not replace) daily build reports during active build phases
- Use consistent emoji indicators for quick status scanning (📊 📍 ✅ 🎯 ⚠️ 🔴 🟡)
- For high-quality reports, use `/k1:weekly-report` skill for comprehensive synthesis

## Demo Context

**Purpose:** This vault serves as a demonstration of hardware build tracking workflows and documentation patterns.

**Key Features to Demonstrate:**
- Daily build report structure and consistency
- Issue categorization and tracking (🔴 Critical, 🟡 Watching, ✅ Resolved)
- Build metrics tracking (SMT/FATP yields, progress)
- Material readiness and supplier coordination
- Cross-functional communication patterns
- Automated weekly reporting and synthesis
- Knowledge graph integrity with backlink validation

**Best Practices:**
- Consistent formatting across all daily reports
- Clear status indicators for quick scanning
- Comprehensive issue documentation with links to tracking systems (Jira, Slack)
- Forward-looking "Next 24-48 Hours" planning
- Executive summary suitable for stakeholder communication
- Rich cross-referencing with wiki-style links
- Factual content only - no fabrication of status or metrics

## Vault Expansion Guide

As the K1 program grows, you may want to expand the vault structure to match the comprehensive setup in w3-hw-wallet. Here's how to grow the vault:

### Phase 1: Current (Basic Build Tracking)
✅ Daily build reports
✅ Weekly reports (generated)
✅ Backlink validation

### Phase 2: Enhanced Communication
Create when you need stakeholder communication beyond daily/weekly reports:

```bash
mkdir -p Communication/Daily-Updates
mkdir -p Communication/Weekly-Updates
```

Add skills:
- Daily vault summary generator
- Stakeholder communication templates

### Phase 3: Decision & Meeting Tracking
Create when decisions and meetings need formal tracking:

```bash
mkdir -p Decisions
mkdir -p Decisions/✅\ Decided
mkdir -p Meetings
```

Add naming conventions:
- Decisions: `YYYY-MM-DD-K1-Decision-Topic.md`
- Meetings: `YYYY-MM-DD-K1-Meeting-Topic.md`

### Phase 4: Quality Management
Create when you need formal issue tracking beyond daily reports:

```bash
mkdir -p Quality/MIL
mkdir -p Quality/Changes
```

Add skills:
- `/k1:mil-generator` - Extract MIL from daily reports
- MIL analytics and trend analysis

### Phase 5: Full Program Management
Create when managing multiple build phases or complex programs:

```bash
mkdir -p Programs/K1/Builds
mkdir -p Programs/K1/Quality
mkdir -p Programs/K1/Technical-Notes
mkdir -p Programs/K1/Risks
mkdir -p Resources/Templates
mkdir -p Resources/Automations
```

Add skills:
- Risk register management
- Build-over-build comparisons
- Readiness assessments
- Program review generation

### Comparing with W3 Setup

**w3-hw-wallet structure** (comprehensive program management):
- Multiple build phases (EVT, PDVT, DVT, PVT)
- Risk register with resolution tracking
- Decision log with metadata
- Meeting notes organized by month/week
- MIL with cross-build tracking
- Technical validation documentation
- Automated readiness assessments

**k1-kiosk structure** (streamlined build tracking):
- Single build phase focus (Proto)
- Daily/weekly reporting
- Basic issue tracking in reports
- Simpler structure for faster navigation

**When to expand:** Expand k1-kiosk structure when:
- Multiple build phases need tracking
- Formal decision log becomes necessary
- Risk management requires dedicated tracking
- Team size grows beyond 5-10 people
- Stakeholder reporting becomes more complex

## Related Vaults

**W3 Hardware Wallet** (`/Users/jheckman/w3-hw-wallet/`)
- Comprehensive program management structure
- Multiple build phases and formal processes
- Reference for advanced automation patterns
- Similar CLAUDE.md with more extensive skills

Both vaults use the same fundamental approach:
1. Obsidian for documentation
2. Claude Code for automation
3. Custom skills for synthesis
4. Git for version control
5. Consistent naming and formatting
