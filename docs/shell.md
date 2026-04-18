# Shell

## zsh

**What:** Z shell — the default shell on macOS since Catalina (10.15).  
**Why over bash:** Better tab completion, glob expansion, plugin ecosystem, and it's what Apple ships.  
**Config file:** `~/.zshrc` — loaded on every interactive session.

```
Terminal opens
  └── ~/.zshrc
        ├── sources ~/.bash_aliases
        ├── sources ~/.environment
        ├── initialises starship prompt
        ├── initialises fzf keybindings
        ├── initialises zoxide
        ├── initialises mise
        └── initialises direnv
```

---

## Starship

**What:** Cross-shell prompt written in Rust.  
**Why:** Replaces hand-rolled bash PS1 (~110 lines). Faster (uses libgit2, not git subshells), works in any shell, shows git branch/status/ahead-behind out of the box.  
**Config:** `~/.config/starship.toml`  
**Docs:** https://starship.rs

Prompt segments active in this config:

| Segment | Shows |
|---|---|
| `username` | only when root |
| `hostname` | only over SSH |
| `directory` | current path, truncated to 4 parts |
| `git_branch` | branch name with  icon |
| `git_status` | `+` staged · `!` modified · `?` untracked · `$` stashed · `⇡⇣` ahead/behind |
| `character` | `❯` green on success, red on error |

---

## fzf

**What:** Command-line fuzzy finder.  
**Why:** Makes history search (`Ctrl-R`), file search (`Ctrl-T`), and `cd` (`Alt-C`) interactive and instant.  
**Keybindings:** activated via `~/.fzf.zsh` sourced in `.zshrc`.  
**Docs:** https://github.com/junegunn/fzf

---

## zoxide

**What:** Smarter `cd` that learns your most-visited directories.  
**Why:** Type `z proj` instead of `cd ~/work/projects/myproject`.  
**Usage:** `z <partial name>` · `zi` for interactive picker (uses fzf).  
**Docs:** https://github.com/ajeetdsouza/zoxide

---

## direnv

**What:** Loads/unloads environment variables when entering/leaving a directory.  
**Why:** Per-project env vars (API keys, `PATH` additions) without polluting the global shell.  
**Usage:** Create a `.envrc` in any folder, run `direnv allow`.  
**Docs:** https://direnv.net
