# ─── Zinit Bootstrap ──────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ─── Oh-My-Zsh Libraries (cherry-picked) ─────────────────
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh

# ─── Oh-My-Zsh Plugins ───────────────────────────────────
zinit snippet OMZP::git
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::command-not-found

# ─── Core Plugins (turbo-loaded async) ───────────────────
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# ─── Additional Plugins ──────────────────────────────────
zinit wait lucid for \
  Aloxaf/fzf-tab

# ─── History ──────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# ─── Options ─────────────────────────────────────────────
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt CORRECT

# ─── Completion Styling ──────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always $realpath'

# ─── Aliases: Modern Replacements ────────────────────────
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first"
alias lt="eza --tree --icons --level=2"
alias lt3="eza --tree --icons --level=3"
alias la="eza -a --icons --group-directories-first"
alias cat="bat --paging=never"

# ─── Aliases: Safety ─────────────────────────────────────
alias cp="cp -i"
alias mv="mv -i"
alias rm="trash"

# ─── Aliases: Git ────────────────────────────────────────
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"
alias gst="git stash"
alias gstp="git stash pop"
alias lg="lazygit"

# ─── Aliases: Navigation (zoxide) ────────────────────────
# z <query>     - jump to best match (e.g., z projects)
# z <q1> <q2>   - jump with multiple queries (e.g., z side project)
# zi <query>    - interactive selection with fzf
# z -           - go back to previous directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# ─── Aliases: Misc ───────────────────────────────────────
alias cls="clear"
alias reload="exec zsh"
alias myip="curl -s https://ipinfo.io/ip"
alias weather="curl -s 'wttr.in?format=3'"
alias vim="nvim"
alias vi="nvim"

# ─── Yazi: File Manager (y to enter, q to quit, cwd follows) ─
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  command rm -f -- "$tmp"
}

# ─── FZF Configuration ───────────────────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_DEFAULT_OPTS=" \
  --height 40% --layout=reverse --border \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range=:200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# ─── bat Configuration ───────────────────────────────────
export BAT_THEME="Catppuccin Mocha"

# ─── Tool Initialization ─────────────────────────────────
command -v starship &>/dev/null && eval "$(starship init zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v fzf &>/dev/null && eval "$(fzf --zsh)"
command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"
command -v mise &>/dev/null && eval "$(mise activate zsh)"
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"
command -v atuin &>/dev/null && eval "$(atuin init zsh)"

# ─── Machine-specific Config (not committed) ─────────────
[[ -f "$HOME/.zsh_local" ]] && source "$HOME/.zsh_local"
