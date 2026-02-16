# Communication

This directory contains stakeholder communications and program status updates.

## Directory Structure

```
Communication/
├── Daily-Updates/          # Daily vault activity summaries
│   └── YYYY-MM/           # Organized by month
└── Weekly-Updates/         # Weekly program status reports
    └── YYYY-MM/           # Organized by month
        └── WXX/           # Organized by week number
```

## File Naming Conventions

**Daily Updates:**
- Format: `Daily_Vault_Update_YYYY-MM-DD.md`
- Example: `Daily_Vault_Update_2026-02-12.md`

**Weekly Updates:**
- Format: `YYYY-MM-DD-[Program]-Weekly.md`
- Example: `2026-02-07-K1-Weekly.md`

## Purpose

### Daily Updates
- Daily vault activity summaries
- Recent changes and additions
- Key takeaways from the day
- Generated automatically or manually

### Weekly Updates
- Comprehensive weekly program status
- Build progress and metrics
- Issues and risks
- Week-over-week trends
- Executive-ready format
- **Generate with:** `/yourprogram:weekly-report [date]`

## Usage

**Creating weekly reports:**
```
/yourprogram:weekly-report 2026-02-07
```

**Manual organization:**
- Daily updates go in `Daily-Updates/YYYY-MM/`
- Weekly updates go in `Weekly-Updates/YYYY-MM/WXX/`
- Use week numbers (W01, W02, etc.) for weekly organization

## Related

- See `Resources/Templates/` for report templates
- See `CLAUDE.md` for detailed skill instructions
