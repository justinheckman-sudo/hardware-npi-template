---
name: k1:weekly-report
description: This skill should be used when the user asks to "generate K1 weekly report", "create K1 weekly report", mentions "K1 weekly status", or discusses weekly status reporting for the K1 program
version: 1.0.0
---

# K1 Weekly Report Generator

Generate a comprehensive K1 Proto build weekly report using synthesis across daily build reports.

## When to Use This Skill

Use this skill when the user:
- Asks to generate a K1 weekly report
- Mentions "K1 weekly status" or "K1 weekly build report"
- Requests comprehensive program status for the week
- Needs an executive-ready weekly build summary

## Your Mission

Create a HIGH-QUALITY weekly report by synthesizing information from K1 daily build reports for the reporting period.

## Data Sources to Read and Synthesize

### 1. Daily Build Reports (PRIMARY SOURCE)
Location: `/Users/jheckman/k1-kiosk/Builds/Proto/Build Reports/`

**Report naming format**: `YYYY-MM-DD-K1-Proto-DX.md` (where X is day number)

**For the specified week:**
1. Identify all daily reports within the reporting period
2. Read each report completely
3. Extract and synthesize:
   - Build progress (SMT/FATP metrics)
   - Key accomplishments
   - Critical issues (🔴)
   - Watching items (🟡)
   - Resolved issues (✅)
   - Material readiness updates
   - Test station bring-up progress

### 2. Week-over-Week Analysis
- Compare current week's progress to previous week
- Track issue trends (new vs resolved)
- Identify recurring themes or blockers

## Report Generation Process

### Step 1: Gather Data
1. Calculate the week date range from the provided date
2. Find all daily reports for that week
3. Read each report in chronological order
4. Extract structured data from each report section

### Step 2: Synthesize Content
Create comprehensive synthesis across all daily reports:

**Executive Summary:**
- High-level build progress snapshot
- Major accomplishments for the week
- Critical issues status
- Overall build health (🟢🟡🔴)

**Build Progress:**
- SMT progress (units completed, yield)
- FATP progress (units completed, yield)
- Test station bring-up status
- Material readiness

**Key Accomplishments:**
- Aggregate and deduplicate accomplishments from all daily reports
- Highlight major milestones achieved

**Issues & Risks:**
- Critical Issues (🔴): Current build blockers
- Watching (🟡): Items being monitored
- Resolved This Week (✅): Issues closed during the week

**Next Week Priorities:**
- Based on "Next 24-48 Hours" sections from latest reports
- Critical path items
- Key deliverables

### Step 3: Format Output

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
- [Accomplishment 3]

---

## ⚠️ Issues & Risks

### 🔴 Critical (Build Blockers)
- **[Issue Title]** ([Jira Link])
  - **Impact:** [Description]
  - **Mitigation:** [Approach]
  - **Status:** [Current state]

### 🟡 Watching (Potential Impact)
- **[Issue Title]** ([Jira Link])
  - **Status:** [Current state]

### ✅ Resolved This Week
- [Resolved issue 1]
- [Resolved issue 2]

---

## 🎯 Next Week Priorities

- [Priority 1]
- [Priority 2]
- [Priority 3]

---

## 📈 Week-over-Week Trends

- [Trend 1: e.g., SMT yield improvement]
- [Trend 2: e.g., Issue resolution rate]
- [Trend 3: e.g., Material readiness progress]

---

## 🔗 Related Documents

- [Link to daily reports for the week]
- [Link to Jira issues]
- [Link to Slack threads]
```

## Output Location

Save the generated report to:
`/Users/jheckman/k1-kiosk/Builds/Proto/Weekly Reports/YYYY-MM-DD-K1-Proto-Weekly.md`

If the directory doesn't exist, create it.

## Important Notes

- **Accuracy over speed**: Take time to read and synthesize all daily reports
- **No fabrication**: Only include information explicitly stated in daily reports
- **Clear attribution**: Link to source daily reports and tracking systems
- **Status indicators**: Use 🔴🟡✅ consistently for visual scanning
- **Week-over-week context**: Compare to previous week's report if available

## Example Usage

User: "Generate K1 weekly report for 2026-02-07"

Your response:
1. Identify the week: 2026-02-03 through 2026-02-07
2. Find daily reports: D2.md through D6.md
3. Read each report completely
4. Synthesize into comprehensive weekly report
5. Save to appropriate location
6. Confirm completion with summary

## Validation Checklist

Before outputting the report, verify:
- [ ] All daily reports for the week have been read
- [ ] Executive summary accurately reflects the week
- [ ] All critical issues are documented with mitigation plans
- [ ] Build progress metrics are accurate and sourced from daily reports
- [ ] Week-over-week trends are based on data comparison
- [ ] Output file is saved to correct location
- [ ] Report includes links to all source documents
