# Decisions

This directory contains formal decision documentation with rationale, options considered, and implementation plans.

## Directory Structure

```
Decisions/
├── [Active Decision Documents]
└── ✅ Decided/            # Finalized decisions (archive)
```

## File Naming Convention

**Format:** `YYYY-MM-DD-[Program]-Decision-[Topic].md`

**Examples:**
- `2026-01-15-[PROGRAM]-Decision-ATE-Strategy.md`
- `2026-02-01-[PROGRAM]-Decision-Fixture-Approach.md`
- `2026-02-10-[PROGRAM]-Decision-Material-Sourcing.md`

## Decision Document Structure

Use the template in `Resources/Templates/decision-document-template.md`:

1. **Decision Summary** - One-liner of what was decided
2. **Context** - Background, constraints, stakeholders
3. **Options Considered** - All options with pros/cons
4. **Decision** - Selected option and rationale
5. **Implementation** - Action items, timeline, success criteria
6. **Impact** - Affected areas, dependencies, risks
7. **Related Documents** - Links to related decisions/risks/reports

## Status Indicators

- 🟢 **Decided** - Final decision made and documented
- 🟡 **Pending** - Under discussion, awaiting decision
- 🔴 **Blocked** - Cannot proceed, blockers identified

## Decision Types

- **Strategic** - Long-term, program-level decisions
- **Tactical** - Mid-term, phase-specific decisions
- **Technical** - Implementation-level, engineering decisions

## Best Practices

**When to create a decision document:**
- Affects multiple stakeholders or teams
- Has significant cost, schedule, or quality impact
- Multiple viable options with trade-offs
- Needs formal rationale and approval
- Should be referenced in future planning

**When to move to ✅ Decided:**
- Decision is final and documented
- Implementation has begun or completed
- No further discussion needed
- Keeps active directory clean

**Cross-referencing:**
Always link decisions to:
- Build reports where discussed
- Risk documents affected by the decision
- Related decisions
- Meeting notes where decided

## Example Usage

**Creating a new decision:**
1. Copy template from `Resources/Templates/decision-document-template.md`
2. Name following convention: `YYYY-MM-DD-Program-Decision-Topic.md`
3. Fill in all sections
4. Link from relevant build reports
5. Update status as decision progresses
6. Move to `✅ Decided/` when finalized

**Referencing decisions:**
- In build reports: `[[2026-01-15-[PROGRAM]-Decision-ATE-Strategy]]`
- In risk docs: Link to decisions that mitigate risks
- In meetings: Include in agenda or notes

## Metadata Template

Include at the top of each decision document:
```markdown
**Date:** YYYY-MM-DD
**Status:** 🟢 Decided / 🟡 Pending / 🔴 Blocked
**Owner/DRI:** [Name]
**Decision Type:** Strategic / Tactical / Technical
```

## Related

- See `Resources/Templates/decision-document-template.md` for full template
- See `CLAUDE.md` for decision documentation standards
