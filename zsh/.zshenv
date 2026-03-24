# ─── XDG Base Directories ─────────────────────────────────
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ─── Homebrew ─────────────────────────────────────────────
if [[ "$(uname -s)" == "Darwin" ]]; then
  if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null
  else
    eval "$(/usr/local/bin/brew shellenv)" 2>/dev/null
  fi
elif [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 2>/dev/null
fi

# ─── Editor ───────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
