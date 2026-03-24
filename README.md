# Dotfiles

Personal terminal environment managed with [GNU Stow](https://www.gnu.org/software/stow/). One command to set up a fully configured development machine.

![Catppuccin Mocha](https://img.shields.io/badge/theme-catppuccin%20mocha-cba6f7?style=flat-square)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue?style=flat-square)
![Shell](https://img.shields.io/badge/shell-zsh-green?style=flat-square)

## Features

- **One-command setup** -- run a single script to go from fresh machine to fully configured
- **Catppuccin Mocha theme** everywhere -- terminal, editor, tmux, git diffs, file manager, prompt
- **Smart directory navigation** with `z` (zoxide) -- learns your habits, jump anywhere
- **Fuzzy finding everything** -- files, history, directories, git branches, tmux sessions
- **Terminal file manager** (yazi) with image previews and vim keybindings
- **Shell history search** (atuin) with SQLite, fuzzy search, and optional cross-machine sync
- **Modern CLI replacements** -- `ls`, `cat`, `grep`, `find`, `diff`, `du`, `sed`, `rm` all upgraded
- **Neovim IDE** -- LSP, autocompletion, fuzzy finder, git integration, formatter
- **tmux** with session persistence, vim navigation, and session picker
- **Automatic backup** of existing configs before overwriting
- **Cross-platform** -- works on macOS (Intel + Apple Silicon) and Linux

---

## Quick Start

### One-liner (fresh machine)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cyvid7-Darus10/dotfiles/main/install.sh)"
```

### Manual

```bash
git clone https://github.com/Cyvid7-Darus10/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

---

## What Gets Installed

### The installer does the following (in order):

| Step | What | Details |
|------|------|---------|
| 1 | **Homebrew** | Package manager (if not installed) |
| 2 | **Brewfile packages** | All CLI tools, fonts, and casks |
| 3 | **Zinit** | Zsh plugin manager with async loading |
| 4 | **TPM** | Tmux Plugin Manager |
| 5 | **Backup** | Existing configs saved to `~/.dotfiles_backup/<timestamp>/` |
| 6 | **GNU Stow** | Symlinks all configs to their correct locations |
| 7 | **Git identity** | Prompts for name/email, saves to `~/.gitconfig.local` |
| 8 | **Default shell** | Sets Zsh as default shell |
| 9 | **macOS defaults** | Faster key repeat, show hidden files, etc. (macOS only) |
| 10 | **Tmux plugins** | Installs all tmux plugins via TPM |
| 11 | **Atuin** | Initializes shell history database |
| 12 | **bat cache** | Builds syntax theme cache |

---

## Configs Included

| Stow Package | Tool | Config Location | What It Configures |
|-------------|------|-----------------|-------------------|
| `zsh` | Zsh + Zinit | `~/.zshrc`, `~/.zshenv` | Shell, plugins, aliases, FZF, tool init |
| `tmux` | tmux + TPM | `~/.config/tmux/tmux.conf` | Multiplexer, theme, keybindings, plugins |
| `nvim` | Neovim + lazy.nvim | `~/.config/nvim/init.lua` | Editor, LSP, completion, formatter |
| `starship` | Starship | `~/.config/starship.toml` | Cross-shell prompt with Catppuccin |
| `git` | Git + Delta | `~/.gitconfig`, `~/.config/git/ignore` | Aliases, delta diffs, global gitignore |
| `bat` | bat | `~/.config/bat/config` | Syntax highlighting theme |
| `ghostty` | Ghostty | `~/.config/ghostty/config` | Terminal emulator settings |
| `lazygit` | lazygit | `~/.config/lazygit/config.yml` | Git TUI theme and pager |

---

## CLI Tools

Every tool is installed automatically via the `Brewfile`.

### Modern Replacements

| You type | It runs | What changed |
|----------|---------|-------------|
| `ls` | **eza** | Icons, colors, git status, tree view |
| `cat` | **bat** | Syntax highlighting, line numbers, git integration |
| `grep` | **ripgrep** (rg) | 10-100x faster, respects `.gitignore` |
| `find` | **fd** | Intuitive syntax, fast, respects `.gitignore` |
| `cd` | **zoxide** (z) | Smart directory jumping (see Navigation below) |
| `diff` | **delta** | Side-by-side diffs with syntax highlighting |
| `du` | **dust** | Visual, intuitive disk usage |
| `sed` | **sd** | Intuitive find-and-replace |
| `rm` | **trash** | Sends to trash instead of permanent delete |
| `top` | **btop** | Beautiful system monitor |
| `vim` | **nvim** | Neovim with full IDE features |

### Productivity Tools

| Tool | What It Does |
|------|-------------|
| **fzf** | Fuzzy finder for files, history, directories, and more |
| **atuin** | Shell history with SQLite database, fuzzy search, optional sync |
| **yazi** | Terminal file manager with image previews and vim keys |
| **lazygit** | Terminal UI for git -- stage, commit, push visually |
| **gh** | GitHub CLI -- PRs, issues, repos from the terminal |
| **mise** | Polyglot version manager (replaces nvm, pyenv, rbenv) |
| **direnv** | Per-directory environment variables |
| **tldr** | Practical command examples (simpler than man pages) |
| **jq** / **yq** | JSON and YAML processors |
| **hyperfine** | Command-line benchmarking |
| **tree** | Directory tree viewer |

---

## Navigation

### Zoxide (`z`) -- Smart Directory Jumping

Zoxide learns which directories you visit and lets you jump to them with fuzzy matching.

```bash
z projects       # Jump to the most visited directory matching "projects"
z side project   # Fuzzy match with multiple keywords
z dot            # Jump to ~/dotfiles (if you've visited it before)
zi               # Interactive mode -- browse all visited directories with fzf
zi projects      # Interactive mode with a pre-filled query
z -              # Go back to previous directory
z ~              # Go home
```

The more you use it, the smarter it gets. No more typing long paths.

### fzf Shortcuts

| Shortcut | What It Does |
|----------|-------------|
| `Ctrl+T` | Fuzzy find a file and insert its path |
| `Ctrl+R` | Fuzzy search command history (enhanced by atuin) |
| `Alt+C` | Fuzzy find a directory and `cd` into it |

All fzf searches use **fd** under the hood (fast, respects `.gitignore`) and show previews (file contents via bat, directory trees via eza).

### Yazi (`y`) -- Terminal File Manager

```bash
y               # Open file manager in current directory
y ~/projects    # Open in specific directory
```

Navigate with `h/j/k/l` (vim keys). When you quit (`q`), your shell `cd`s to whatever directory you navigated to in yazi.

### Quick Aliases

```bash
..              # cd ..
...             # cd ../..
....            # cd ../../..
-               # cd - (previous directory)
```

---

## Shell History (Atuin)

Atuin replaces the default `Ctrl+R` with a rich, searchable history:

- **Fuzzy search** across all commands with context (directory, duration, exit code)
- **SQLite database** -- never lose history again
- **Optional sync** -- encrypted cross-machine history sharing

```bash
atuin register   # Create account for cross-machine sync (optional)
atuin login      # Login on another machine
atuin import     # Import existing zsh history
```

Press `Ctrl+R` or the up arrow to search. History is stored locally by default.

---

## tmux

### Key Bindings

The prefix is **`Ctrl+Space`** (instead of the default `Ctrl+b`).

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate between panes (also works in Neovim) |
| `Alt+H` / `Alt+L` | Previous / Next window |
| `prefix + \|` | Split vertically |
| `prefix + -` | Split horizontally |
| `prefix + c` | New window (in current directory) |
| `prefix + r` | Reload config |
| `prefix + o` | **Session picker** (fzf-powered, with zoxide) |
| `prefix + u` | **Open URLs** from terminal output with fzf |
| `prefix + I` | Install plugins (TPM) |
| `prefix + U` | Update plugins (TPM) |
| `prefix + Ctrl+s` | Save session (resurrect) |
| `prefix + Ctrl+r` | Restore session (resurrect) |

### Pane Resizing

| Key | Action |
|-----|--------|
| `prefix + H` | Resize left |
| `prefix + J` | Resize down |
| `prefix + K` | Resize up |
| `prefix + L` | Resize right |

### Copy Mode (Vi)

| Key | Action |
|-----|--------|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `Ctrl+v` | Rectangle selection |
| `y` | Copy and exit |

### Plugins

| Plugin | What It Does |
|--------|-------------|
| **tmux-sensible** | Universal sane defaults |
| **vim-tmux-navigator** | Seamless Ctrl+h/j/k/l across tmux and Neovim |
| **catppuccin/tmux** | Catppuccin Mocha theme with status bar modules |
| **tmux-yank** | System clipboard integration |
| **tmux-resurrect** | Save/restore sessions across restarts |
| **tmux-continuum** | Auto-save sessions every 15 minutes |
| **tmux-sessionx** | fzf-powered session picker with zoxide integration |
| **tmux-fzf-url** | Open URLs from terminal output |

Sessions are automatically saved and restored -- you can reboot and pick up exactly where you left off.

---

## Neovim

The Neovim config is a single-file setup (`init.lua`) with a full IDE experience.

### Key Bindings

Leader key is **`Space`**.

#### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `Ctrl+h/j/k/l` | Navigate splits (and tmux panes) |
| `J` / `K` (visual) | Move selected lines down/up |
| `Ctrl+d` / `Ctrl+u` | Scroll half page (cursor stays centered) |
| `<leader>p` (visual) | Paste without overwriting register |
| `-` | Open file explorer (oil.nvim) |

#### Finding Things (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fd` | Diagnostics |

#### LSP (when attached to a file with a language server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>D` | Type definition |
| `<leader>fm` | Format file |

#### Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle comment on selection |
| `ys{motion}{char}` | Add surround (e.g., `ysiw"` to surround word with quotes) |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

### Plugins

| Plugin | What It Does |
|--------|-------------|
| **catppuccin** | Catppuccin Mocha colorscheme |
| **telescope.nvim** | Fuzzy finder for files, grep, buffers |
| **treesitter** | Syntax highlighting and code understanding |
| **nvim-lspconfig + mason** | Language Server Protocol (autocomplete, go-to-def, diagnostics) |
| **nvim-cmp** | Autocompletion with LSP, snippets, paths, buffer words |
| **conform.nvim** | Code formatting (prettier, black, gofmt, etc.) |
| **oil.nvim** | File explorer that edits the filesystem like a buffer |
| **gitsigns** | Git change indicators in the gutter |
| **lualine** | Status line with Catppuccin theme |
| **which-key** | Shows available keybindings as you type |
| **vim-tmux-navigator** | Seamless pane navigation with tmux |
| **mini.nvim** | Auto pairs, surround, commenting |
| **indent-blankline** | Indent guide lines |
| **todo-comments** | Highlight TODO/FIXME/HACK/NOTE in code |
| **LuaSnip + friendly-snippets** | Snippet engine with VS Code snippet library |

### LSP Servers (auto-installed via Mason)

- **lua_ls** -- Lua
- **ts_ls** -- TypeScript/JavaScript
- **pyright** -- Python

Additional servers install automatically when you open a file if mason has them. You can manually install more with `:Mason`.

---

## Git

### Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gcm` | `git commit -m` |
| `gp` | `git push` |
| `gpl` | `git pull` |
| `gco` | `git checkout` |
| `gcob` | `git checkout -b` |
| `gd` | `git diff` |
| `gl` | `git log --oneline --graph --decorate` |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |
| `lg` | Open **lazygit** |

### Git config highlights

- **Delta** as the pager -- side-by-side diffs with syntax highlighting
- **Auto-rebase** on pull (`pull.rebase = true`)
- **Auto-setup remote** on push (`push.autoSetupRemote = true`)
- **Prune** stale remote branches on fetch
- **rerere** enabled -- remembers how you resolved merge conflicts
- **GitHub CLI** as credential helper

### Personal info

Git identity (name/email) is stored in `~/.gitconfig.local` (not tracked in git). The installer prompts you for this on first run.

---

## Starship Prompt

A Catppuccin-themed powerline prompt showing:

- **OS icon** (macOS/Linux)
- **Current directory** (truncated to 3 levels)
- **Git branch and status** (ahead/behind, modified, staged)
- **Language versions** (Node.js, Python, Rust, Go) when in a project
- **Docker context** when active
- **Clock**
- **Exit code indicator** (green/red arrow)

---

## Ghostty Terminal

Pre-configured with:
- JetBrains Mono Nerd Font at 14pt
- Catppuccin Mocha theme
- Hidden macOS title bar for clean look
- Block cursor (no blink)
- Copy on select
- Mouse hides while typing

---

## Customization

### Machine-specific config

Create `~/.zsh_local` for anything specific to one machine (not tracked in git):

```bash
# ~/.zsh_local
export AWS_PROFILE=production
export PATH="$HOME/custom-tools/bin:$PATH"
alias deploy="./scripts/deploy.sh"
```

### Git identity

Stored in `~/.gitconfig.local`:

```ini
[user]
  name = Your Name
  email = you@example.com
```

### Adding more Brew packages

Edit the `Brewfile` and run:

```bash
brew bundle --file=~/dotfiles/Brewfile
```

### Version management with mise

```bash
mise use node@20      # Set Node.js version for current directory
mise use python@3.12  # Set Python version
mise use go@latest    # Set Go version
mise ls               # List installed versions
```

---

## Directory Structure

```
dotfiles/
├── install.sh          # Bootstrap script (one-liner support)
├── uninstall.sh        # Remove all symlinks
├── Brewfile            # Homebrew packages
├── zsh/
│   ├── .zshenv         # Environment variables, Homebrew path
│   └── .zshrc          # Shell config, plugins, aliases, tool init
├── tmux/
│   └── .config/tmux/
│       └── tmux.conf   # Tmux config with plugins and theme
├── nvim/
│   └── .config/nvim/
│       └── init.lua    # Neovim config (single file, full IDE)
├── starship/
│   └── .config/
│       └── starship.toml  # Prompt config with Catppuccin
├── git/
│   ├── .gitconfig      # Git config (includes .gitconfig.local)
│   └── .config/git/
│       └── ignore      # Global gitignore
├── bat/
│   └── .config/bat/
│       └── config      # bat theme and settings
├── ghostty/
│   └── .config/ghostty/
│       └── config      # Terminal emulator settings
└── lazygit/
    └── .config/lazygit/
        └── config.yml  # Git TUI theme
```

Each top-level directory is a **GNU Stow package**. Running `stow zsh` symlinks `zsh/.zshrc` to `~/.zshrc`. The `install.sh` script stows all packages automatically.

---

## Uninstall

```bash
cd ~/dotfiles
./uninstall.sh
```

This only removes symlinks. Your original configs are in `~/.dotfiles_backup/`.

---

## Updating

```bash
cd ~/dotfiles
git pull
stow --restow zsh tmux nvim starship git bat ghostty lazygit
```

Or re-run the installer (it's idempotent):

```bash
./install.sh
```
