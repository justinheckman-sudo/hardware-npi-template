# Git Setup Guide for K1 Kiosk

This guide walks you through setting up git for the K1 kiosk Obsidian vault.

## Quick Setup

From the k1-kiosk directory:

```bash
# 1. Initialize git repository
git init

# 2. Add all files (respects .gitignore)
git add .

# 3. Create initial commit
git commit -m "Initial commit: K1 kiosk vault with Claude automation

- CLAUDE.md project instructions
- Daily build reports structure
- K1 automation plugin (weekly-report, backlink-validator)
- Git configuration (.gitignore, .gitattributes)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# 4. (Optional) Add remote repository
# git remote add origin <your-git-url>
# git push -u origin main
```

## What's Already Configured

### .gitignore
**Location:** `/Users/jheckman/k1-kiosk/.gitignore`

Configured to ignore:
- Obsidian workspace and cache files (`.obsidian/workspace.json`, `.obsidian/cache`)
- macOS system files (`.DS_Store`, `.AppleDouble`, etc.)
- Claude session data (`.claude/`)
- Backup files (`*.bak`, `*.backup`)
- Temporary files (`*.tmp`, `*.log`)
- Large binaries (`*.pdf`, `*.zip`)

### .gitattributes
**Location:** `/Users/jheckman/k1-kiosk/.gitattributes`

Configured for:
- LF line endings for markdown and JSON files
- Proper handling of Obsidian configuration files
- Binary file detection

## Recommended Git Workflow

### Daily Work

```bash
# Check what's changed
git status

# Review changes before committing
git diff

# Stage specific files
git add Builds/Proto/Build\ Reports/2026-02-12-K1-Proto-D9.md

# Or stage all changes
git add .

# Commit with descriptive message
git commit -m "Add K1 Proto D9 build report

- SMT progress: 95% complete
- FATP started with 45 units
- Resolved aura LED cable issue
- Updated material readiness status"

# Push to remote (if configured)
git push
```

### Best Practices for Documentation Repos

1. **Commit frequently:** Each daily report or significant update should be its own commit
2. **Clear commit messages:** Describe what changed and why
3. **Use conventional commits:** Prefix with type (feat:, fix:, docs:, chore:)
4. **Reference issues:** Include Jira/issue numbers in commits

### Example Commit Messages

**Good:**
```
docs(build): add K1 Proto Day 9 build report

- 95% SMT completion across MLB/SPE/Sensor
- FATP line started with initial 45 units
- Critical: Resolved aura LED cable pinout (EE-7235)
- Watching: ALS I2C rise time investigation ongoing
```

**Also Good:**
```
feat(automation): add weekly report generator skill

Implemented /k1:weekly-report skill to synthesize daily reports
into comprehensive weekly status. Generates executive-ready output
with build metrics, issues, and trends.
```

**Too vague:**
```
Update files
```

## Branching Strategy

For documentation repos, keep it simple:

### Simple Approach (Recommended)
- **`main`** branch only
- Commit directly to main
- All docs are collaborative and don't need review

### Team Collaboration Approach
- **`main`** - Stable documentation
- **Feature branches** - For major updates or restructuring
- **Pull requests** - For team review of significant changes

```bash
# Create feature branch
git checkout -b feature/weekly-reports

# Make changes, commit
git add .
git commit -m "Add weekly report template and automation"

# Push branch
git push -u origin feature/weekly-reports

# Create PR for review
# (Use GitHub/GitLab UI or gh CLI)
```

## Remote Repository Setup

### GitHub

```bash
# Create repo on GitHub first, then:
git remote add origin git@github.com:yourusername/k1-kiosk.git
git branch -M main
git push -u origin main
```

### GitLab

```bash
git remote add origin git@gitlab.com:yourusername/k1-kiosk.git
git branch -M main
git push -u origin main
```

### Private Git Server

```bash
git remote add origin user@server:/path/to/k1-kiosk.git
git push -u origin main
```

## What to Track vs Ignore

### ✅ DO Track (Already configured)
- All markdown files (`.md`)
- CLAUDE.md and setup guides
- Obsidian core configuration (`.obsidian/core-plugins.json`)
- Build reports and documentation
- Templates and resources
- README and documentation files

### ❌ DON'T Track (Already in .gitignore)
- Obsidian workspace files (user-specific UI state)
- Claude session data (local memory and state)
- macOS system files (.DS_Store)
- Backup files and temp files
- Large binaries (PDFs, ZIPs)
- Cache and lock files

## Syncing with Team

If collaborating with a team:

```bash
# Before starting work
git pull --rebase

# After work
git push

# If conflicts occur
git status  # Check conflicted files
# Edit files to resolve conflicts
git add <resolved-files>
git rebase --continue
```

## Advanced: Git Hooks

You can automate tasks with git hooks. Example: validate backlinks before commit.

**`.git/hooks/pre-commit`:**
```bash
#!/bin/bash
# Run backlink validator before commit
echo "Validating backlinks..."
# Add validation command here
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

## Comparing with W3 Setup

Your w3-hw-wallet has:
- ✅ Separate git repository
- ❌ No .gitignore (might want to add one)
- ✅ Git hooks configured (pre-commit)

Your k1-kiosk now has:
- ✅ Separate git repository (once initialized)
- ✅ Comprehensive .gitignore
- ✅ .gitattributes for consistent line endings
- ⚠️ Git hooks (can add if needed)

## Troubleshooting

**Problem:** Git tracking parent directory instead of k1-kiosk

**Solution:** Remove parent tracking:
```bash
# This is actually okay - w3-hw-wallet has its own .git
# k1-kiosk should have its own too after `git init`
```

**Problem:** Large files causing slow commits

**Solution:** Add to .gitignore:
```bash
echo "*.pdf" >> .gitignore
echo "*.zip" >> .gitignore
git rm --cached <large-file>
```

**Problem:** Merge conflicts in Obsidian workspace

**Solution:** These files are already ignored, but if needed:
```bash
# Take remote version
git checkout --theirs .obsidian/workspace.json

# Or take local version
git checkout --ours .obsidian/workspace.json
```

## Next Steps

1. **Initialize repository:**
   ```bash
   cd /Users/jheckman/k1-kiosk
   git init
   git add .
   git commit -m "Initial commit: K1 kiosk vault"
   ```

2. **Set up remote (optional):**
   - Create repo on GitHub/GitLab
   - Add remote and push

3. **Configure git:**
   ```bash
   git config user.name "Your Name"
   git config user.email "your.email@example.com"
   ```

4. **Start tracking changes:**
   - Commit daily reports as they're created
   - Commit automation improvements
   - Track vault structure changes

## Resources

- **Git Documentation:** https://git-scm.com/doc
- **GitHub Guides:** https://guides.github.com/
- **Obsidian + Git:** https://forum.obsidian.md/t/git-version-control/
- **Conventional Commits:** https://www.conventionalcommits.org/
