---
name: k1:build-summary
description: This skill should be used when the user asks to "generate K1 build summary", "create build retrospective", "summarize build phase", or mentions completing a build phase (Proto, EVT, DVT, PVT)
version: 1.0.0
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

**From daily reports, identify:**
1. First day of build (earliest daily report)
2. Last day of build (latest daily report)
3. Total build duration
4. Key milestones (FAI, OK2Mini, etc.)

### Step 2: Gather All Data

**Read in this order:**
1. All daily build reports (chronologically)
2. Weekly reports for the period
3. MIL (if exists)
4. Decisions during period
5. Risks during period
6. Technical notes during period
7. Meeting notes during period

### Step 3: Synthesize Into 15 Sections

Generate comprehensive summary with these sections:

## Output Template

```markdown
# [Program] [Phase] Build Summary
**Build Phase:** [Phase] (e.g., Proto, EVT, DVT, PVT)
**Build Location:** [Factory/Location]
**Build Dates:** [Start Date] - [End Date]
**Duration:** [X] days
**Report Date:** [Today's Date]

---

## 📊 Executive Summary

[2-3 paragraph high-level summary covering:
- Build objectives and whether achieved
- Key accomplishments
- Critical issues and resolutions
- Overall build success assessment
- Readiness for next phase]

**Overall Build Health:** [🟢 Successful / 🟡 Conditional / 🔴 Needs Work]

---

## 🎯 Build Objectives

**Primary Objectives:**
- [Objective 1 from first daily reports]
- [Objective 2]
- [Objective 3]

**Achievement Status:**
- [Objective 1]: ✅ Achieved / 🟡 Partially / ❌ Not Achieved - [Brief explanation]
- [Objective 2]: [Status] - [Explanation]
- [Objective 3]: [Status] - [Explanation]

---

## 📈 Key Build Metrics

### SMT Production
- **MLB:** [X] units ([Y]% yield)
- **SPE:** [X] units ([Y]% yield)
- **Sensor:** [X] units ([Y]% yield)
- **Overall SMT Yield:** [X]%

### FATP Production
- **Units Completed:** [X]
- **FATP Yield:** [Y]%
- **Test Coverage:** [Percentage or description]

### Timeline Metrics
- **Planned Duration:** [X] days
- **Actual Duration:** [X] days
- **Variance:** [+ or - X] days

**Target Achievement:**
- Units target: [Met / Exceeded / Below] - [X]% of target
- Schedule target: [Met / Exceeded / Delayed]
- Yield target: [Met / Exceeded / Below]

---

## 🏗 Final Build Configuration

**Hardware:**
- MLB: [Part number / revision]
- SPE: [Part number / revision]
- Sensor: [Part number / revision]
- Key components: [List]

**Firmware:**
- Version: [Version number]
- Key features enabled: [List]

**Test Coverage:**
- SMT: [DL, BFT, other tests]
- FATP: [Function tests, other tests]

---

## 📅 Daily Build Reports Summary

**Week 1: [Dates]**
- [Day 1]: [Key milestone - e.g., SMT start, FAI complete]
- [Day 2]: [Key milestone]
- [Day 3]: [Key milestone]
- ...

**Week 2: [Dates]**
- [Day X]: [Key milestone]
- ...

[Group by week, extract key milestones from each day]

**Full daily reports:** [[YYYY-MM-DD-K1-Proto-D1]] | [[D2]] | [[D3]] | ...

---

## ✅ Build Outcomes & Key Learnings

### Major Accomplishments
1. **[Accomplishment 1]**
   - [Details and impact]

2. **[Accomplishment 2]**
   - [Details and impact]

3. **[Accomplishment 3]**
   - [Details and impact]

### Key Challenges & How They Were Resolved
1. **[Challenge 1]** (e.g., Aura LED cable pinout error)
   - **Issue:** [Description]
   - **Root Cause:** [If identified]
   - **Resolution:** [How it was fixed]
   - **Impact:** [Schedule, cost, quality impact]

2. **[Challenge 2]**
   - [Same structure]

### Lessons Learned
1. **[Lesson 1]** (e.g., Material readiness critical for timeline)
   - [Explanation and recommendation]

2. **[Lesson 2]**
   - [Explanation and recommendation]

---

## ⚠️ Manufacturing Issue Log (MIL) Analysis

**Total Issues Identified:** [N]

**Issues by Severity:**
- 🔴 Critical: [N] issues
- 🟡 High: [N] issues
- 🟢 Medium: [N] issues
- ⚪ Low: [N] issues

**Resolution Status:**
- ✅ Resolved: [N] ([X]%)
- 🔄 In Progress: [N] ([X]%)
- ⏸️ Deferred to Next Phase: [N] ([X]%)

**Top Issues:**
1. **[Issue ID]**: [Brief description] - Status: [Resolved/In Progress]
2. **[Issue ID]**: [Brief description] - Status: [Resolved/In Progress]
3. **[Issue ID]**: [Brief description] - Status: [Resolved/In Progress]

**Issues Carried Forward to Next Phase:** [N]
- [List critical issues not resolved]

**Average Time-to-Resolution:** [X] days

---

## 🎯 Decisions Made During Build

1. **[Decision Title]** - [[YYYY-MM-DD-K1-Decision-Topic]]
   - **Decision:** [Brief summary]
   - **Rationale:** [Why this was decided]
   - **Owner:** [Name]
   - **Impact:** [How this affected build]

2. **[Decision Title]** - [[Link]]
   - [Same structure]

[Continue for all significant decisions]

---

## 🚨 Risk Updates

### New Risks Identified
- **[[RISK-XXX-K1-Title]]** - [Brief description and current status]

### Risks Resolved
- **[[RISK-XXX-K1-Title]]** - [Brief description of resolution]

### Risks Carried Forward
- **[[RISK-XXX-K1-Title]]** - [Brief description and mitigation plan]

---

## 🔬 Technical Validation Results

[Summarize technical notes and validation from build period]

### Testing Completed
- **[Test Type 1]:** [Results summary]
- **[Test Type 2]:** [Results summary]

### Validation Status
- [Validation 1]: ✅ Complete / 🟡 In Progress / ❌ Not Started
- [Validation 2]: [Status]

### Technical Notes
- [[Technical Note 1]] - [Brief summary]
- [[Technical Note 2]] - [Brief summary]

---

## 📊 Weekly Reports

Weekly reports generated during build:
- [[YYYY-MM-DD-K1-Weekly]] - Week ending [Date]
- [[YYYY-MM-DD-K1-Weekly]] - Week ending [Date]

[Link to all weekly reports from the build period]

---

## 🔮 Recommendations for Next Build

### Critical Actions Before Next Phase
1. **[Action 1]** - Owner: [Name] - Due: [Date]
   - [Why this is critical]

2. **[Action 2]** - Owner: [Name] - Due: [Date]
   - [Why this is critical]

### Process Improvements
1. **[Improvement 1]**
   - **Current:** [What we did]
   - **Recommendation:** [What to do differently]
   - **Expected Benefit:** [Impact]

2. **[Improvement 2]**
   - [Same structure]

### Material Readiness
- [Recommendation for material planning]
- [Lead time lessons learned]

### Test Strategy
- [Recommendations for test approach]
- [Coverage improvements needed]

---

## 🎯 Readiness Assessment for Next Phase

**Overall Readiness:** [🟢 Ready / 🟡 Ready with Conditions / 🔴 Not Ready]

### By Domain

**Design Readiness:** [🟢/🟡/🔴]
- [Assessment rationale]
- [Blockers if any]

**Manufacturing Readiness:** [🟢/🟡/🔴]
- [Assessment rationale]
- [Blockers if any]

**Quality Readiness:** [🟢/🟡/🔴]
- [Assessment rationale]
- [Blockers if any]

**Supply Chain Readiness:** [🟢/🟡/🔴]
- [Assessment rationale]
- [Blockers if any]

**Risk Readiness:** [🟢/🟡/🔴]
- [Assessment rationale]
- [Blockers if any]

### GO/NO-GO Recommendation

**Recommendation:** [GO / GO with Conditions / NO-GO]

**Rationale:**
[Detailed explanation of recommendation based on:
- Objectives achieved
- Issues resolved
- Risks mitigated
- Validation complete
- Next phase requirements]

**Conditions (if applicable):**
1. [Condition 1 that must be met]
2. [Condition 2]

---

## 🔗 Related Documents

### Daily Build Reports
[Links to all daily reports]

### Weekly Reports
[Links to all weekly reports]

### Decisions
[Links to all decisions made during build]

### Risks
[Links to all risk documents]

### Technical Notes
[Links to all technical analysis]

### Manufacturing Issue Log
[Link to MIL if exists]

---

## 📊 Build Statistics

**Timeline:**
- Start date: [Date]
- End date: [Date]
- Duration: [X] days
- Build days: [X] (excluding weekends/holidays)

**Production:**
- Total units planned: [X]
- Total units produced: [X]
- Production efficiency: [X]%

**Quality:**
- Total issues identified: [X]
- Critical issues: [X]
- Resolution rate: [X]%

**Team:**
- Onsite team size: [X] people
- Factory: [Location]
- Key personnel: [List]

---

## 📝 Appendices

### A. Issue Summary Table
[If MIL exists, include summary table]

### B. Yield Trends
[If multiple days of data, show trends]

### C. Timeline Visualization
[Key milestones on timeline]

```

## Output Location

Save the generated summary to:
`/Users/jheckman/hardware-npi-template/Builds/[Phase]/[Phase]-Build-Summary.md`

Example: `/Users/jheckman/hardware-npi-template/Builds/Proto/Proto-Build-Summary.md`

## Important Notes

### Accuracy and Attribution
- **No fabrication:** Only include information explicitly stated in source documents
- **Link to sources:** Every claim should link back to daily report, decision, or risk document
- **Quantitative data:** Extract actual numbers from reports, don't estimate
- **Unknown data:** Use "[Data not available]" rather than guessing

### Strategic Synthesis
- **Tell the story:** Not just data aggregation, but narrative of the build
- **Identify patterns:** Recurring issues, process bottlenecks, success factors
- **Provide insights:** Why things happened, not just what happened
- **Forward-looking:** Actionable recommendations for next phase

### Executive-Ready Output
- **Clear structure:** 15 sections, easy to navigate
- **Visual indicators:** Use 🟢🟡🔴 for quick scanning
- **Linked documentation:** Wiki-links to all source documents
- **Concise summaries:** Each section has summary before details
- **Actionable:** Clear owners and dates for recommendations

## Example Usage

User: "Generate K1 Proto build summary"

Your response:
1. Identify build phase: Proto
2. Find all daily reports in `Builds/Proto/Build Reports/`
3. Determine timeline (first to last report)
4. Read all daily reports chronologically
5. Read weekly reports if they exist
6. Scan Decisions/, Risks/, Technical-Notes/ for build period documents
7. Synthesize into 15-section comprehensive summary
8. Include quantitative metrics (units, yields, resolution rates)
9. Provide strategic insights and recommendations
10. Generate GO/NO-GO recommendation with rationale
11. Save to `Builds/Proto/Proto-Build-Summary.md`
12. Confirm completion with summary of key findings

## Validation Checklist

Before outputting the summary, verify:
- [ ] All daily reports for the phase have been read
- [ ] Timeline accurately reflects first-to-last day
- [ ] Build metrics are extracted from actual reports (not estimated)
- [ ] All 15 sections are complete (use "[Data not available]" if no data)
- [ ] Decisions, risks, technical notes from build period are included
- [ ] Recommendations are specific with owners and dates
- [ ] GO/NO-GO recommendation has clear rationale
- [ ] All source documents are linked with wiki-style links
- [ ] Output file is saved to correct location
- [ ] Summary tells a coherent story of the build

## When NOT to Use This Skill

- Build phase is still in progress (use weekly reports instead)
- Only 1-2 daily reports exist (not enough data for summary)
- User wants quick status update (use weekly report skill instead)
- User wants just metrics (extract from daily reports directly)

## Time Estimate

This skill takes 10-20 minutes to generate a comprehensive build summary because it:
- Reads all daily reports (5-15 reports typical)
- Scans multiple directories for related documents
- Synthesizes across many sources
- Generates strategic insights and recommendations
- Creates comprehensive 15-section document

**Worth it for:** Build gate reviews, executive presentations, next phase planning, comprehensive retrospectives
