# Editor

## Neovim

**What:** Hyperextensible Vim-based text editor.  
**Why over Vim:** Async plugin support, built-in LSP client, Lua config, active community. Fully backwards-compatible with Vim keybindings.  
**Config:** `~/.config/nvim/`  
**Docs:** https://neovim.io

### Key binding

| Key | Action |
|---|---|
| `C-n` | Toggle file explorer |

---

## Vim

**What:** Classic modal text editor, kept as a fallback.  
**Config:** `~/.vimrc`

---

## vim-plug

**What:** Minimalist plugin manager for Vim and Neovim.  
**Why over Vundle/Pathogen:** Parallel installs, on-demand loading, actively maintained. Vundle was abandoned ~2020, Pathogen has no lazy loading.  
**Config location:** declared inside `~/.vimrc` (Vim) and `~/.config/nvim/init.vim` or `init.lua` (Neovim).  
**Docs:** https://github.com/junegunn/vim-plug

### Common commands

```vim
:PlugInstall    " install declared plugins
:PlugUpdate     " update all plugins
:PlugClean      " remove unused plugins
:PlugStatus     " check plugin status
```

---

## WezTerm

**What:** GPU-accelerated terminal emulator written in Rust, configured in Lua.  
**Why:** Native ligature support, multiplexing built-in, consistent cross-platform, JetBrains Mono Nerd Font renders perfectly.  
**Docs:** https://wezfurlong.org/wezterm

---

## JetBrains Mono Nerd Font

**What:** Monospace font patched with thousands of icons (Nerd Fonts).  
**Why:** Required for Starship prompt icons ( branch symbol, language icons) and eza file-type icons to render correctly.  
**Installed via:** `brew install --cask font-jetbrains-mono-nerd-font`
