#!/usr/bin/env bash
# Lightweight tests for install.sh
# Run: bash tests/test_install.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_SCRIPT="$SCRIPT_DIR/install.sh"

PASS=0
FAIL=0

pass() { PASS=$((PASS + 1)); echo "  ✓ $1"; }
fail() { FAIL=$((FAIL + 1)); echo "  ✗ $1"; }

echo "Running install.sh tests..."
echo ""

# ─── Test: install.sh exists and is executable ───────────
echo "Basics:"
if [[ -f "$INSTALL_SCRIPT" ]]; then
  pass "install.sh exists"
else
  fail "install.sh not found"
fi

if [[ -x "$INSTALL_SCRIPT" ]]; then
  pass "install.sh is executable"
else
  fail "install.sh is not executable"
fi

# ─── Test: No deprecated brew flags ─────────────────────
echo ""
echo "Deprecated flags:"
if grep -q -- '--no-lock' "$INSTALL_SCRIPT"; then
  fail "contains deprecated --no-lock flag (brew bundle removed this option)"
else
  pass "no deprecated --no-lock flag"
fi

if grep -q -- '--force-bottle' "$INSTALL_SCRIPT"; then
  fail "contains deprecated --force-bottle flag"
else
  pass "no deprecated --force-bottle flag"
fi

# ─── Test: Required functions are defined ────────────────
echo ""
echo "Required functions:"
REQUIRED_FUNCTIONS=(
  install_homebrew
  install_packages
  install_zinit
  install_tpm
  backup_existing
  stow_packages
  setup_git_identity
  set_default_shell
  install_tmux_plugins
  setup_atuin
  setup_bat
  main
)

for func in "${REQUIRED_FUNCTIONS[@]}"; do
  if grep -q "^${func}()" "$INSTALL_SCRIPT"; then
    pass "$func() defined"
  else
    fail "$func() not found"
  fi
done

# ─── Test: Script uses strict mode ──────────────────────
echo ""
echo "Safety:"
if head -5 "$INSTALL_SCRIPT" | grep -q 'set -euo pipefail'; then
  pass "strict mode enabled (set -euo pipefail)"
else
  fail "strict mode not set"
fi

if head -1 "$INSTALL_SCRIPT" | grep -qE '^#!/usr/bin/env bash|^#!/bin/bash'; then
  pass "has proper shebang"
else
  fail "missing or incorrect shebang"
fi

# ─── Test: Brewfile reference is valid ───────────────────
echo ""
echo "Dependencies:"
if [[ -f "$SCRIPT_DIR/Brewfile" ]]; then
  pass "Brewfile exists"
else
  fail "Brewfile not found (install_packages will fail)"
fi

if grep -q 'brew bundle' "$INSTALL_SCRIPT" && grep -q 'Brewfile' "$INSTALL_SCRIPT"; then
  pass "install_packages references Brewfile"
else
  fail "brew bundle / Brewfile reference missing"
fi

# ─── Test: Stow packages have matching directories ──────
echo ""
echo "Stow packages:"
STOW_PACKAGES=$(sed -n 's/.*packages=(\(.*\))/\1/p' "$INSTALL_SCRIPT" | tr ' ' '\n')
for pkg in $STOW_PACKAGES; do
  if [[ -d "$SCRIPT_DIR/$pkg" ]]; then
    pass "stow package directory exists: $pkg/"
  else
    fail "stow package directory missing: $pkg/"
  fi
done

# ─── Test: No hardcoded secrets ──────────────────────────
echo ""
echo "Security:"
if grep -qiE '(api_key|secret_key|password)\s*=' "$INSTALL_SCRIPT"; then
  fail "potential hardcoded secret found"
else
  pass "no hardcoded secrets"
fi

# ─── Summary ─────────────────────────────────────────────
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Results: $PASS passed, $FAIL failed"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

[[ $FAIL -eq 0 ]] && exit 0 || exit 1
