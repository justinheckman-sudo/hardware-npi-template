---
name: hub:build-summary
description: Use when the user asks to "generate K1 build summary", "create build retrospective", "summarize build phase", or mentions completing a build phase (Proto, EVT, DVT, PVT)
argument-hint: <phase>
allowed-tools:
  - Read
  - Write
  - Bash
  - Grep
  - Glob
---

# K1 Build Summary Generator

Generate a comprehensive build phase retrospective by synthesizing all build documentation into a strategic summary.

## When to Use This Skill

Use this skill when the user:
- Completes a build phase (Proto, EVT, DVT, PVT)
- Asks for build retrospective or summary
- Needs comprehensive phase documentation
- Preparing for gate reviews or next phase planning
- Wants to capture learnings from completed build

## Your Mission

Create a HIGH-QUALITY, COMPREHENSIVE build summary that synthesizes ALL documentation from the build phase into an executive-ready retrospective with strategic insights.

## Data Sources to Read and Synthesize

### 1. Daily Build Reports (PRIMARY SOURCE)
Location: `/Users/jheckman/hardware-npi-template/Builds/[Phase]/Build Reports/`

**Read ALL daily reports chronologically:**
- Extract build objectives and goals
- Track progress metrics (SMT/FATP units, yields)
- Identify accomplishments by day
- Collect all issues (🔴🟡✅)
- Note material readiness challenges
- Capture test station bring-up progress
- Record timeline milestones

### 2. Weekly Reports (if available)
Location: `/Users/jheckman/hardware-npi-template/Builds/[Phase]/Weekly Reports/`

**Extract:**
- Week-over-week trends
- Executive summaries
- Synthesized insights

### 3. Manufacturing Issue Log (if available)
Location: `/Users/jheckman/hardware-npi-template/Quality/MIL/`

**Extract:**
- Total issues identified
- Issues by severity (Critical, High, Medium, Low)
- Resolution rates
- Time-to-resolution metrics
- Issues carried forward

### 4. Decisions Made During Build
Location: `/Users/jheckman/hardware-npi-template/Decisions/`

**Find decisions dated during build period:**
- Read decision documents
- Extract decision, rationale, owner, date
- Note impact on build

### 5. Risk Updates
Location: `/Users/jheckman/hardware-npi-template/Risks/`

**Find risks identified or updated during build:**
- New risks identified
- Risks resolved during build
- Mitigation actions taken
- Risks carried forward

### 6. Technical Notes
Location: `/Users/jheckman/hardware-npi-template/Technical-Notes/`

**Find technical analysis from build period:**
- Validation results
- Root cause analyses
- Performance characterization
- Test results

### 7. Meeting Notes
Location: `/Users/jheckman/hardware-npi-template/Meetings/`

**Scan meetings during build period for:**
- Key decisions made in meetings
- Action items and owners
- Escalations

## Build Summary Generation Process

### Step 1: Determine Build Phase Timeline

1. Identify build phase from user input (e.g., Proto, EVT, DVT)
2. Find all daily reports for that phase in `Builds/[Phase]/Build Reports/`
3. Determine start and end dates from filenames
4. Calculate total duration

### Step 2: Gather All Data

Read in this order:
1. All daily build reports (chronologically)
2. Weekly reports for the period
3. MIL (if exists)
4. Decisions during period
5. Risks during period
6. Technical notes during period
7. Meeting notes during period

### Step 3: Synthesize Into 15 Sections

Generate a comprehensive summary covering: Executive Summary, Build Objectives, Key Metrics, Build Configuration, Daily Reports Summary, Key Accomplishments & Learnings, MIL Analysis, Decisions Made, Risk Updates, Technical Validation, Weekly Reports, Recommendations, Readiness Assessment, Related Documents, Build Statistics.

## Output Location

Save the generated summary to:
`/Users/jheckman/hardware-npi-template/Builds/[Phase]/[Phase]-Build-Summary.md`

Example: `/Users/jheckman/hardware-npi-template/Builds/Proto/Proto-Build-Summary.md`

## Important Notes

- **No fabrication**: Only include information explicitly stated in source documents
- **Link to sources**: Every claim should link back to daily report, decision, or risk document
- **Quantitative data**: Extract actual numbers from reports, don't estimate
- **Unknown data**: Use "[Data not available]" rather than guessing
- **Strategic synthesis**: Not just data aggregation, but narrative of the build
- **Executive-ready**: Clear structure, visual indicators (🟢🟡🔴), actionable recommendations

## Validation Checklist

Before outputting the summary, verify:
- [ ] All daily reports for the phase have been read
- [ ] Timeline accurately reflects first-to-last day
- [ ] Build metrics are extracted from actual reports (not estimated)
- [ ] All sections are complete (use "[Data not available]" if no data)
- [ ] Decisions, risks, technical notes from build period are included
- [ ] Recommendations are specific with owners and dates
- [ ] GO/NO-GO recommendation has clear rationale
- [ ] All source documents are linked with wiki-style links
- [ ] Output file is saved to correct location
