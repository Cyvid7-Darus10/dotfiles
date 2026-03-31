#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

echo ""
echo -e "${RED}Unlinking dotfiles...${NC}"
echo ""

cd "$DOTFILES"
for pkg in zsh tmux nvim starship git bat ghostty lazygit; do
  if [[ -d "$pkg" ]]; then
    local_output="$(stow -v --delete --target="$HOME" "$pkg" 2>&1)" || {
      error "Failed to unstow: $pkg"
      echo "$local_output"
      continue
    }
    [[ -n "$local_output" ]] && echo "$local_output" | sed 's/^/  /'
    success "Unstowed: $pkg"
  fi
done

echo ""
info "Dotfiles unlinked. Your backup is in ~/.dotfiles_backup/"
info "To restore, copy files from the backup directory to their original locations."
echo ""
