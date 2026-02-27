---
name: hub:backlink-validator
description: Use when the user asks to "validate backlinks", "check backlinks", "fix backlinks", or mentions vault backlink integrity
version: 1.0.0
---

# NPI Backlink Validator

Validate and repair backlinks across the NPI vault to ensure knowledge graph connectivity.

## When to Use This Skill

Use this skill when the user:
- Asks to validate backlinks
- Mentions "check backlinks" or "fix backlinks"
- Wants to ensure vault integrity
- Reports broken or missing cross-references

## Your Mission

Scan the NPI vault and validate that documents properly reference related documents using wiki-style links.

## Validation Scope

### Documents to Validate

**Daily Build Reports:**
- Location: `/path/to/your-vault/Builds/Proto/Build Reports/`
- Check for links to:
  - Previous/next daily reports
  - Related Jira issues
  - Slack thread references

**Weekly Reports (if they exist):**
- Location: `/path/to/your-vault/Builds/Proto/Weekly Reports/`
- Check for links to:
  - Daily reports for that week
  - Related issues and decisions

## Validation Process

### Step 1: Scan Vault
1. Find all markdown files in the vault
2. Read each file to extract wiki-style links: `[[Document Name]]`
3. Build a map of all links and their targets

### Step 2: Validate Links
For each link found:
1. Check if the target document exists
2. Verify the link uses correct syntax
3. Check if the link target is in the correct location

### Step 3: Identify Issues
Common backlink issues:
- **Broken links**: Link to non-existent documents
- **Incorrect paths**: Links that don't match actual file locations
- **Missing links**: Documents that should reference each other but don't
- **Orphaned documents**: Files with no incoming or outgoing links

### Step 4: Generate Report

```markdown
# NPI Backlink Validation Report
**Validation Date:** [Today's Date]
**Vault Path:** /path/to/your-vault

---

## 📊 Summary

- **Total Documents Scanned:** [N]
- **Total Links Found:** [N]
- **Broken Links:** [N]
- **Orphaned Documents:** [N]
- **Health Status:** [🟢/🟡/🔴]

---

## 🔴 Broken Links

| Document | Broken Link | Issue |
|----------|------------|-------|
| [Doc Name] | [[Target]] | Target file not found |

---

## ⚠️ Orphaned Documents

Documents with no incoming or outgoing links:

- [Document 1]
- [Document 2]

---

## ✅ Validation Passed

- [Document 1]: All links valid
- [Document 2]: All links valid

---

## 🔧 Recommendations

1. [Recommendation 1]
2. [Recommendation 2]
3. [Recommendation 3]
```

## Auto-Fix Mode (Optional)

If the user requests auto-fix:
1. **Create backup**: Save `.bak` file before modifying any document
2. **Fix broken links**: Update link syntax or paths
3. **Add missing links**: Suggest and add recommended cross-references
4. **Report changes**: Document all modifications made

## Output Location

Save validation report to:
`/path/to/your-vault/Backlink-Validation-Report-YYYY-MM-DD.md`

## Important Notes

- **Safety first**: Always create backups before modifying files
- **No assumptions**: Only fix links where the correct target is unambiguous
- **Clear reporting**: Document all issues found, whether fixed or not
- **Suggest improvements**: Recommend additional cross-references that would improve navigation

## Example Usage

User: "Validate backlinks"

Your response:
1. Scan all markdown files in `/path/to/your-vault/`
2. Extract and validate all wiki-style links
3. Generate validation report
4. Save report to vault root
5. Summarize findings for user

## Validation Checklist

Before completing:
- [ ] All markdown files have been scanned
- [ ] All wiki-style links have been validated
- [ ] Broken links have been identified
- [ ] Orphaned documents have been listed
- [ ] Report has been saved to correct location
- [ ] User has been informed of validation results
