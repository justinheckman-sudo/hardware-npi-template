---
name: hub:weekly-report
description: Use when the user asks to "generate K1 weekly report", "create K1 weekly report", mentions "K1 weekly status", or discusses weekly status reporting for the K1 program
argument-hint: [week-ending-date]
allowed-tools:
  - Read
  - Write
  - Bash
  - Grep
  - Glob
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
Location: `/Users/jheckman/hardware-npi-template/Builds/Proto/Build Reports/`

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

### Step 1: Determine the Week

If no date provided, use today's date and find the most recent Friday as the week-ending date.

Calculate the week date range, then find all daily reports for those dates.

### Step 2: Read and Synthesize

Read all daily reports for the week chronologically. Extract:
- Build progress metrics (units, yields)
- Accomplishments (deduplicated across days)
- Active issues (🔴 Critical, 🟡 Watching)
- Resolved issues (✅)
- Next week priorities from latest reports

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
- **[Issue Title]**
  - **Impact:** [Description]
  - **Mitigation:** [Approach]
  - **Status:** [Current state]

### 🟡 Watching (Potential Impact)
- **[Issue Title]**
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

- [Trend 1]
- [Trend 2]
- [Trend 3]

---

## 🔗 Related Documents

- [Links to daily reports for the week]
```

## Output Location

Save the generated report to:
`/Users/jheckman/hardware-npi-template/Builds/Proto/Weekly Reports/YYYY-MM-DD-K1-Proto-Weekly.md`

If the directory doesn't exist, create it.

## Important Notes

- **Accuracy over speed**: Take time to read and synthesize all daily reports
- **No fabrication**: Only include information explicitly stated in daily reports
- **Clear attribution**: Link to source daily reports
- **Status indicators**: Use 🔴🟡✅ consistently for visual scanning
- **Week-over-week context**: Compare to previous week's report if available

## Validation Checklist

Before outputting the report, verify:
- [ ] All daily reports for the week have been read
- [ ] Executive summary accurately reflects the week
- [ ] All critical issues are documented with mitigation plans
- [ ] Build progress metrics are accurate and sourced from daily reports
- [ ] Week-over-week trends are based on data comparison
- [ ] Output file is saved to correct location
- [ ] Report includes links to all source documents
