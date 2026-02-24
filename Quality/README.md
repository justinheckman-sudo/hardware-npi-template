# Quality

This directory contains quality tracking documentation, including Manufacturing Issue Logs (MIL) and change tracking.

## Directory Structure

```
Quality/
├── MIL/                   # Manufacturing Issue Log
│   └── [Build-Phase]/    # Organized by build phase
└── Changes/               # Change log tracking
```

## Manufacturing Issue Log (MIL)

**Purpose:** Track all manufacturing issues across build phases with structured data for analysis.

**File naming:**
- Format: `[Phase]-Manufacturing-Issue-Log.md` and `.csv`
- Example: `Proto-Manufacturing-Issue-Log.md`

**MIL Structure:**
- Issue ID (MIL-XXX format)
- Component/Category
- Severity (Critical, High, Medium, Low)
- Description and root cause
- First seen / Last seen dates
- Resolution status and date
- Mitigation actions

**Generating MIL:**
- Future skill: `/yourprogram:mil-generator <build-phase>`
- Extracts issues from daily build reports
- Creates both markdown and CSV formats
- Intelligent deduplication across days

## Change Tracking

**Purpose:** Track design changes, ECOs, and configuration changes across builds.

**Common change types:**
- Design changes (PCB, mechanical, firmware)
- BOM changes
- Process changes
- Supplier changes

**File naming:**
- Format: `[Phase]-Change-Log.md`
- Example: `Proto-Change-Log.md`

## Best Practices

**Issue categorization:**
- Use consistent component/category names
- Tag with Jira/tracking system IDs
- Link to daily reports where first identified
- Update status as issues resolve

**Cross-referencing:**
Always link quality documents to:
- Daily build reports
- Risk documents for critical issues
- Decision documents for change approvals
- Technical notes for root cause analysis

## Related

- See daily build reports for issue identification
- See `Resources/Templates/` for MIL templates (future)
- See `CLAUDE.md` for MIL generation skill details
