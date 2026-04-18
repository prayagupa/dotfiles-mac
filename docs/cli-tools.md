# CLI Tools

## File & Search

### ripgrep (`rg`)
**What:** Extremely fast recursive grep, respects `.gitignore` by default.  
**Why:** 10–100× faster than GNU grep on large codebases.  
**Usage:** `rg "pattern"` · `rg "pattern" src/`  
**Docs:** https://github.com/BurntSushi/ripgrep

### fd
**What:** Simple, fast alternative to `find`.  
**Why:** Intuitive syntax, coloured output, respects `.gitignore`.  
**Usage:** `fd "*.ts"` · `fd -e md` (by extension)  
**Docs:** https://github.com/sharkdp/fd

### bat
**What:** `cat` replacement with syntax highlighting, line numbers, and git diff markers.  
**Why:** Makes reading files in the terminal actually pleasant.  
**Usage:** `bat file.ts` (aliased as `cat` in `.bash_aliases`)  
**Docs:** https://github.com/sharkdp/bat

### eza
**What:** Modern replacement for `ls`, written in Rust.  
**Why:** Icons, git status per file, tree view, colour-coded permissions.  
**Aliases (from `.bash_aliases`):**

| Alias | Command | Description |
|---|---|---|
| `ls` | `eza --icons` | basic list with icons |
| `ll` | `eza -lh --icons --git` | long list with git status |
| `la` | `eza -lah --icons --git` | long list including hidden files |
| `lt` | `eza --tree --icons --level=2` | tree view, 2 levels deep |

**Docs:** https://github.com/eza-community/eza

---

## Git

### git-delta
**What:** Syntax-highlighting pager for `git diff` and `git log`.  
**Why:** Makes diffs readable — side-by-side view, line numbers, moved-code detection.  
**Config:** set as `core.pager` in `~/.gitconfig` by the bootstrap.  
**Docs:** https://github.com/dandavison/delta

### GitHub CLI (`gh`)
**What:** Official GitHub CLI — PRs, issues, repos from the terminal.  
**Usage:** `gh pr create` · `gh pr list` · `gh repo clone owner/repo`  
**Docs:** https://cli.github.com

---

## Productivity

### tmux
**What:** Terminal multiplexer — multiple panes/windows in one terminal session.  
**Why:** Persistent sessions survive SSH disconnects; split panes without a GUI.  
**Docs:** https://github.com/tmux/tmux

### jq
**What:** Lightweight command-line JSON processor.  
**Usage:** `curl api.example.com | jq '.data[]'`  
**Docs:** https://jqlang.github.io/jq

### htop
**What:** Interactive process viewer, better than `top`.  
**Usage:** `htop`  
**Docs:** https://htop.dev

---

## Runtime Management

### mise
**What:** Polyglot runtime version manager — replaces `nvm`, `rbenv`, `pyenv`, `sdkman` with a single tool.  
**Why:** One config file (`.mise.toml`) pins Node, Python, Ruby, Java, Go versions per project. Hooks into zsh automatically.  
**Usage:**

```bash
mise use node@22          # set Node 22 globally
mise use --local python@3.13  # pin Python 3.13 for current project
mise install              # install all versions in .mise.toml
mise list                 # show installed runtimes
```

**Docs:** https://mise.jdx.dev

---

## Package Management

### Homebrew
**What:** The missing package manager for macOS.  
**Why:** Installs CLI tools, GUI apps (casks), and fonts in one place.  
**Key commands:**

```bash
brew install <formula>       # install a CLI tool
brew install --cask <app>    # install a GUI app
brew upgrade                 # update everything
brew list                    # list installed packages
brew doctor                  # diagnose issues
```

**Docs:** https://brew.sh
