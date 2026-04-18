#!/usr/bin/env zsh
# ============================================================
#  god-manifestation.sh — dotfiles bootstrap for macOS (2026)
#  Backs up → installs → configures your environment
# ============================================================

set -euo pipefail

# ── Colours ─────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

log()     { echo -e "${CYAN}${BOLD}[info]${RESET}  $*"; }
success() { echo -e "${GREEN}${BOLD}[ok]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[warn]${RESET}  $*"; }
die()     { echo -e "${RED}${BOLD}[error]${RESET} $*" >&2; exit 1; }

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# ── 1. Backup ────────────────────────────────────────────────
backupDotfiles() {
  log "Backing up existing dotfiles to $BACKUP …"
  mkdir -p "$BACKUP"

  local targets=(
    ~/.zshrc ~/.zshenv ~/.zprofile
    ~/.bashrc ~/.bash_profile ~/.bash_aliases ~/.bash_prompt
    ~/.vimrc ~/.vim
    ~/.config/nvim
    ~/.gitconfig
    ~/.emacs.d
    ~/.environment
    ~/.config/starship.toml
  )

  for t in "${targets[@]}"; do
    [[ -e "$t" ]] && cp -r "$t" "$BACKUP/" && log "  backed up $(basename "$t")"
  done

  success "Backup complete → $BACKUP"
}

# ── 2. Copy configs ──────────────────────────────────────────
copyConfigs() {
  log "Copying dotfiles …"

  local files=(
    .vimrc
    .bashrc
    .bash_profile
    .bash_aliases
    .bash_prompt
    .environment
  )

  for f in "${files[@]}"; do
    [[ -f "$DOTFILES_DIR/$f" ]] && cp "$DOTFILES_DIR/$f" ~/ && log "  → ~/$f"
  done

  # zsh configs (create stubs if not in repo yet)
  if [[ -f "$DOTFILES_DIR/.zshrc" ]]; then
    cp "$DOTFILES_DIR/.zshrc" ~/
    log "  → ~/.zshrc"
  else
    warn ".zshrc not found in repo — skipping"
  fi

  # Neovim config
  if [[ -d "$DOTFILES_DIR/.config/nvim" ]]; then
    mkdir -p ~/.config
    cp -r "$DOTFILES_DIR/.config/nvim" ~/.config/
    log "  → ~/.config/nvim"
  fi

  # Starship prompt config
  if [[ -f "$DOTFILES_DIR/.config/starship.toml" ]]; then
    mkdir -p ~/.config
    cp "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml
    log "  → ~/.config/starship.toml"
  fi

  # Emacs (legacy – keep if present)
  [[ -d "$DOTFILES_DIR/.emacs.d" ]] && cp -r "$DOTFILES_DIR/.emacs.d" ~/

  success "Config files copied."
}

# ── 3. Homebrew + core CLI tools ─────────────────────────────
installHomebrew() {
  if command -v brew &>/dev/null; then
    log "Homebrew already installed — updating …"
    brew update --quiet
  else
    log "Installing Homebrew …"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Apple-silicon path
    [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  success "Homebrew ready."
}

installBrewPackages() {
  log "Installing Homebrew packages …"

  local formulae=(
    git git-delta          # version control
    neovim                 # editor
    vim                    # classic fallback
    zsh                    # shell
    starship               # cross-shell prompt
    fzf                    # fuzzy finder
    ripgrep                # fast grep (rg)
    fd                     # fast find
    bat                    # cat with wings
    eza                    # modern ls
    zoxide                 # smarter cd
    tmux                   # terminal multiplexer
    direnv                 # per-dir env vars
    mise                   # runtime version manager (replaces nvm/rbenv/pyenv)
    gh                     # GitHub CLI
    jq                     # JSON Swiss-army knife
    tree                   # directory trees
    wget curl              # networking
    gnupg                  # GPG
    htop                   # process monitor
  )

  local casks=(
    wezterm                # GPU-accelerated terminal
    font-jetbrains-mono-nerd-font
  )

  brew install "${formulae[@]}" 2>/dev/null || warn "Some formulae may have failed — check output above."
  brew install --cask "${casks[@]}" 2>/dev/null || warn "Some casks may have failed — check output above."

  success "Homebrew packages installed."
}

# ── 4. vim-plug (Vim & Neovim) ───────────────────────────────
installVimPlug() {
  log "Installing vim-plug for Vim …"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  log "Installing vim-plug for Neovim …"
  local nvim_plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
  curl -fLo "$nvim_plug" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Headless plugin install for Vim
  if [[ -f ~/.vimrc ]]; then
    log "Running :PlugInstall (Vim) …"
    vim +PlugInstall +PlugUpdate +qall 2>/dev/null || warn "Vim PlugInstall encountered issues."
  fi

  # Headless plugin install for Neovim
  if [[ -d ~/.config/nvim ]]; then
    log "Running :PlugInstall (Neovim) …"
    nvim --headless +PlugInstall +PlugUpdate +qa 2>/dev/null || warn "Neovim PlugInstall encountered issues."
  fi

  success "vim-plug setup complete."
}

# ── 5. fzf keybindings & completions ─────────────────────────
configureFzf() {
  log "Configuring fzf shell integration …"
  "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc --no-bash 2>/dev/null || true
  success "fzf configured."
}

# ── 6. Git diff tool ─────────────────────────────────────────
configureGitDiff() {
  log "Configuring git diff → delta …"
  git config --global core.pager          "delta"
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate      true
  git config --global delta.light         false
  git config --global delta.line-numbers  true
  git config --global merge.conflictstyle diff3
  git config --global diff.colorMoved     default
  success "git-delta set as diff pager."
}

# ── 7. Set zsh as default shell ───────────────────────────────
setDefaultShell() {
  local brew_zsh
  brew_zsh="$(brew --prefix)/bin/zsh"

  if [[ "$SHELL" == "$brew_zsh" ]]; then
    log "zsh ($brew_zsh) is already the default shell."
    return
  fi

  log "Setting $brew_zsh as default shell …"
  grep -qF "$brew_zsh" /etc/shells || echo "$brew_zsh" | sudo tee -a /etc/shells
  chsh -s "$brew_zsh" || warn "Could not change shell automatically — run: chsh -s $brew_zsh"
  success "Default shell → $brew_zsh (re-login to apply)."
}

# ── 8. macOS sensible defaults ────────────────────────────────
configureMacOS() {
  log "Applying macOS defaults …"

  # Show hidden files in Finder
  defaults write com.apple.finder AppleShowAllFiles -bool true
  # Show path bar in Finder
  defaults write com.apple.finder ShowPathbar -bool true
  # Disable press-and-hold for keys (better key repeat)
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  # Fast key repeat
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  # Save to disk (not iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  killall Finder 2>/dev/null || true
  success "macOS defaults applied."
}

# ── Entry point ───────────────────────────────────────────────
onInit() {
  echo ""
  echo -e "${BOLD}╔══════════════════════════════════════════╗${RESET}"
  echo -e "${BOLD}║       god-manifestation  •  2026         ║${RESET}"
  echo -e "${BOLD}╚══════════════════════════════════════════╝${RESET}"
  echo ""

  backupDotfiles
  installHomebrew
  installBrewPackages
  copyConfigs
  installVimPlug
  configureFzf
  configureGitDiff
  setDefaultShell
  configureMacOS

  echo ""
  echo -e "${GREEN}${BOLD}════════════════════════════════════════════${RESET}"
  echo -e "${GREEN}${BOLD}  All done. Open a new terminal to apply.   ${RESET}"
  echo -e "${GREEN}${BOLD}════════════════════════════════════════════${RESET}"
  echo ""
}

onInit
