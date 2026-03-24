#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
ARCH="$(uname -m)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# ─── Install Homebrew ─────────────────────────────────────
install_homebrew() {
  if command -v brew &>/dev/null; then
    success "Homebrew already installed"
  else
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for this session
    if [[ "$OS" == "Darwin" ]]; then
      if [[ "$ARCH" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      else
        eval "$(/usr/local/bin/brew shellenv)"
      fi
    else
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    success "Homebrew installed"
  fi
}

# ─── Install Packages ────────────────────────────────────
install_packages() {
  info "Installing packages from Brewfile..."
  brew bundle --file="$DOTFILES/Brewfile" --no-lock
  success "Packages installed"
}

# ─── Install Zinit ────────────────────────────────────────
install_zinit() {
  local ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
  if [[ -d "$ZINIT_HOME" ]]; then
    success "Zinit already installed"
  else
    info "Installing Zinit..."
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    success "Zinit installed"
  fi
}

# ─── Install TPM (Tmux Plugin Manager) ───────────────────
install_tpm() {
  local TPM_DIR="$HOME/.tmux/plugins/tpm"
  if [[ -d "$TPM_DIR" ]]; then
    success "TPM already installed"
  else
    info "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    success "TPM installed"
  fi
}

# ─── Backup Existing Configs ─────────────────────────────
backup_existing() {
  local BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
  local NEEDS_BACKUP=false

  local FILES_TO_CHECK=(
    "$HOME/.zshrc"
    "$HOME/.zshenv"
    "$HOME/.gitconfig"
    "$HOME/.config/tmux/tmux.conf"
    "$HOME/.config/starship.toml"
    "$HOME/.config/nvim/init.lua"
    "$HOME/.config/bat/config"
    "$HOME/.config/ghostty/config"
    "$HOME/.config/lazygit/config.yml"
  )

  for file in "${FILES_TO_CHECK[@]}"; do
    if [[ -f "$file" && ! -L "$file" ]]; then
      NEEDS_BACKUP=true
      break
    fi
  done

  if $NEEDS_BACKUP; then
    info "Backing up existing configs to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    for file in "${FILES_TO_CHECK[@]}"; do
      if [[ -f "$file" && ! -L "$file" ]]; then
        local relative="${file#$HOME/}"
        mkdir -p "$BACKUP_DIR/$(dirname "$relative")"
        cp "$file" "$BACKUP_DIR/$relative"
        rm "$file"
        warn "Backed up and removed: $file"
      elif [[ -L "$file" ]]; then
        rm "$file"
      fi
    done
    success "Backup complete"
  fi
}

# ─── Stow Packages ───────────────────────────────────────
stow_packages() {
  info "Linking dotfiles with GNU Stow..."
  cd "$DOTFILES"

  local packages=(zsh tmux nvim starship git bat ghostty lazygit)
  for pkg in "${packages[@]}"; do
    if [[ -d "$pkg" ]]; then
      stow -v --restow --target="$HOME" "$pkg" 2>&1 | while read -r line; do
        echo "  $line"
      done
      success "Stowed: $pkg"
    fi
  done
}

# ─── Git Config (Personal Info) ──────────────────────────
setup_git_identity() {
  if [[ -f "$HOME/.gitconfig.local" ]]; then
    success "Git identity already configured (~/.gitconfig.local)"
    return
  fi

  echo ""
  info "Setting up Git identity..."
  read -rp "  Git name: " git_name
  read -rp "  Git email: " git_email

  cat > "$HOME/.gitconfig.local" <<EOF
[user]
  name = $git_name
  email = $git_email
EOF
  success "Git identity saved to ~/.gitconfig.local"
}

# ─── Set Zsh as Default Shell ─────────────────────────────
set_default_shell() {
  if [[ "$SHELL" == *"zsh"* ]]; then
    success "Zsh is already default shell"
  else
    info "Setting Zsh as default shell..."
    local ZSH_PATH
    ZSH_PATH="$(which zsh)"
    if ! grep -q "$ZSH_PATH" /etc/shells; then
      echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH_PATH"
    success "Default shell set to Zsh"
  fi
}

# ─── macOS Defaults ───────────────────────────────────────
setup_macos() {
  if [[ "$OS" != "Darwin" ]]; then return; fi

  info "Applying macOS defaults..."

  # Faster key repeat
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # Show hidden files in Finder
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Show path bar in Finder
  defaults write com.apple.finder ShowPathbar -bool true

  # Show status bar in Finder
  defaults write com.apple.finder ShowStatusBar -bool true

  # Disable press-and-hold for keys (enable key repeat)
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Show file extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  success "macOS defaults applied"
}

# ─── Install tmux plugins ────────────────────────────────
install_tmux_plugins() {
  if [[ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
    info "Installing tmux plugins..."
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
    success "Tmux plugins installed"
  fi
}

# ─── Main ─────────────────────────────────────────────────
main() {
  echo ""
  echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
  echo -e "${BLUE}║      Dotfiles Installation           ║${NC}"
  echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
  echo ""

  install_homebrew
  install_packages
  install_zinit
  install_tpm
  backup_existing
  stow_packages
  setup_git_identity
  set_default_shell
  setup_macos
  install_tmux_plugins

  echo ""
  success "All done! Restart your terminal or run: exec zsh"
  echo ""
  info "Post-install notes:"
  echo "  - In tmux, press Ctrl+Space then I to install tmux plugins"
  echo "  - Machine-specific config goes in ~/.zsh_local"
  echo "  - Git identity is in ~/.gitconfig.local"
  echo ""
}

main "$@"
