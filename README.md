<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" alt="Catppuccin" width="100">
  <br>
  dotfiles
  <br>
</h1>

<p align="center">
  <b>One command to set up a fully configured terminal environment on any machine.</b>
</p>

<p align="center">
  <a href="#-quick-start"><img src="https://img.shields.io/badge/-Install-cba6f7?style=for-the-badge&logo=gnu-bash&logoColor=1e1e2e" alt="Install"></a>
  <a href="#-what-you-get"><img src="https://img.shields.io/badge/-Features-89b4fa?style=for-the-badge&logo=starship&logoColor=1e1e2e" alt="Features"></a>
  <a href="#-customization"><img src="https://img.shields.io/badge/-Customize-a6e3a1?style=for-the-badge&logo=neovim&logoColor=1e1e2e" alt="Customize"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/theme-catppuccin%20mocha-cba6f7?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48L3N2Zz4=" alt="Catppuccin Mocha">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux-89b4fa?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/shell-zsh-a6e3a1?style=flat-square" alt="Shell">
  <img src="https://img.shields.io/badge/terminal-ghostty-f5c2e7?style=flat-square" alt="Terminal">
  <img src="https://img.shields.io/badge/editor-neovim-b4befe?style=flat-square" alt="Editor">
</p>

<br>

<p align="center">
  <img src="./demo.gif" alt="Demo" width="800">
</p>

---

## Quick Start

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cyvid7-Darus10/dotfiles/main/install.sh)"
```

Or clone manually:

```bash
git clone https://github.com/Cyvid7-Darus10/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

> The installer is **idempotent** -- it backs up existing configs, installs everything, and symlinks all configs. Safe to re-run.

---

## What You Get

| Category | Tool | Purpose |
|:---------|:-----|:--------|
| **Terminal** | [Ghostty](https://ghostty.org/) | GPU-accelerated, Metal-native terminal |
| **Shell** | Zsh + [Zinit](https://github.com/zdharma-continuum/zinit) | Async plugin loading, blazing fast startup |
| **Prompt** | [Starship](https://starship.rs/) | Context-aware prompt (git, languages, docker) |
| **Multiplexer** | [tmux](https://github.com/tmux/tmux) | Persistent sessions, pane splitting |
| **Editor** | [Neovim](https://neovim.io/) | Full IDE: LSP, autocomplete, fuzzy finder |
| **Navigation** | [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` that learns your directories |
| **File Manager** | [yazi](https://github.com/sxyazi/yazi) | Terminal file browser with previews |
| **History** | [Atuin](https://github.com/atuinsh/atuin) | SQLite-backed searchable shell history |
| **Git** | [lazygit](https://github.com/jesseduffield/lazygit) + [delta](https://github.com/dandavella/delta) | Visual TUI + beautiful diffs |
| **Theme** | Catppuccin Mocha | Consistent palette across every tool |
| **Font** | JetBrains Mono Nerd Font | Ligatures + icons everywhere |

---

## Modern CLI Replacements

Every legacy command is aliased to a faster, better alternative:

| You type | Runs | Upgrade |
|:---------|:-----|:--------|
| `ls` | [eza](https://github.com/eza-community/eza) | Icons, colors, git status |
| `ll` | `eza -la` | Long listing with hidden files |
| `lt` | `eza --tree` | Tree view (2 levels deep) |
| `cat` | [bat](https://github.com/sharkdp/bat) | Syntax highlighting + line numbers |
| `rm` | [trash](https://github.com/sindresorhus/trash-cli) | Safe delete (sends to system trash) |
| `vim` / `vi` | [nvim](https://neovim.io/) | Full IDE experience |

<details>
<summary><strong>Additional tools installed</strong></summary>

| Tool | Purpose |
|:-----|:--------|
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder for files, history, directories |
| [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) | Fast recursive code search |
| [fd](https://github.com/sharkdp/fd) | Fast, user-friendly file finder |
| [dust](https://github.com/bootandy/dust) | Intuitive disk usage analyzer |
| [sd](https://github.com/chmln/sd) | Simple find-and-replace |
| [btop](https://github.com/aristocratos/btop) | Resource monitor with a beautiful TUI |
| [delta](https://github.com/dandavella/delta) | Git diffs with syntax highlighting |
| [gh](https://cli.github.com/) | GitHub CLI for PRs, issues, repos |
| [mise](https://mise.jdx.dev/) | Polyglot version manager (node, python, go, etc.) |
| [direnv](https://direnv.net/) | Per-directory environment variables |
| [tldr](https://tldr.sh/) | Simplified, example-driven man pages |
| [jq](https://stedolan.github.io/jq/) / [yq](https://github.com/mikefarah/yq) | JSON / YAML processors |
| [hyperfine](https://github.com/sharkdp/hyperfine) | Command-line benchmarking |

> These tools use their own names -- they don't shadow core commands (`grep`, `find`, `du`, `sed`, `top`) to avoid breaking existing scripts.

</details>

---

## Key Bindings

### Shell Navigation

| Shortcut | Action |
|:---------|:-------|
| `z <query>` | Jump to best-matching directory |
| `zi` | Interactive directory picker (fzf) |
| `y` | Open yazi file manager |
| `..` / `...` / `....` | Go up 1 / 2 / 3 directories |
| `Ctrl+T` | Fuzzy find a file |
| `Alt+C` | Fuzzy cd into a directory |
| `Ctrl+R` | Atuin history search |

### tmux

Prefix key: **`Ctrl+Space`**

| Shortcut | Action |
|:---------|:-------|
| `Ctrl+h/j/k/l` | Navigate panes (works in Neovim too) |
| `Alt+H` / `Alt+L` | Previous / next window |
| `prefix + \|` | Split vertically |
| `prefix + -` | Split horizontally |
| `prefix + c` | New window |
| `prefix + o` | Session picker (fzf + zoxide) |
| `prefix + u` | Open URLs from terminal output |

<details>
<summary><strong>All tmux bindings</strong></summary>

| Shortcut | Action |
|:---------|:-------|
| `prefix + H/J/K/L` | Resize panes |
| `prefix + [` | Enter copy mode (vi keys) |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Yank to system clipboard |
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |
| `prefix + I` | Install plugins |

</details>

### Neovim

Leader key: **`Space`**

| Shortcut | Action |
|:---------|:-------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `-` | File explorer (oil.nvim) |
| `<leader>w` | Save |
| `<leader>fm` | Format file |

<details>
<summary><strong>All Neovim bindings</strong></summary>

**Navigation**

| Shortcut | Action |
|:---------|:-------|
| `Ctrl+h/j/k/l` | Navigate splits (and tmux panes) |
| `Ctrl+d` / `Ctrl+u` | Half-page scroll (centered) |
| `J` / `K` (visual) | Move selected lines |

**LSP**

| Shortcut | Action |
|:---------|:-------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>fd` | Diagnostics |

**Editing**

| Shortcut | Action |
|:---------|:-------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Comment selection |
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

</details>

---

## Git Workflow

### Aliases

| Alias | Command |
|:------|:--------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` / `gcm` | `git commit` / `git commit -m` |
| `gp` / `gpl` | `git push` / `git pull` |
| `gco` / `gcob` | `git checkout` / `git checkout -b` |
| `gd` | `git diff` (side-by-side with delta) |
| `gl` | Pretty log graph |
| `lg` | Open lazygit |

### Config Highlights

- **Delta** diffs with syntax highlighting and Catppuccin theme
- Auto-rebase on pull, auto-setup remote tracking
- **rerere** enabled (remembers conflict resolutions)
- Identity stored in `~/.gitconfig.local` (not tracked)

---

## Customization

### Machine-specific config

Create `~/.zsh_local` for per-machine overrides (not tracked):

```bash
export AWS_PROFILE=production
export PATH="$HOME/custom-tools/bin:$PATH"
alias deploy="./scripts/deploy.sh"
```

### Git identity

Auto-created by installer. Edit anytime:

```bash
git config --file ~/.gitconfig.local user.name "Your Name"
git config --file ~/.gitconfig.local user.email "you@example.com"
```

### Add packages

```bash
# Edit Brewfile, then:
brew bundle --file=~/dotfiles/Brewfile
```

### Manage language versions

```bash
mise use node@20        # Node.js
mise use python@3.12    # Python
mise use go@latest      # Go
mise ls                 # List installed
```

---

## What the Installer Does

```
 1. Install Homebrew (if missing)
 2. Install all packages from Brewfile
 3. Install Zinit (Zsh plugin manager)
 4. Install TPM (tmux plugin manager)
 5. Backup existing configs to ~/.dotfiles_backup/<timestamp>/
 6. Symlink all configs via GNU Stow
 7. Prompt for Git identity (saved to ~/.gitconfig.local)
 8. Set Zsh as default shell
 9. Apply macOS defaults (faster key repeat, show hidden files, etc.)
10. Install tmux plugins
11. Initialize Atuin history database
12. Build bat theme cache
```

---

## Directory Structure

```
dotfiles/
├── install.sh              # Bootstrap script (supports curl one-liner)
├── uninstall.sh            # Remove all symlinks
├── Brewfile                # Package manifest
├── demo.tape               # VHS script for demo GIF
├── tests/                  # Test suite
│   └── test_install.sh
├── zsh/                    # Shell config, plugins, aliases
├── tmux/                   # tmux config + plugins
├── nvim/                   # Neovim (single init.lua, full IDE)
├── starship/               # Prompt config
├── git/                    # Git config + global gitignore
├── bat/                    # Syntax highlighting theme
├── ghostty/                # Terminal emulator config
└── lazygit/                # Git TUI config
```

Each directory is a [GNU Stow](https://www.gnu.org/software/stow/) package -- Stow creates symlinks from the repo into `$HOME`.

---

## Uninstall

```bash
cd ~/dotfiles && ./uninstall.sh
```

Removes symlinks only. Your backups remain in `~/.dotfiles_backup/`.

## Update

```bash
cd ~/dotfiles && git pull && ./install.sh
```

---

<p align="center">
  <sub>Built with Catppuccin Mocha, managed with GNU Stow, powered by Homebrew.</sub>
</p>
