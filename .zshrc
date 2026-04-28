# .zshrc — loaded for every interactive zsh session

# ── Terminal font size ───────────────────────────────────────
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    osascript -e 'tell application "Terminal" to set font size of front window to 16' &>/dev/null
fi

# ── Source shared configs ────────────────────────────────────
[[ -f ~/.bash_aliases  ]] && source ~/.bash_aliases
[[ -f ~/.environment   ]] && source ~/.environment

# ── Starship prompt ──────────────────────────────────────────
# Config: ~/.config/starship.toml
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# ── fzf keybindings & completions ───────────────────────────
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# ── zoxide (smarter cd) ──────────────────────────────────────
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# ── mise runtime version manager ────────────────────────────
if command -v mise &>/dev/null; then
    eval "$(mise activate zsh)"
fi

# ── direnv ───────────────────────────────────────────────────
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi
