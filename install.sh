#!/usr/bin/env bash
# =============================================================================
# Hardware NPI Template - Installer
#
# Usage:
#   ./install.sh              # Install with defaults (K1/hub: prefix)
#   ./install.sh --dry-run    # Preview what would happen
#   ./install.sh --help       # Show usage
#
# What this does:
#   1. Installs the Claude Code plugin from .claude-plugin-template/
#   2. Optionally customizes the vault for your program name
# =============================================================================

set -euo pipefail

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# --- Globals ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT_DIR="$SCRIPT_DIR"
PLUGIN_SOURCE="$VAULT_DIR/.claude-plugin-template"
PLUGINS_ROOT="$HOME/.claude/plugins/local"
DEFAULT_PLUGIN_NAME="hardware-npi-automation"
DRY_RUN=false
ERRORS=0

# --- Helpers ---
h1()      { echo -e "\n${BOLD}${BLUE}$*${NC}\n"; }
h2()      { echo -e "${BOLD}$*${NC}"; }
ok()      { echo -e "  ${GREEN}✓${NC}  $*"; }
warn()    { echo -e "  ${YELLOW}!${NC}  $*"; }
err()     { echo -e "  ${RED}✗${NC}  $*"; ((ERRORS++)) || true; }
info()    { echo -e "  ${DIM}→${NC}  $*"; }
step()    { echo -e "\n${CYAN}▶${NC} ${BOLD}$*${NC}"; }
divider() { echo -e "${DIM}─────────────────────────────────────────${NC}"; }

# Prompt with a default value shown in brackets
prompt() {
    local msg="$1"
    local default="${2:-}"
    local answer
    if [[ -n "$default" ]]; then
        read -r -p "    $msg [$default]: " answer
        echo "${answer:-$default}"
    else
        read -r -p "    $msg: " answer
        echo "$answer"
    fi
}

yes_no() {
    local msg="$1"
    local default="${2:-N}"
    local answer
    read -r -p "    $msg (y/N): " answer
    answer="${answer:-$default}"
    [[ "$answer" =~ ^[Yy]$ ]]
}

# Safe sed that works on both macOS (BSD) and Linux
sed_inplace() {
    local pattern="$1"
    local file="$2"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "$pattern" "$file"
    else
        sed -i "$pattern" "$file"
    fi
}

# =============================================================================
# Argument parsing
# =============================================================================

for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=true ;;
        --help|-h)
            echo "Usage: ./install.sh [--dry-run] [--help]"
            echo ""
            echo "  --dry-run   Show what would be done without making changes"
            echo "  --help      Show this help"
            exit 0
            ;;
        *) echo "Unknown argument: $arg"; exit 1 ;;
    esac
done

# =============================================================================
# Header
# =============================================================================

echo ""
echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${BLUE}║   Hardware NPI Template — Setup v1.0     ║${NC}"
echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${NC}"

if $DRY_RUN; then
    echo -e "\n  ${YELLOW}DRY RUN — no changes will be made${NC}"
fi

# =============================================================================
# Step 1: Verify we're in the vault root
# =============================================================================

step "Checking vault directory"

if [[ ! -f "$VAULT_DIR/CLAUDE.md" ]]; then
    err "CLAUDE.md not found. Are you running this from the vault root?"
    info "Run: cd <vault-directory> && ./install.sh"
    exit 1
fi
ok "Vault root: $VAULT_DIR"

if [[ ! -d "$PLUGIN_SOURCE" ]]; then
    err ".claude-plugin-template/ not found."
    info "This directory is required. Re-clone the repository."
    exit 1
fi
ok "Plugin source: $PLUGIN_SOURCE"

# =============================================================================
# Step 2: Check prerequisites
# =============================================================================

step "Checking prerequisites"

# Claude Code
if command -v claude &>/dev/null; then
    ok "Claude Code: $(command -v claude)"
else
    warn "Claude Code not found in PATH"
    info "Install from: https://claude.ai/code"
    info "You can still install the plugin now and set up Claude Code later."
fi

# Git (optional)
if command -v git &>/dev/null; then
    ok "Git: $(command -v git)"
else
    info "Git not installed (optional — needed for version control)"
fi

# uv (required for Glean MCP)
if command -v uv &>/dev/null; then
    ok "uv: $(command -v uv)"
else
    warn "uv not found — required for Glean MCP"
    info "Install: curl -LsSf https://astral.sh/uv/install.sh | sh"
fi

# =============================================================================
# Step 3: Customization (optional)
# =============================================================================

step "Customization"

echo ""
echo -e "  This template is pre-configured for the ${BOLD}K1${NC} program with the ${BOLD}/hub:${NC} command prefix."
echo -e "  You can use it as-is, or customize it for your program now."
echo ""

CUSTOMIZE=false
if yes_no "Customize for your program?"; then
    CUSTOMIZE=true
fi

PROGRAM_NAME="K1"
VAULT_NAME="$(basename "$VAULT_DIR")"
CMD_PREFIX="hub"
VAULT_PATH="$VAULT_DIR"
PLUGIN_NAME="$DEFAULT_PLUGIN_NAME"

if $CUSTOMIZE; then
    echo ""
    PROGRAM_NAME="$(prompt "Program name (used in filenames and docs, e.g. W3, Bitkey)" "K1")"
    VAULT_NAME="$(prompt "Vault directory name" "$(basename "$VAULT_DIR")")"
    CMD_PREFIX="$(prompt "Claude Code command prefix (e.g. hub, w3, k1)" "hub")"

    echo ""
    info "PROGRAM_NAME = $PROGRAM_NAME"
    info "VAULT_NAME   = $VAULT_NAME"
    info "CMD_PREFIX   = $CMD_PREFIX"
    info "VAULT_PATH   = $VAULT_PATH"
    echo ""

    if ! yes_no "Proceed with these settings?"; then
        echo ""
        warn "Aborted. Re-run install.sh to try again."
        exit 0
    fi
fi

# =============================================================================
# Step 4: Install Claude Code plugin
# =============================================================================

step "Installing Claude Code plugin"

PLUGIN_DIR="$PLUGINS_ROOT/$PLUGIN_NAME"

if [[ -d "$PLUGIN_DIR" ]]; then
    warn "Plugin already exists at $PLUGIN_DIR"
    if yes_no "Overwrite?"; then
        if ! $DRY_RUN; then
            rm -rf "$PLUGIN_DIR"
        fi
        info "Removed existing plugin"
    else
        info "Skipping plugin install (keeping existing)"
        PLUGIN_DIR=""  # signal to skip verify
    fi
fi

if [[ -n "$PLUGIN_DIR" ]]; then
    if ! $DRY_RUN; then
        mkdir -p "$PLUGINS_ROOT"
        cp -r "$PLUGIN_SOURCE" "$PLUGIN_DIR"
        ok "Plugin installed: $PLUGIN_DIR"
    else
        ok "[DRY RUN] Would copy $PLUGIN_SOURCE → $PLUGIN_DIR"
    fi
fi

# =============================================================================
# Step 4b: Install command files → ~/.claude/commands/<prefix>/
# =============================================================================
#
# Command files are what actually make skills visible in Claude Code.
# They live in ~/.claude/commands/<prefix>/ and are read directly by Claude Code.
# The plugin in ~/.claude/plugins/local/ is supplementary.

step "Installing command files"

CMD_DIR="$HOME/.claude/commands/$CMD_PREFIX"
CMD_SOURCE="$PLUGIN_SOURCE/commands"

if [[ -d "$CMD_SOURCE" ]] && ls "$CMD_SOURCE"/*.md &>/dev/null; then
    CMD_COUNT=$(ls "$CMD_SOURCE"/*.md | wc -l | tr -d ' ')
    if ! $DRY_RUN; then
        mkdir -p "$CMD_DIR"
        cp "$CMD_SOURCE"/*.md "$CMD_DIR/"
        ok "$CMD_COUNT command file(s) installed: $CMD_DIR"
        SKILL_NAMES=$(ls "$CMD_SOURCE"/*.md | xargs -I{} basename {} .md | tr '\n' ' ')
        info "Skills: $SKILL_NAMES"
    else
        ok "[DRY RUN] Would install $CMD_COUNT command file(s) to $CMD_DIR"
    fi
else
    warn "No command files found in $CMD_SOURCE"
    info "Skills may not appear in Claude Code. Re-clone the repository to fix."
fi

# =============================================================================
# Step 5: Apply customizations
# =============================================================================

if $CUSTOMIZE && [[ "$PROGRAM_NAME" != "K1" || "$CMD_PREFIX" != "hub" ]]; then
    step "Applying customizations"

    # Files to update in the vault
    MARKDOWN_FILES=(
        "$VAULT_DIR/CLAUDE.md"
        "$VAULT_DIR/README.md"
        "$VAULT_DIR/SETUP-GUIDE.md"
        "$VAULT_DIR/QUICK-START.md"
        "$VAULT_DIR/Resources/Templates/TEMPLATE-CUSTOMIZATION.md"
    )

    # Files in the installed plugin
    PLUGIN_FILES=()
    if [[ -n "$PLUGIN_DIR" ]] && [[ -d "$PLUGIN_DIR" ]]; then
        while IFS= read -r -d '' f; do
            PLUGIN_FILES+=("$f")
        done < <(find "$PLUGIN_DIR" -name "*.md" -o -name "*.json" -print0 2>/dev/null)
    fi

    # Installed command files (in ~/.claude/commands/<prefix>/)
    CMD_FILES=()
    if [[ -d "$CMD_DIR" ]]; then
        while IFS= read -r -d '' f; do
            CMD_FILES+=("$f")
        done < <(find "$CMD_DIR" -name "*.md" -print0 2>/dev/null)
    fi

    ALL_FILES=("${MARKDOWN_FILES[@]}" "${PLUGIN_FILES[@]}" "${CMD_FILES[@]}")

    for file in "${ALL_FILES[@]}"; do
        [[ -f "$file" ]] || continue

        changes=""

        # Replace program name (K1 → PROGRAM_NAME), case-sensitive
        if [[ "$PROGRAM_NAME" != "K1" ]]; then
            if grep -q "K1" "$file" 2>/dev/null; then
                changes="${changes}K1→${PROGRAM_NAME} "
                if ! $DRY_RUN; then
                    sed_inplace "s/K1/${PROGRAM_NAME}/g" "$file"
                fi
            fi
        fi

        # Replace command prefix (hub: → CMD_PREFIX:)
        if [[ "$CMD_PREFIX" != "hub" ]]; then
            if grep -q "hub:" "$file" 2>/dev/null; then
                changes="${changes}hub:→${CMD_PREFIX}: "
                if ! $DRY_RUN; then
                    sed_inplace "s/hub:/${CMD_PREFIX}:/g" "$file"
                fi
            fi
        fi

        # Replace vault path (/Users/jheckman/k1-kiosk → VAULT_PATH)
        ESCAPED_VAULT_PATH="${VAULT_PATH//\//\\/}"
        if grep -q "/Users/jheckman/k1-kiosk" "$file" 2>/dev/null; then
            changes="${changes}vault-path "
            if ! $DRY_RUN; then
                sed_inplace "s/\/Users\/jheckman\/k1-kiosk/${ESCAPED_VAULT_PATH}/g" "$file"
            fi
        fi

        # Replace vault name in paths (k1-kiosk → VAULT_NAME)
        if [[ "$VAULT_NAME" != "k1-kiosk" ]]; then
            if grep -q "k1-kiosk" "$file" 2>/dev/null; then
                changes="${changes}vault-name "
                if ! $DRY_RUN; then
                    sed_inplace "s/k1-kiosk/${VAULT_NAME}/g" "$file"
                fi
            fi
        fi

        if [[ -n "$changes" ]]; then
            ok "$(basename "$file")  ${DIM}(${changes})${NC}"
        fi
    done

    # Rename plugin directory if prefix changed
    if [[ "$CMD_PREFIX" != "hub" ]] && [[ -n "$PLUGIN_DIR" ]] && [[ -d "$PLUGIN_DIR" ]]; then
        NEW_PLUGIN_NAME="${PROGRAM_NAME,,}-automation"
        NEW_PLUGIN_DIR="$PLUGINS_ROOT/$NEW_PLUGIN_NAME"
        if ! $DRY_RUN; then
            mv "$PLUGIN_DIR" "$NEW_PLUGIN_DIR"
            ok "Plugin renamed: $NEW_PLUGIN_NAME"
        else
            ok "[DRY RUN] Would rename plugin to $NEW_PLUGIN_NAME"
        fi
        PLUGIN_DIR="$NEW_PLUGIN_DIR"
    fi
fi

# =============================================================================
# Step 6: Verify
# =============================================================================

step "Verifying installation"

VERIFY_DIR="${PLUGIN_DIR:-$PLUGINS_ROOT/$DEFAULT_PLUGIN_NAME}"

if $DRY_RUN; then
    ok "[DRY RUN] Would verify $VERIFY_DIR/.claude-plugin/plugin.json"
    ok "[DRY RUN] Would verify $CMD_DIR/*.md"
elif [[ -f "$VERIFY_DIR/.claude-plugin/plugin.json" ]]; then
    ok "Plugin JSON valid: $VERIFY_DIR/.claude-plugin/plugin.json"
    SKILL_COUNT=$(find "$VERIFY_DIR/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
    ok "$SKILL_COUNT SKILL.md file(s) in plugin"
else
    err "Plugin verification failed: $VERIFY_DIR/.claude-plugin/plugin.json not found"
fi

CMD_COUNT=$(ls "$CMD_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')
if [[ "$CMD_COUNT" -gt 0 ]]; then
    ok "$CMD_COUNT command file(s) active: $CMD_DIR"
else
    err "No command files found in $CMD_DIR — skills will not appear in Claude Code"
fi

# =============================================================================
# Summary
# =============================================================================

echo ""
divider

if [[ $ERRORS -gt 0 ]]; then
    echo -e "\n  ${RED}${BOLD}Setup completed with $ERRORS error(s).${NC}"
    echo -e "  Review the errors above and re-run install.sh."
else
    echo -e "\n  ${GREEN}${BOLD}Setup complete!${NC}"
fi

echo ""
h2 "Next steps:"
echo ""
echo -e "  ${BOLD}1.${NC} Open this vault in Obsidian:"
echo -e "       File → Open Folder as Vault → select ${BOLD}$(basename "$VAULT_DIR")${NC}"
echo ""
echo -e "  ${BOLD}2.${NC} Restart Claude Code (required to load skills)"
echo ""
echo -e "  ${BOLD}3.${NC} Start Claude Code in this vault:"
echo -e "       ${CYAN}cd ${VAULT_DIR}${NC}"
echo -e "       ${CYAN}claude${NC}"
echo ""
echo -e "  ${BOLD}4.${NC} Verify skills loaded:"
echo -e "       ${CYAN}/${CMD_PREFIX}:help${NC}"
echo ""

if $CUSTOMIZE && [[ "$PROGRAM_NAME" != "K1" ]]; then
    echo -e "  ${BOLD}5.${NC} For deeper customization, ask Claude Code:"
    echo -e "       ${DIM}\"Customize this template for my program [program details]\"${NC}"
    echo ""
fi

divider
echo ""
