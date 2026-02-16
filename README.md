# K1 Kiosk - Hardware Build Tracking Template

**A comprehensive Obsidian vault template for hardware NPI (New Product Introduction) program management.**

This vault provides a complete framework for tracking hardware builds from prototype through production, with automated reporting, issue tracking, and knowledge management.

## 🎯 What This Template Provides

- **Daily Build Tracking** - Standardized daily build reports with consistent formatting
- **Automated Weekly Reports** - Claude Code skills for synthesizing weekly status
- **Manufacturing Issue Log (MIL)** - Structured issue tracking across build phases
- **Decision Documentation** - Formal decision log with metadata and rationale
- **Risk Management** - Risk register with tracking and mitigation plans
- **Meeting Documentation** - Organized meeting notes with backlinks
- **Backlink Validation** - Automated knowledge graph integrity checks
- **Git Integration** - Version control with proper .gitignore for Obsidian vaults

## 🚀 Quick Start

### For New Teams

1. **Clone this repository:**
   ```bash
   git clone <repository-url>
   cd k1-kiosk
   ```

2. **Customize for your program:**
   - Update `CLAUDE.md` with your program name (replace "K1" with your program)
   - Update plugin name in `~/.claude/plugins/local/` (rename `k1-automation` to `yourprogram-automation`)
   - Update skill names in SKILL.md files (replace `k1:` with `yourprogram:`)
   - Update vault paths in CLAUDE.md and SKILL.md files

3. **Open in Obsidian:**
   - Open Obsidian
   - "Open folder as vault"
   - Select the cloned directory

4. **Restart Claude Code:**
   - Skills will be recognized after restart
   - Navigate to your vault directory
   - Start using `/yourprogram:weekly-report` and other skills

## 📁 Directory Structure

```
k1-kiosk/
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
├── TEMPLATE-CUSTOMIZATION.md   # How to adapt this template
├── .gitignore                   # Git ignore rules for Obsidian
└── .gitattributes              # Git attributes for text files
```

## 🛠 Included Automations

### Claude Code Skills

Located in `~/.claude/plugins/local/k1-automation/` (rename for your program):

| Skill | Command | Purpose |
|-------|---------|---------|
| **Weekly Report** | `/k1:weekly-report [date]` | Generate comprehensive weekly build status |
| **Backlink Validator** | `/k1:backlink-validator` | Validate vault knowledge graph integrity |
| **MIL Generator** | `/k1:mil-generator` (future) | Extract MIL from daily reports |
| **Build Summary** | `/k1:build-summary` (future) | Generate build phase retrospective |

### Available Templates

Located in `Resources/Templates/`:
- Daily build report template
- Weekly report template
- Decision document template
- Risk document template
- Meeting agenda template

## 📋 File Naming Conventions

**Daily Build Reports**: `YYYY-MM-DD-[Program]-[Phase]-DX.md`
- Example: `2026-02-02-K1-Proto-D1.md`

**Weekly Reports**: `YYYY-MM-DD-[Program]-Weekly.md`
- Example: `2026-02-07-K1-Weekly.md`

**Decision Documents**: `YYYY-MM-DD-[Program]-Decision-[Topic].md`
- Example: `2026-01-15-K1-Decision-ATE-Strategy.md`

**Risk Documents**: `RISK-XXX-[Program]-[Title].md`
- Example: `RISK-001-K1-Battery-Life.md`

**Meeting Notes**: `YYYY-MM-DD-[Program]-[Meeting-Type].md`
- Example: `2026-02-03-K1-Core-Team-Agenda.md`

**Date Format**: Always use **YYYY-MM-DD** for sortability

## 🎨 Customization Guide

See `TEMPLATE-CUSTOMIZATION.md` for detailed instructions on:
- Renaming the program (K1 → Your Program)
- Updating automation skills
- Customizing CLAUDE.md
- Adapting templates
- Adding new build phases
- Extending automation

## 🔧 Requirements

- **Obsidian** - https://obsidian.md/
- **Claude Code** - https://claude.ai/code
- **Git** (optional) - For version control

## 📚 Documentation

- **CLAUDE.md** - Comprehensive instructions for Claude Code on how to work with this vault
- **SETUP-GUIDE.md** - Claude Code automation setup and usage
- **GIT-SETUP-GUIDE.md** - Git configuration and workflow
- **TEMPLATE-CUSTOMIZATION.md** - How to adapt this template for your program

## 🎯 Use Cases

This template is designed for:
- **Hardware NPI Programs** - EVT, DVT, PVT, MP phases
- **Build Tracking** - Daily status, issues, metrics
- **Cross-Functional Teams** - Engineering, manufacturing, quality, operations
- **Executive Reporting** - Weekly status, gate reviews, readiness assessments
- **Knowledge Management** - Decisions, risks, technical notes, meeting history

## 🏗 Build Phases

The template supports multiple build phases:
- **Proto** (Prototype) - Initial prototypes for design validation
- **EVT** (Engineering Validation Test) - First builds to validate design
- **DVT** (Design Validation Test) - Design lock and validation at scale
- **PVT** (Production Validation Test) - Pre-production validation
- **MP** (Mass Production) - Full production ramp

Add new phases by creating directories under `Builds/` following the existing structure.

## 🤝 Contributing

This template is based on production NPI program management workflows. Feedback and improvements welcome!

## 📄 License

This template is provided as-is for hardware program management. Adapt freely for your organization's needs.

## 🔗 Related

- **Original W3 Setup** - `/Users/jheckman/w3-hw-wallet/` (reference implementation)
- **Claude Code Documentation** - https://claude.ai/code
- **Obsidian Documentation** - https://help.obsidian.md/

---

**Version:** 1.0.0
**Last Updated:** 2026-02-12
**Maintained By:** Justin Heckman (justin@block.xyz)
