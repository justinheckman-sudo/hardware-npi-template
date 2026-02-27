# Meetings

This directory contains meeting notes, agendas, and action items.

## Directory Structure

```
Meetings/
└── YYYY-MM/              # Organized by month
    └── WXX/              # Organized by week number
```

## File Naming Convention

**Format:** `YYYY-MM-DD-[Program]-[Meeting-Type].md`

**Examples:**
- `2026-02-03-[PROGRAM]-Core-Team-Agenda.md`
- `2026-02-05-[PROGRAM]-Build-Review.md`
- `2026-02-10-[PROGRAM]-Risk-Review.md`

## Meeting Types

**Core Team Meetings:**
- Weekly program sync
- Build status and progress
- Issue escalation and decision-making
- Action item tracking

**Build Reviews:**
- Daily build status (during active builds)
- Weekly progress reviews
- Gate reviews (EVT→DVT, DVT→PVT, etc.)
- Readiness assessments

**Technical Syncs:**
- Engineering deep-dives
- Vendor coordination
- Cross-functional technical discussions

**Risk & Issue Reviews:**
- Risk register reviews
- Issue escalation meetings
- Mitigation planning

## Meeting Document Structure

**Agenda (before meeting):**
```markdown
# [Program] [Meeting Type] - YYYY-MM-DD

## Meeting Info
- **Date:** YYYY-MM-DD
- **Time:** HH:MM
- **Attendees:** [List]
- **DRI:** [Name]

## Agenda
1. [Topic 1] - [Owner] ([Time])
2. [Topic 2] - [Owner] ([Time])

## Pre-reads
- [[Document 1]]
- [[Document 2]]

## Decisions Needed
- [Decision 1]
- [Decision 2]
```

**Notes (during/after meeting):**
```markdown
## Discussion Notes
[Topic 1]
- [Key point 1]
- [Key point 2]

## Decisions Made
- [Decision 1] - Owner: [Name]
- [Decision 2] - Owner: [Name]

## Action Items
- [ ] [Action 1] - Owner: [Name] - Due: [Date]
- [ ] [Action 2] - Owner: [Name] - Due: [Date]

## Parking Lot
- [Item to discuss later]
```

## Best Practices

**Before meetings:**
- Distribute agenda 24 hours in advance
- Include pre-read documents
- Clearly state decisions needed

**During meetings:**
- Capture key discussion points
- Document decisions with owners
- Record action items with due dates
- Use parking lot for off-topic items

**After meetings:**
- Update action items with owners
- Create decision documents for major decisions
- Link to relevant build reports/risks
- Follow up on action items in next meeting

**Cross-referencing:**
Always link meeting notes to:
- Build reports discussed
- Decision documents created from meetings
- Risk documents reviewed
- Previous meeting notes for continuity

## Meeting Cadence

**Typical NPI program cadence:**
- **Daily standups** during active builds (15 min)
- **Weekly core team** for program status (1 hour)
- **Bi-weekly risk review** for active risks (30 min)
- **Ad-hoc technical syncs** as needed

## Related

- See `Decisions/` for decisions made in meetings
- See `Risks/` for risks discussed in meetings
- See `Builds/Proto/Build Reports/` for daily build status
- See `Communication/Weekly-Updates/` for weekly status
