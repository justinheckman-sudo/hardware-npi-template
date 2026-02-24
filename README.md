# Hardware NPI Build Tracking Template

**A comprehensive Obsidian vault template for hardware NPI (New Product Introduction) program management.**

This vault provides a complete framework for tracking hardware builds from prototype through production, with automated reporting, issue tracking, and knowledge management.

## What This Template Provides

- **Daily Build Tracking** - Standardized daily build reports with consistent formatting
- **Automated Weekly Reports** - Claude Code skills for synthesizing weekly status
- **Manufacturing Issue Log (MIL)** - Structured issue tracking across build phases
- **Decision Documentation** - Formal decision log with metadata and rationale
- **Risk Management** - Risk register with tracking and mitigation plans
- **Meeting Documentation** - Organized meeting notes with backlinks
- **Backlink Validation** - Automated knowledge graph integrity checks
- **Git Integration** - Version control with proper .gitignore for Obsidian vaults

## Quick Start

### For New Teams

1. **Clone this repository:**
   ```bash
   git clone https://github.com/justinheckman-sudo/hardware-npi-template.git my-program-vault
   cd my-program-vault
   ```

2. **Install requirements:**
   - **Obsidian**: https://obsidian.md/
   - **Claude Code**: https://claude.ai/code
   - **uv** (for Glean MCP): `curl -LsSf https://astral.sh/uv/install.sh | sh`

3. **Run the installer:**
   ```bash
   ./install.sh
   ```
   The script will:
   - Install the Claude Code plugin to `~/.claude/plugins/local/`
   - Install command files to `~/.claude/commands/hub/` (required for skills to appear)
   - Optionally customize the vault for your program name and command prefix
   - Verify the installation and print next steps

   Options: `--dry-run` to preview without changes, `--help` for usage.

4. **Open in Obsidian:**
   - Launch Obsidian
   - "Open folder as vault"
   - Select the `my-program-vault` directory

5. **Verify setup:**
   - Restart Claude Code (required to load skills)
   - Navigate to vault: `cd my-program-vault && claude`
   - Test: `/hub:help` should list all available skills

**Detailed guide:** See `QUICK-START.md` for complete 30-minute setup walkthrough.

## Directory Structure

```
hardware-npi-template/
├── Builds/                      # Build phase documentation
│   └── Proto/                   # Example: Proto build phase
│       ├── Build Reports/       # Daily build reports
│       ├── Weekly Reports/      # Weekly summaries (generated)
│       └── Proto-Build-Summary.md  # Complete overview (generated)
│
├── Communication/               # Stakeholder communications
│   ├── Daily-Updates/          # Daily vault summaries
│   └── Weekly-Updates/         # Weekly reports
│
├── Decisions/                   # Strategic and tactical decisions
│   └── ✅ Decided/             # Finalized decisions
│
├── Meetings/                    # Meeting notes and agendas
│
├── Quality/                     # Quality tracking
│   ├── MIL/                    # Manufacturing Issue Log
│   └── Changes/                # Change log tracking
│
├── Technical-Notes/             # Analysis and validation docs
│
├── Risks/                       # Risk register
│   └── ✅ Resolved/            # Resolved risks
│
├── Resources/                   # Templates and references
│   ├── Templates/              # Document templates
│   └── Automations/            # Automation documentation
│
├── Archive/                     # Archived content
│
├── CLAUDE.md                    # Claude Code instructions
├── README.md                    # This file
├── SETUP-GUIDE.md              # Claude setup documentation
├── GIT-SETUP-GUIDE.md          # Git configuration guide
├── GOOGLE-DRIVE-MCP-SETUP.md   # Google Drive MCP setup guide
├── TEMPLATE-CUSTOMIZATION.md   # How to adapt this template
├── .gitignore                   # Git ignore rules for Obsidian
└── .gitattributes              # Git attributes for text files
```

## Included Automations

### Claude Code Skills

Located in `~/.claude/plugins/local/hardware-npi-automation/` (rename for your program):

| Skill | Command | Purpose | Time |
|-------|---------|---------|------|
| **Help** | `/hub:help` | Show all available commands | Instant |
| **Weekly Report** | `/hub:weekly-report [date]` | Generate comprehensive weekly build status | ~5 min |
| **Build Summary** | `/hub:build-summary <phase>` | Generate 15-section build retrospective | ~10-20 min |
| **MIL Generator** | `/hub:mil <phase>` | Extract Manufacturing Issue Log from daily reports | ~2-5 min |
| **Master MIL** | `/hub:master-mil` | Aggregate issues across all build phases | ~5-10 min |
| **Readiness Assessment** | `/hub:readiness <phase>` | Generate build gate readiness assessment | ~5-10 min |
| **Build Comparator** | `/hub:compare <build1> <build2>` | Build-over-build quality analysis | ~5-10 min |
| **Core Team Agenda** | `/hub:agenda [date]` | Generate weekly core team meeting agenda | ~2-5 min |
| **Weekly Briefing** | `/hub:briefing [date]` | Personal weekly prep briefing | ~5 min |
| **Backlink Validator** | `/hub:backlinks` | Validate vault knowledge graph integrity | ~2 min |

### MCP Servers (pre-configured)

The `.claude/mcp.json` is checked into the repo and configures two MCP servers automatically:

| Server | Purpose | Auth |
|--------|---------|------|
| **Glean** | Enterprise search across your org's knowledge base | OAuth browser flow on first use |
| **Google Drive** | Sync documents from Drive into the vault | OAuth — see `GOOGLE-DRIVE-MCP-SETUP.md` |

### Available Templates

Located in `Resources/Templates/`:
- Daily build report template
- Weekly report template
- Decision document template
- Risk document template
- Meeting agenda template

## File Naming Conventions

**Daily Build Reports**: `YYYY-MM-DD-[Program]-[Phase]-DX.md`
- Example: `2026-02-02-MyProgram-Proto-D1.md`

**Weekly Reports**: `YYYY-MM-DD-[Program]-Weekly.md`
- Example: `2026-02-07-MyProgram-Weekly.md`

**Decision Documents**: `YYYY-MM-DD-[Program]-Decision-[Topic].md`
- Example: `2026-01-15-MyProgram-Decision-ATE-Strategy.md`

**Risk Documents**: `RISK-XXX-[Program]-[Title].md`
- Example: `RISK-001-MyProgram-Battery-Life.md`

**Meeting Notes**: `YYYY-MM-DD-[Program]-[Meeting-Type].md`
- Example: `2026-02-03-MyProgram-Core-Team-Agenda.md`

**Date Format**: Always use **YYYY-MM-DD** for sortability

## Customization Guide

See `Resources/Templates/TEMPLATE-CUSTOMIZATION.md` for detailed instructions on:
- Renaming the program to match your program name
- Updating automation skills
- Customizing CLAUDE.md
- Adapting templates
- Adding new build phases
- Extending automation

## Requirements

- **Obsidian** - https://obsidian.md/
- **Claude Code** - https://claude.ai/code
- **uv** - For Glean MCP (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
- **Git** (optional) - For version control

## Documentation

- **CLAUDE.md** - Comprehensive instructions for Claude Code on how to work with this vault
- **SETUP-GUIDE.md** - Claude Code automation setup and usage
- **GIT-SETUP-GUIDE.md** - Git configuration and workflow
- **GOOGLE-DRIVE-MCP-SETUP.md** - Google Drive MCP server setup for document sync
- **Resources/Templates/TEMPLATE-CUSTOMIZATION.md** - How to adapt this template for your program

## Use Cases

This template is designed for:
- **Hardware NPI Programs** - Proto, EVT, DVT, PVT, MP phases
- **Build Tracking** - Daily status, issues, metrics
- **Cross-Functional Teams** - Engineering, manufacturing, quality, operations
- **Executive Reporting** - Weekly status, gate reviews, readiness assessments
- **Knowledge Management** - Decisions, risks, technical notes, meeting history

## Build Phases

The template supports multiple build phases:
- **Proto** (Prototype) - Initial prototypes for design validation
- **EVT** (Engineering Validation Test) - First builds to validate design
- **DVT** (Design Validation Test) - Design lock and validation at scale
- **PVT** (Production Validation Test) - Pre-production validation
- **MP** (Mass Production) - Full production ramp

Add new phases by creating directories under `Builds/` following the existing structure.

## Contributing

This template is based on production NPI program management workflows. Feedback and improvements welcome via issues and pull requests.

## License

This template is provided as-is for hardware program management. Adapt freely for your organization's needs.

---

**Version:** 1.0.0
**Last Updated:** 2026-02-24
