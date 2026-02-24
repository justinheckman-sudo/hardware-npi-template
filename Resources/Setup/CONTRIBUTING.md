# Contributing to Hardware NPI Tracking Template

Thank you for your interest in contributing! This template is designed to help hardware teams track NPI programs effectively.

## How to Contribute

### Reporting Issues

1. **Search existing issues** first to avoid duplicates
2. **Use issue templates** for bug reports and feature requests
3. **Provide details**: OS, Obsidian version, Claude Code version, steps to reproduce
4. **Include context**: How you're using the template, customizations made

### Suggesting Features

1. **Describe the use case** - What problem does this solve?
2. **Consider generalizability** - Would this help other teams?
3. **Propose implementation** - Ideas on how it could work
4. **Open discussion** - Use GitHub Discussions for RFC-style proposals

### Improving Documentation

Documentation improvements are always welcome!

**Good documentation PRs:**
- Fix typos or unclear instructions
- Add missing examples
- Improve troubleshooting sections
- Add use cases or tips
- Update outdated information

**Process:**
1. Fork the repository
2. Make changes to markdown files
3. Test that instructions still work
4. Submit PR with clear description

### Adding Features

Before starting significant work:

1. **Open an issue** to discuss the feature
2. **Get feedback** from maintainers
3. **Align on approach** before implementing
4. **Keep changes focused** - one feature per PR

### Improving Templates

Template improvements that help teams:
- Better structure or formatting
- Additional sections that are commonly needed
- Clearer placeholders or instructions
- More comprehensive examples

### Adding Automation Skills

New Claude Code skills should:
- Solve a common need across teams
- Have clear inputs and outputs
- Include comprehensive documentation
- Follow existing skill patterns
- Include validation checklists

**Required for new skills:**
1. SKILL.md in appropriate directory
2. Full documentation in CLAUDE.md
3. Updated plugin README
4. Example usage in SETUP-GUIDE
5. Testing with multiple scenarios

## Development Process

### Setting Up Development Environment

```bash
# Fork and clone
git clone https://github.com/yourusername/hardware-npi-template.git
cd hardware-npi-template

# Create a branch
git checkout -b feature/my-improvement

# Test your changes
# - Open in Obsidian
# - Test Claude Code skills
# - Verify customization process
# - Check all links work

# Commit with clear message
git commit -m "feat: add meeting agenda template

- New template for meeting agendas
- Added to Resources/Templates/
- Updated README to list new template
- Tested with sample data"

# Push and create PR
git push origin feature/my-improvement
```

### Commit Message Convention

Use conventional commits format:

- `feat:` - New feature or template
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `refactor:` - Restructuring without changing functionality
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

**Examples:**
```
feat: add MIL generator skill
fix: correct weekly report date calculation
docs: improve QUICK-START.md clarity
refactor: reorganize Resources directory
```

### Testing Checklist

Before submitting a PR:

- [ ] Fresh clone works
- [ ] Customization process works
- [ ] Claude Code skills function correctly
- [ ] Documentation is accurate
- [ ] Links are not broken
- [ ] No sensitive data included
- [ ] CHANGELOG updated (if significant)
- [ ] README updated (if structure changed)

## Code of Conduct

### Our Standards

- **Be respectful** - Treat others with respect and empathy
- **Be collaborative** - Work together, assume good intentions
- **Be constructive** - Provide helpful feedback
- **Be inclusive** - Welcome diverse perspectives

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or inflammatory comments
- Personal attacks
- Sharing private information
- Spam or off-topic content

## Questions?

- **General questions**: Open a GitHub Discussion
- **Bug reports**: Use bug report issue template
- **Feature ideas**: Use feature request template
- **Quick questions**: Comment on relevant issues

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md (if created)
- Acknowledged in CHANGELOG
- Credited in release notes

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make this template better for hardware teams! 🚀
