# ── Navigation ──────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'

# ── Listing (eza replaces ls) ────────────────────────────────
if command -v eza &>/dev/null; then
    alias ls='eza --icons'
    alias ll='eza -lh --icons --git'
    alias la='eza -lah --icons --git'
    alias lt='eza --tree --icons --level=2'
else
    alias ll='ls -lhG'
    alias la='ls -lahG'
fi

# ── bat replaces cat ─────────────────────────────────────────
command -v bat &>/dev/null && alias cat='bat --paging=never'

# ── Git shortcuts ────────────────────────────────────────────
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'

# ── Docker ───────────────────────────────────────────────────
alias all-containers='docker ps -aq'
alias all-images='docker images -q'
alias dclean='docker system prune -f'

# ── Safety nets ──────────────────────────────────────────────
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
