<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" alt="Catppuccin" width="100">
  <br>
  dotfiles
  <br>
</h1>

<p align="center">
  <b>Turn your boring terminal into a beautiful, modern powerhouse — with one command.</b>
</p>

<p align="center">
  No manual setup. No config headaches. Just copy, paste, and you're done.
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
  <img src="https://vhs.charm.sh/vhs-5tiNRpmJ2MHMgTxb42JAfC.gif" alt="Demo" width="800">
</p>

---

## Quick Start

**Option 1** — One-liner (just paste this into your terminal):

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cyvid7-Darus10/dotfiles/main/install.sh)"
```

**Option 2** — Clone and run:

```bash
git clone https://github.com/Cyvid7-Darus10/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

That's it. The installer handles everything automatically — installs tools, backs up your existing configs, and sets up the new environment. Safe to re-run anytime.

<p align="center">
  <img src="https://vhs.charm.sh/vhs-5e7Ak3W6uAdS7Cph9X2zqk.gif" alt="Installation" width="800">
</p>

---

## Why Use This?

Your default terminal is plain, ugly, and hard to work with. This setup gives you:

- **A stunning look** — consistent Catppuccin Mocha theme across every tool, with icons and syntax highlighting everywhere
- **Smarter defaults** — `ls` shows file icons and git status, `cat` highlights code, `rm` sends to trash instead of deleting forever
- **Instant navigation** — type `z projects` to jump to your projects folder from anywhere, no more `cd ../../../`
- **Fuzzy search everything** — press `Ctrl+T` to find any file, `Ctrl+R` to search your command history
- **A full code editor in your terminal** — Neovim with autocomplete, go-to-definition, and file search built in
- **Split-screen multitasking** — tmux lets you run multiple terminals side by side in one window
- **45+ tools installed automatically** — no hunting down packages one by one

---

## What's Included

| What | Tool | What it does |
|:-----|:-----|:-------------|
| **Terminal** | [Ghostty](https://ghostty.org/) | Fast, GPU-accelerated terminal app |
| **Shell** | Zsh + [Zinit](https://github.com/zdharma-continuum/zinit) | Smarter shell with plugins that load instantly |
| **Prompt** | [Starship](https://starship.rs/) | Shows git branch, language versions, and status at a glance |
| **Split Screen** | [tmux](https://github.com/tmux/tmux) | Run multiple terminals in one window, keep sessions alive |
| **Editor** | [Neovim](https://neovim.io/) | Full code editor with autocomplete and file search |
| **Navigation** | [zoxide](https://github.com/ajeetdsouza/zoxide) | Jump to any folder by typing part of its name |
| **File Manager** | [yazi](https://github.com/sxyazi/yazi) | Browse files visually in the terminal |
| **History** | [Atuin](https://github.com/atuinsh/atuin) | Search through every command you've ever typed |
| **Git** | [lazygit](https://github.com/jesseduffield/lazygit) + [delta](https://github.com/dandavella/delta) | Visual git interface + beautiful code diffs |
| **Theme** | Catppuccin Mocha | Consistent colors across every tool |
| **Font** | JetBrains Mono Nerd Font | Clean font with icons built in |

---

## Your Commands, Upgraded

Same commands you already know — but now they look and work better:

| You type | What happens | Before vs After |
|:---------|:-------------|:----------------|
| `ls` | [eza](https://github.com/eza-community/eza) | Plain text → icons, colors, git status |
| `ll` | `eza -la` | Hidden files shown beautifully |
| `lt` | `eza --tree` | See folder structure as a tree |
| `cat` | [bat](https://github.com/sharkdp/bat) | Plain text → syntax-highlighted code |
| `rm` | [trash](https://github.com/sindresorhus/trash-cli) | Permanent delete → safe trash (recoverable) |
| `vim` / `vi` | [nvim](https://neovim.io/) | Basic editor → full IDE |

<details>
<summary><strong>45+ tools included — see the full list</strong></summary>

| Tool | What it does |
|:-----|:-------------|
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder — search files, history, and directories instantly |
| [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) | Search inside files — way faster than `grep` |
| [fd](https://github.com/sharkdp/fd) | Find files by name — simpler and faster than `find` |
| [dust](https://github.com/bootandy/dust) | See what's eating your disk space |
| [sd](https://github.com/chmln/sd) | Find-and-replace text in files |
| [btop](https://github.com/aristocratos/btop) | Beautiful system monitor (CPU, memory, network) |
| [delta](https://github.com/dandavella/delta) | Color-coded git diffs with syntax highlighting |
| [gh](https://cli.github.com/) | GitHub from the terminal — PRs, issues, repos |
| [mise](https://mise.jdx.dev/) | Manage language versions (Node, Python, Go, etc.) |
| [direnv](https://direnv.net/) | Auto-load environment variables per project |
| [tldr](https://tldr.sh/) | Simple, example-based help pages (better than `man`) |
| [jq](https://stedolan.github.io/jq/) / [yq](https://github.com/mikefarah/yq) | Process JSON and YAML from the terminal |
| [hyperfine](https://github.com/sharkdp/hyperfine) | Benchmark how fast commands run |

> These tools use their own names — they don't replace core commands (`grep`, `find`, `du`, `sed`, `top`) so nothing breaks.

</details>

---

## Keyboard Shortcuts

You don't need to memorize everything — just these essentials to get started:

### Everyday Shortcuts

| Shortcut | What it does |
|:---------|:-------------|
| `z <name>` | Jump to any folder by typing part of its name |
| `y` | Open a visual file browser |
| `..` / `...` | Go up 1 or 2 directories |
| `Ctrl+T` | Fuzzy search for any file |
| `Ctrl+R` | Search your command history |
| `lg` | Open a visual git interface |
| `weather` | Check the weather |

### tmux (split-screen multitasking)

Prefix key: **`Ctrl+Space`** (press this first, then the shortcut)

| Shortcut | What it does |
|:---------|:-------------|
| `Ctrl+h/j/k/l` | Move between panels |
| `prefix + \|` | Split screen vertically |
| `prefix + -` | Split screen horizontally |
| `prefix + c` | Open a new tab |
| `Alt+H` / `Alt+L` | Switch between tabs |

<details>
<summary><strong>More tmux shortcuts</strong></summary>

| Shortcut | What it does |
|:---------|:-------------|
| `prefix + o` | Session picker (fzf + zoxide) |
| `prefix + u` | Open URLs from terminal output |
| `prefix + H/J/K/L` | Resize panels |
| `prefix + [` | Enter copy mode (vi keys) |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Copy to clipboard |
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |
| `prefix + I` | Install plugins |

</details>

### Neovim (code editor)

Leader key: **`Space`** (press this first, then the shortcut)

| Shortcut | What it does |
|:---------|:-------------|
| `Space ff` | Find a file |
| `Space fg` | Search inside files |
| `Space w` | Save |
| `-` | Open file explorer |
| `gd` | Jump to where a function is defined |
| `K` | Show documentation popup |

<details>
<summary><strong>More Neovim shortcuts</strong></summary>

**Navigation**

| Shortcut | What it does |
|:---------|:-------------|
| `Ctrl+h/j/k/l` | Move between splits (and tmux panels) |
| `Ctrl+d` / `Ctrl+u` | Scroll half a page down / up |
| `Space fb` | Switch between open files |
| `Space fr` | Open recent files |

**Code Intelligence**

| Shortcut | What it does |
|:---------|:-------------|
| `gr` | Find all references |
| `gi` | Go to implementation |
| `Space rn` | Rename a symbol everywhere |
| `Space ca` | Show code actions (quick fixes) |
| `Space fd` | Show all warnings and errors |
| `Space fm` | Auto-format the file |

**Editing**

| Shortcut | What it does |
|:---------|:-------------|
| `gcc` | Toggle comment on a line |
| `gc` (visual) | Comment selected lines |

</details>

---

## Git Shortcuts

Short aliases so you type less:

| You type | What it does |
|:---------|:-------------|
| `gs` | Check status |
| `ga` | Stage files |
| `gcm "message"` | Commit with a message |
| `gp` / `gpl` | Push / pull |
| `gd` | See changes (color-coded, side-by-side) |
| `gl` | Pretty commit history graph |
| `lg` | Open lazygit (visual git interface) |

Git is also pre-configured with beautiful color-coded diffs, auto-rebase on pull, and conflict resolution memory — all out of the box.

---

## Make It Yours

### Add your own shell settings

Create `~/.zsh_local` — this file is yours and won't be overwritten by updates:

```bash
export AWS_PROFILE=production
alias deploy="./scripts/deploy.sh"
```

### Set your Git name and email

The installer asks you during setup, but you can change it anytime:

```bash
git config --file ~/.gitconfig.local user.name "Your Name"
git config --file ~/.gitconfig.local user.email "you@example.com"
```

### Install more packages

```bash
# Add a line to Brewfile, then:
brew bundle --file=~/dotfiles/Brewfile
```

### Manage language versions

```bash
mise use node@20        # Node.js
mise use python@3.12    # Python
mise use go@latest      # Go
mise ls                 # See what's installed
```

---

## What the Installer Does

Everything is automatic. Here's what happens behind the scenes:

```
 1. Install Homebrew (macOS package manager, if missing)
 2. Install all 45+ tools from the package list
 3. Set up shell plugins (Zinit) and tmux plugins (TPM)
 4. Back up your existing configs (nothing gets lost)
 5. Link all new configs into place
 6. Ask for your Git name and email
 7. Set Zsh as your default shell
 8. Apply better macOS defaults (faster key repeat, show hidden files)
 9. Initialize shell history database and theme cache
```

Your original configs are saved to `~/.dotfiles_backup/` with a timestamp, so you can always go back.

---

## Project Structure

```
dotfiles/
├── install.sh              # The installer (run this)
├── uninstall.sh            # Undo everything
├── Brewfile                # List of tools to install
├── zsh/                    # Shell config, plugins, aliases
├── tmux/                   # Split-screen terminal config
├── nvim/                   # Code editor config
├── starship/               # Prompt (the line where you type)
├── git/                    # Git config + global ignore rules
├── bat/                    # Syntax highlighting theme
├── ghostty/                # Terminal app config
└── lazygit/                # Visual git interface config
```

Each folder is managed by [GNU Stow](https://www.gnu.org/software/stow/) — it creates links from this repo into your home directory, so updates are just a `git pull` away.

---

## Update

```bash
cd ~/dotfiles && git pull && ./install.sh
```

## Uninstall

```bash
cd ~/dotfiles && ./uninstall.sh
```

Only removes the config links. Your backups stay safe in `~/.dotfiles_backup/`.

---

<p align="center">
  <sub>Built with Catppuccin Mocha &middot; Managed with GNU Stow &middot; Powered by Homebrew</sub>
</p>
