# dotfiles-mac

Personal macOS dotfiles and environment bootstrap — 2026 edition.

## What gets installed

| Category | Tools |
|---|---|
| **Shell** | zsh + [Starship](https://starship.rs) prompt |
| **Editor** | Neovim + Vim (vim-plug for plugins) |
| **Terminal** | WezTerm + JetBrains Mono Nerd Font |
| **CLI** | `ripgrep`, `fzf`, `bat`, `eza`, `zoxide`, `fd`, `jq`, `tmux`, `direnv` |
| **Git** | `git-delta` as diff pager, GitHub CLI (`gh`) |
| **Runtime mgr** | `mise` (replaces nvm / rbenv / pyenv) |
| **Package mgr** | Homebrew (auto-installed if missing) |

## Installation

```bash
git clone https://github.com/prayagupa/dotfiles-mac.git
cd dotfiles-mac/
./god-manifestation.sh
# restart terminal
```

The script will:

1. **Backup** existing dotfiles to `~/dotfiles_backup/<timestamp>/`
2. **Install Homebrew** (or update if already present) and all packages/casks
3. **Copy configs** — shell, vim, neovim, starship, git, etc.
4. **Install vim-plug** and run `:PlugInstall` headlessly for both Vim and Neovim
5. **Configure fzf** shell keybindings and completions
6. **Set git-delta** as the global diff/pager tool
7. **Set zsh** as the default shell
8. **Apply macOS defaults** (key repeat, Finder, etc.)

## Layout

```
dotfiles-mac/
├── god-manifestation.sh   # bootstrap entrypoint
├── .vimrc                 # Vim config (vim-plug)
├── .zshrc                 # Zsh config
├── .bashrc / .bash_*      # Bash fallback configs
├── .gitconfig             # Git config
├── .environment           # Exported env vars
├── .config/
│   ├── nvim/              # Neovim config
│   └── starship.toml      # Starship prompt theme
└── .emacs.d/              # Emacs config (legacy)
```

## Editor

`C-n` — toggle file explorer

![](ide.png)

## General dotfiles

https://github.com/prayagupa/dotfiles
