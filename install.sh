#!/usr/bin/env bash
set -euo pipefail

# ─── Support one-liner remote install ────────────────────
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cyvid7-Darus10/dotfiles/main/install.sh)"
if [[ ! -f "$(dirname "${BASH_SOURCE[0]:-./install.sh}")/Brewfile" ]]; then
  if [[ -d "$HOME/dotfiles" ]]; then
    echo "Updating existing dotfiles..."
    cd "$HOME/dotfiles"
    git pull
  else
    echo "Cloning dotfiles..."
    git clone https://github.com/Cyvid7-Darus10/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles"
  fi
  exec bash ./install.sh "$@"
fi

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
ARCH="$(uname -m)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }
step() { echo -e "\n${CYAN}━━━ $1 ━━━${NC}"; }

# ─── Install Homebrew ─────────────────────────────────────
install_homebrew() {
  step "Homebrew"
  if command -v brew &>/dev/null; then
    success "Homebrew already installed"
  else
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
  step "Packages (Brewfile)"
  info "Installing packages from Brewfile..."
  brew bundle --file="$DOTFILES/Brewfile" --no-lock
  success "Packages installed"
}

# ─── Install Zinit ────────────────────────────────────────
install_zinit() {
  step "Zinit (Zsh Plugin Manager)"
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
  step "TPM (Tmux Plugin Manager)"
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
  step "Backup Existing Configs"
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
        warn "Backed up: $file"
      elif [[ -L "$file" ]]; then
        rm "$file"
      fi
    done
    success "Backup complete at $BACKUP_DIR"
  else
    success "No existing configs to backup"
  fi
}

# ─── Stow Packages ───────────────────────────────────────
stow_packages() {
  step "Symlink Configs (GNU Stow)"
  cd "$DOTFILES"

  local packages=(zsh tmux nvim starship git bat ghostty lazygit)
  for pkg in "${packages[@]}"; do
    if [[ -d "$pkg" ]]; then
      local output
      output="$(stow -v --restow --target="$HOME" "$pkg" 2>&1)" || {
        error "Failed to stow: $pkg"
        echo "$output"
        continue
      }
      [[ -n "$output" ]] && echo "$output" | sed 's/^/  /'
      success "Stowed: $pkg"
    fi
  done
}

# ─── Git Config (Personal Info) ──────────────────────────
setup_git_identity() {
  step "Git Identity"
  if [[ -f "$HOME/.gitconfig.local" ]]; then
    success "Git identity already configured (~/.gitconfig.local)"
    return
  fi

  # Skip in non-interactive mode (e.g., piped install)
  if [[ ! -t 0 ]]; then
    warn "Non-interactive mode -- skipping Git identity setup"
    info "Run this later: git config --file ~/.gitconfig.local user.name 'Your Name'"
    info "                git config --file ~/.gitconfig.local user.email 'you@example.com'"
    return
  fi

  echo ""
  info "Setting up Git identity..."
  read -rp "  Git name: " git_name </dev/tty
  read -rp "  Git email: " git_email </dev/tty

  cat > "$HOME/.gitconfig.local" <<EOF
[user]
  name = $git_name
  email = $git_email
EOF
  success "Git identity saved to ~/.gitconfig.local"
}

# ─── Set Zsh as Default Shell ─────────────────────────────
set_default_shell() {
  step "Default Shell"
  if [[ "$SHELL" == *"zsh"* ]]; then
    success "Zsh is already default shell"
  else
    local ZSH_PATH
    ZSH_PATH="$(command -v zsh)"
    if [[ ! -t 0 ]]; then
      warn "Non-interactive mode -- skipping chsh (may require password)"
      info "Run this later: chsh -s $ZSH_PATH"
      return
    fi
    info "Setting Zsh as default shell..."
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
  step "macOS Defaults"

  # Faster key repeat
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # Show hidden files in Finder
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Show path bar and status bar in Finder
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true

  # Disable press-and-hold for keys (enable key repeat)
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Show file extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # Disable smart quotes and dashes (annoying when coding)
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  success "macOS defaults applied"
}

# ─── Install tmux plugins ────────────────────────────────
install_tmux_plugins() {
  step "Tmux Plugins"
  if [[ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
    info "Installing tmux plugins..."
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
    success "Tmux plugins installed"
  else
    warn "TPM not found, skipping tmux plugin install"
  fi
}

# ─── Setup Atuin ──────────────────────────────────────────
setup_atuin() {
  step "Atuin (Shell History)"
  if command -v atuin &>/dev/null; then
    if [[ ! -d "$HOME/.local/share/atuin" ]]; then
      info "Initializing Atuin..."
      atuin init zsh > /dev/null 2>&1 || true
    fi
    success "Atuin ready"
  else
    warn "Atuin not found, skipping"
  fi
}

# ─── Build bat cache (for Catppuccin theme) ──────────────
setup_bat() {
  step "bat Theme Cache"
  if command -v bat &>/dev/null; then
    bat cache --build 2>/dev/null || true
    success "bat cache built"
  fi
}

# ─── Main ─────────────────────────────────────────────────
main() {
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║       Dotfiles Installation            ║${NC}"
  echo -e "${CYAN}║       github.com/Cyvid7-Darus10       ║${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"

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
  setup_atuin
  setup_bat

  echo ""
  echo -e "${CYAN}━━━ Done! ━━━${NC}"
  echo ""
  success "Installation complete!"
  echo ""
  info "Next steps:"
  echo "  1. Restart your terminal or run: exec zsh"
  echo "  2. In tmux, press Ctrl+Space then I to install plugins"
  echo "  3. In Neovim, plugins will auto-install on first launch"
  echo ""
  info "Customization:"
  echo "  - Machine-specific shell config: ~/.zsh_local"
  echo "  - Git identity: ~/.gitconfig.local"
  echo "  - Atuin settings: atuin register / atuin login (optional sync)"
  echo ""
}

main "$@"
