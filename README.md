# Dotfiles

One command to set up a fully configured terminal environment on any machine.

![Catppuccin Mocha](https://img.shields.io/badge/theme-catppuccin%20mocha-cba6f7?style=flat-square)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue?style=flat-square)
![Shell](https://img.shields.io/badge/shell-zsh-green?style=flat-square)

## Quick Start

```bash
# One-liner (fresh machine)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cyvid7-Darus10/dotfiles/main/install.sh)"

# Or clone manually
git clone https://github.com/Cyvid7-Darus10/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

The installer backs up your existing configs, installs everything, and symlinks all configs. It's idempotent -- safe to run again.

---

## What You Get

| Category | Tool | What It Does |
|----------|------|-------------|
| **Terminal** | [Ghostty](#why-ghostty) | GPU-accelerated terminal (fastest on macOS) |
| **Shell** | Zsh + [Zinit](#shell-plugins) | Fast shell with async plugin loading |
| **Prompt** | [Starship](#starship-prompt) | Informative prompt showing git, languages, time |
| **Multiplexer** | [tmux](#tmux) | Split panes, persistent sessions, survives reboots |
| **Editor** | [Neovim](#neovim) | Full IDE -- LSP, autocomplete, fuzzy finder, formatter |
| **Navigation** | [zoxide](#smart-navigation-z) (`z`) | Smart `cd` that learns your directories |
| **File Manager** | [yazi](#file-manager-y) (`y`) | Browse files with previews and vim keys |
| **History** | [atuin](#shell-history-atuin) | SQLite-backed searchable command history |
| **Git** | [lazygit](#git) + [delta](#git) | Visual git TUI + beautiful diffs |
| **Theme** | Catppuccin Mocha | Consistent colors across every tool |
| **Font** | JetBrains Mono Nerd Font | Ligatures + icons everywhere |

---

## Modern CLI Replacements

Every old command is aliased to a faster, better alternative:

| You type | It actually runs | Upgrade |
|----------|-----------------|---------|
| `ls` | **eza** | Icons, colors, git status |
| `ll` | **eza -la** | Long list with all files |
| `lt` | **eza --tree** | Tree view (2 levels) |
| `cat` | **bat** | Syntax highlighting |
| `grep` | **ripgrep** | 10-100x faster search |
| `find` | **fd** | Intuitive, fast |
| `diff` | **delta** | Side-by-side with syntax colors |
| `du` | **dust** | Visual disk usage |
| `sed` | **sd** | Intuitive find-and-replace |
| `rm` | **trash** | Sends to trash (safe delete) |
| `top` | **btop** | Beautiful system monitor |
| `vim` | **nvim** | Neovim with IDE features |

<details>
<summary><strong>Other tools installed</strong></summary>

| Tool | What It Does |
|------|-------------|
| **fzf** | Fuzzy finder (files, history, directories) |
| **gh** | GitHub CLI (PRs, issues from terminal) |
| **mise** | Version manager (replaces nvm, pyenv, rbenv) |
| **direnv** | Per-directory environment variables |
| **tldr** | Simplified man pages with examples |
| **jq** / **yq** | JSON and YAML processors |
| **hyperfine** | Command-line benchmarking |
| **tree** | Directory tree viewer |
| **wget** | HTTP downloader |

</details>

---

## Smart Navigation (`z`)

[Zoxide](https://github.com/ajeetdsouza/zoxide) replaces `cd`. It learns which directories you visit and lets you jump with fuzzy matching.

```bash
z projects         # Jump to best match for "projects"
z side project     # Multiple keywords work
z dot              # Jump to ~/dotfiles
zi                 # Interactive mode with fzf
zi projects        # Interactive with pre-filled query
z -                # Go back to previous directory
```

The more you use it, the smarter it gets.

### Other navigation shortcuts

| Command | Action |
|---------|--------|
| `..` | Go up one directory |
| `...` | Go up two directories |
| `....` | Go up three directories |
| `-` | Previous directory |
| `Ctrl+T` | Fuzzy find a file (fzf) |
| `Alt+C` | Fuzzy find a directory and cd into it (fzf) |

---

## File Manager (`y`)

[Yazi](https://github.com/sxyazi/yazi) is a terminal file manager with image previews, tabs, and vim keybindings.

```bash
y                  # Open in current directory
y ~/projects       # Open in specific directory
```

- Navigate with `h/j/k/l`
- Preview files, images, PDFs
- When you quit (`q`), your shell follows to wherever you navigated

---

## Shell History (Atuin)

[Atuin](https://github.com/atuinsh/atuin) replaces `Ctrl+R` with a searchable SQLite history:

- Fuzzy search with context (which directory, how long it took, exit code)
- Never lose history again
- Optional encrypted cross-machine sync

```bash
atuin register     # Set up sync (optional)
atuin import       # Import existing zsh history
```

---

## tmux

Terminal multiplexer -- split your terminal into panes, create windows, and sessions that survive disconnects and reboots.

**Prefix key: `Ctrl+Space`** (press this before tmux commands)

### Most used keys

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Move between panes (also works in Neovim) |
| `Alt+H` / `Alt+L` | Previous / Next window |
| `prefix + \|` | Split vertically (side by side) |
| `prefix + -` | Split horizontally (top/bottom) |
| `prefix + c` | New window |
| `prefix + o` | Session picker (fzf + zoxide) |
| `prefix + u` | Open URLs from terminal output |
| `prefix + r` | Reload config |

<details>
<summary><strong>All tmux keybindings</strong></summary>

#### Pane resizing

| Key | Action |
|-----|--------|
| `prefix + H` | Resize left |
| `prefix + J` | Resize down |
| `prefix + K` | Resize up |
| `prefix + L` | Resize right |

#### Copy mode (Vi)

| Key | Action |
|-----|--------|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `Ctrl+v` | Rectangle selection |
| `y` | Copy and exit |

#### Session management

| Key | Action |
|-----|--------|
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |
| `prefix + I` | Install plugins |
| `prefix + U` | Update plugins |

</details>

### Plugins

| Plugin | What It Does |
|--------|-------------|
| **vim-tmux-navigator** | `Ctrl+h/j/k/l` works across tmux panes AND Neovim splits |
| **catppuccin/tmux** | Catppuccin Mocha theme |
| **tmux-resurrect** | Save/restore sessions across restarts |
| **tmux-continuum** | Auto-save sessions every 15 minutes |
| **tmux-sessionx** | fzf session picker with zoxide integration |
| **tmux-fzf-url** | Pick and open URLs from terminal output |
| **tmux-yank** | System clipboard integration |

Sessions auto-save and auto-restore. Reboot and pick up where you left off.

---

## Neovim

Single-file config (`init.lua`) with full IDE features. Plugins auto-install on first launch.

### Most used keys

Leader key is **`Space`**.

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Search in files (live grep) |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `-` | Open file explorer |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>fm` | Format file |

<details>
<summary><strong>All Neovim keybindings</strong></summary>

#### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate splits (and tmux panes) |
| `Ctrl+d` / `Ctrl+u` | Scroll half page (cursor centered) |
| `J` / `K` (visual) | Move selected lines |
| `<leader>p` (visual) | Paste without overwriting register |

#### LSP (works when a language server is attached)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>D` | Type definition |
| `<leader>fd` | Diagnostics |

#### Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Comment selection |
| `ys{motion}{char}` | Add surround (e.g., `ysiw"`) |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

</details>

### What's included

| Feature | Plugin |
|---------|--------|
| **Theme** | Catppuccin Mocha |
| **Fuzzy finder** | telescope.nvim (files, grep, buffers) |
| **Syntax highlighting** | treesitter (auto-installs parsers) |
| **LSP** | mason + lspconfig (auto-installs servers) |
| **Autocomplete** | nvim-cmp (LSP, snippets, paths, buffer) |
| **Formatter** | conform.nvim (prettier, black, gofmt, etc.) |
| **File explorer** | oil.nvim (edit filesystem like a buffer) |
| **Git indicators** | gitsigns (change markers in gutter) |
| **Status line** | lualine (Catppuccin themed) |
| **Key hints** | which-key (shows bindings as you type) |
| **Tmux integration** | vim-tmux-navigator (seamless pane switching) |
| **Snippets** | LuaSnip + friendly-snippets (VS Code library) |
| **Todo highlights** | todo-comments (TODO/FIXME/HACK/NOTE) |
| **Indent guides** | indent-blankline |
| **Utilities** | mini.nvim (auto pairs, surround, commenting) |

### LSP servers (auto-installed)

- **ts_ls** -- TypeScript/JavaScript
- **pyright** -- Python
- **lua_ls** -- Lua

Install more with `:Mason`.

---

## Git

### Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` / `gcm` | `git commit` / `git commit -m` |
| `gp` / `gpl` | `git push` / `git pull` |
| `gco` / `gcob` | `git checkout` / `git checkout -b` |
| `gd` | `git diff` (with delta: side-by-side, syntax highlighted) |
| `gl` | Pretty git log graph |
| `gst` / `gstp` | `git stash` / `git stash pop` |
| `lg` | Open **lazygit** (visual git TUI) |

### Config highlights

- **Delta** for diffs -- side-by-side with syntax highlighting and Catppuccin theme
- **Auto-rebase** on pull, **auto-setup remote** on push
- **rerere** -- remembers how you resolved merge conflicts
- **GitHub CLI** as credential helper
- Identity stored in `~/.gitconfig.local` (not tracked)

---

## Starship Prompt

Catppuccin-themed powerline prompt showing:

- OS icon (macOS/Linux) + current directory
- Git branch and status (ahead/behind, modified, staged)
- Language versions (Node.js, Python, Rust, Go) -- only when relevant
- Docker context + clock
- Green/red indicator for last command's exit code

---

## Why Ghostty?

[Ghostty](https://ghostty.org/) is the terminal emulator in this setup. Created by **Mitchell Hashimoto** (Terraform, Vagrant), launched Dec 2024, 45k+ GitHub stars.

| Terminal | Speed | RAM | Config | Best For |
|----------|-------|-----|--------|----------|
| **Ghostty** | Fastest (Metal GPU) | ~60-100MB | Text file | **Best overall on macOS** |
| **WezTerm** | Fast | Higher | Lua script | Most scriptable |
| **Kitty** | Fast | ~60-100MB | Text file | Best on Linux |
| **Alacritty** | Fast | ~30MB | TOML file | Minimalism |
| **iTerm2** | Slowest | ~200MB+ | GUI prefs | Familiarity |

**Why Ghostty for dotfiles:** plain text config syncs with git (unlike iTerm2's binary prefs), built-in Catppuccin, native macOS app, non-profit backed.

> Everything else in this repo works in **any terminal**. Ghostty is optional.

### Config included

JetBrains Mono Nerd Font 14pt, Catppuccin Mocha, hidden title bar, block cursor, copy on select.

---

## Shell Plugins

Managed by [Zinit](https://github.com/zdharma-continuum/zinit) with async turbo loading (plugins load in background after prompt appears).

| Plugin | What It Does |
|--------|-------------|
| **fast-syntax-highlighting** | Colors commands as you type (valid = green, error = red) |
| **zsh-autosuggestions** | Ghost text suggestions from history (press right arrow to accept) |
| **zsh-completions** | Extra tab-completion definitions |
| **fzf-tab** | Replaces default tab completion with fzf fuzzy matching |

Plus cherry-picked Oh-My-Zsh libraries (git, history, key-bindings, completion, directories) and plugins (git, docker, docker-compose, command-not-found).

---

## Customization

### Machine-specific config

Create `~/.zsh_local` (not tracked in git):

```bash
export AWS_PROFILE=production
export PATH="$HOME/custom-tools/bin:$PATH"
alias deploy="./scripts/deploy.sh"
```

### Git identity

Created automatically by the installer. Edit `~/.gitconfig.local`:

```ini
[user]
  name = Your Name
  email = you@example.com
```

### Add packages

```bash
# Edit Brewfile, then:
brew bundle --file=~/dotfiles/Brewfile
```

### Manage language versions (mise)

```bash
mise use node@20       # Node.js
mise use python@3.12   # Python
mise use go@latest     # Go
mise ls                # List installed
```

---

## What the Installer Does

| Step | Action |
|------|--------|
| 1 | Installs **Homebrew** (if missing) |
| 2 | Installs all packages from **Brewfile** |
| 3 | Installs **Zinit** (Zsh plugin manager) |
| 4 | Installs **TPM** (tmux plugin manager) |
| 5 | **Backs up** existing configs to `~/.dotfiles_backup/<timestamp>/` |
| 6 | **Symlinks** all configs via GNU Stow |
| 7 | Prompts for **Git identity** (saved to `~/.gitconfig.local`) |
| 8 | Sets **Zsh** as default shell |
| 9 | Applies **macOS defaults** (faster key repeat, show hidden files, etc.) |
| 10 | Installs **tmux plugins** |
| 11 | Initializes **Atuin** history database |
| 12 | Builds **bat** theme cache |

---

## Directory Structure

```
dotfiles/
├── install.sh              # Bootstrap (supports one-liner curl)
├── uninstall.sh            # Remove all symlinks
├── Brewfile                # All packages
├── zsh/.zshrc              # Shell config, plugins, aliases
├── zsh/.zshenv             # Environment vars, Homebrew path
├── tmux/.config/tmux/      # tmux config + plugins
├── nvim/.config/nvim/      # Neovim (single init.lua, full IDE)
├── starship/.config/       # Prompt config
├── git/.gitconfig          # Git config (includes .gitconfig.local)
├── git/.config/git/ignore  # Global gitignore
├── bat/.config/bat/        # bat theme
├── ghostty/.config/ghostty # Terminal config
└── lazygit/.config/lazygit # Git TUI theme
```

Each directory is a [GNU Stow](https://www.gnu.org/software/stow/) package. Stow creates symlinks from the repo to your home directory.

---

## Uninstall

```bash
cd ~/dotfiles && ./uninstall.sh
```

Removes symlinks only. Backups are in `~/.dotfiles_backup/`.

## Update

```bash
cd ~/dotfiles && git pull && ./install.sh
```
