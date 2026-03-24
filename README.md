# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

![Catppuccin Mocha](https://img.shields.io/badge/theme-catppuccin%20mocha-cba6f7?style=flat-square)

## What's Included

| Package | Tool | Description |
|---------|------|-------------|
| `zsh` | Zsh + Zinit | Shell config with async plugins, aliases, fzf integration |
| `tmux` | tmux + TPM | Terminal multiplexer with Catppuccin theme, vim navigation |
| `nvim` | Neovim + lazy.nvim | Editor with Telescope, Treesitter, git signs |
| `starship` | Starship | Cross-shell prompt with Catppuccin powerline |
| `git` | Git + Delta | Git config with side-by-side diffs, useful aliases |
| `bat` | bat | Syntax-highlighted cat replacement |
| `ghostty` | Ghostty | GPU-accelerated terminal emulator config |
| `lazygit` | lazygit | Terminal UI for git with Catppuccin theme |

## Quick Start

### One-liner (fresh machine)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/dotfiles/main/install.sh)"
```

### Manual

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## What the installer does

1. Installs [Homebrew](https://brew.sh) (if not present)
2. Installs all packages from `Brewfile`
3. Installs [Zinit](https://github.com/zdharma-continuum/zinit) (Zsh plugin manager)
4. Installs [TPM](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
5. Backs up existing configs to `~/.dotfiles_backup/`
6. Symlinks all configs via GNU Stow
7. Prompts for Git identity (saved to `~/.gitconfig.local`)
8. Applies sensible macOS defaults (if on macOS)
9. Installs tmux plugins

## Key Bindings

### tmux

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Prefix (replaces `Ctrl+b`) |
| `Ctrl+h/j/k/l` | Navigate panes (works in Neovim too) |
| `Alt+H / Alt+L` | Previous / Next window |
| `prefix + \|` | Vertical split |
| `prefix + -` | Horizontal split |
| `prefix + r` | Reload config |
| `prefix + I` | Install plugins |
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |

### Neovim

| Key | Action |
|-----|--------|
| `Space` | Leader key |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `gcc` | Toggle comment |

## CLI Tools Installed

| Tool | Replaces | Purpose |
|------|----------|---------|
| `fzf` | — | Fuzzy finder for everything |
| `ripgrep` | grep | Fast code search |
| `bat` | cat | Syntax highlighting |
| `eza` | ls | Icons, git status, tree view |
| `zoxide` | cd | Smart directory jumping |
| `fd` | find | Intuitive file finding |
| `delta` | diff | Beautiful git diffs |
| `lazygit` | — | Git TUI |
| `btop` | htop | System monitor |
| `mise` | nvm/pyenv | Polyglot version manager |
| `direnv` | — | Per-directory env vars |

## Customization

- **Machine-specific shell config:** `~/.zsh_local` (not tracked)
- **Git identity:** `~/.gitconfig.local` (not tracked)
- **Add packages:** Edit `Brewfile` and run `brew bundle`

## Uninstall

```bash
cd ~/dotfiles
./uninstall.sh
```

This removes symlinks only — your backup is in `~/.dotfiles_backup/`.
