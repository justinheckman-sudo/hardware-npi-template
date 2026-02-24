# Risks

This directory contains the risk register for the program, tracking identified risks, their mitigation plans, and resolution status.

## Directory Structure

```
Risks/
├── [Active Risk Documents]
└── ✅ Resolved/           # Resolved risks (archive)
```

## File Naming Convention

**Format:** `RISK-XXX-[Program]-[Risk-Title].md`

**Examples:**
- `RISK-001-K1-Battery-Life.md`
- `RISK-002-K1-Touch-Enablement.md`
- `RISK-003-K1-Supply-Chain-Delays.md`

**Risk ID numbering:**
- Start at RISK-001
- Increment sequentially
- Never reuse numbers (even after resolution)

## Risk Document Structure

Use the template in `Resources/Templates/risk-document-template.md`:

1. **Risk Summary** - Brief description
2. **Description** - What, when, impact
3. **Risk Assessment** - Severity, probability, score
4. **Impact Analysis** - Affected areas and quantitative impact
5. **Root Causes** - Contributing factors
6. **Mitigation Plan** - Actions, contingency
7. **Monitoring** - Key indicators, escalation
8. **Status Updates** - Chronological updates
9. **Resolution** - How resolved, lessons learned

## Risk Status

- 🔴 **Active** - Current risk requiring active mitigation
- 🟡 **Monitoring** - Risk identified, being watched, no immediate action
- ✅ **Resolved** - Risk mitigated or no longer applicable
- ⚫ **Accepted** - Risk acknowledged, no mitigation planned

## Risk Severity

- 🔴 **Critical** - Program blocker, could stop build or launch
- 🟡 **High** - Significant impact on schedule, cost, or quality
- 🟢 **Medium** - Moderate impact, manageable with mitigation
- ⚪ **Low** - Minor impact, low priority

## Risk Probability

- **High** - Likely to occur (>50%)
- **Medium** - Possible (20-50%)
- **Low** - Unlikely (<20%)

## Risk Score Calculation

**Risk Score = Severity × Probability**

Example:
- Critical × High = 9 (highest priority)
- High × Medium = 6
- Medium × Low = 3 (lowest priority)

## Best Practices

**When to create a risk document:**
- Identified threat to schedule, cost, quality, or scope
- Probability and impact warrant tracking
- Requires mitigation actions
- Should be visible to stakeholders

**Regular risk reviews:**
- Update status weekly during active builds
- Review in core team meetings
- Escalate based on severity and probability changes
- Archive to ✅ Resolved/ when risk is mitigated

**Cross-referencing:**
Always link risks to:
- Build reports where risk manifested
- Decision documents that address the risk
- Mitigation actions in meeting notes
- Related risks that could compound

## Risk Register View

Obsidian allows you to create a risk register view:
- Use Dataview plugin to query all risk documents
- Display: ID, Title, Status, Severity, Owner
- Sort by: Risk Score (descending)
- Filter: Show only Active risks

## Example Usage

**Creating a new risk:**
1. Copy template from `Resources/Templates/risk-document-template.md`
2. Name following convention: `RISK-XXX-Program-Risk-Title.md`
3. Assign next available risk ID number
4. Fill in all sections with assessment
5. Link from relevant build reports
6. Update regularly with status updates
7. Move to `✅ Resolved/` when closed

**Referencing risks:**
- In build reports: `[[RISK-001-K1-Battery-Life]]`
- In decisions: Link to risks that decisions address
- In meetings: Include in agenda for discussion

## Metadata Template

Include at the top of each risk document:
```markdown
**Risk ID:** RISK-XXX
**Program:** [Program Name]
**Status:** 🔴 Active / 🟡 Monitoring / ✅ Resolved / ⚫ Accepted
**Severity:** 🔴 Critical / 🟡 High / 🟢 Medium / ⚪ Low
**Probability:** High / Medium / Low
**Date Identified:** YYYY-MM-DD
**Owner/DRI:** [Name]
**Last Updated:** YYYY-MM-DD
```

## Related

- See `Resources/Templates/risk-document-template.md` for full template
- See `CLAUDE.md` for risk documentation standards
- See `Decisions/` for decisions that mitigate risks
