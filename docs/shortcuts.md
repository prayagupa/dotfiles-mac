# Shortcuts

## GitHub Copilot

**Plugin:** `github/copilot.vim`  
**Setup:** Run `:Copilot setup` once to authenticate with your GitHub account.  
**Docs:** https://github.com/github/copilot.vim

### Suggestions

| Key | Action |
|---|---|
| `Tab` | Accept suggestion |
| `Ctrl-]` | Dismiss suggestion |
| `Alt-]` | Next suggestion |
| `Alt-[` | Previous suggestion |
| `Alt-\` | Trigger suggestion manually |

### Commands

| Command | Action |
|---|---|
| `:Copilot setup` | Authenticate with GitHub |
| `:Copilot enable` | Enable Copilot |
| `:Copilot disable` | Disable Copilot |
| `:Copilot status` | Show current status |
| `:Copilot panel` | Open suggestion panel (multiple options) |

---

## NERDTree (Vim file explorer)

**Plugin:** `scrooloose/nerdtree`  
**Docs:** https://github.com/preservim/nerdtree

### Custom keybindings (from `.vimrc`)

| Key | Action |
|---|---|
| `Ctrl-n` | Toggle NERDTree |
| `Ctrl-f` | Reveal current file in NERDTree |

### Focus / window switching

| Key | Action |
|---|---|
| `Ctrl-f` | Jump to NERDTree and reveal current file (from any window) |
| `Ctrl-w w` | Cycle focus between NERDTree and editor |
| `Ctrl-w h` | Move focus left → into NERDTree |
| `Ctrl-w l` | Move focus right → back to editor |

### Navigation

| Key | Action |
|---|---|
| `j` / `k` | Move down / up |
| `o` | Open file or toggle directory |
| `t` | Open in new tab |
| `s` | Open in vertical split |
| `i` | Open in horizontal split |
| `go` | Preview file (cursor stays in NERDTree) |
| `p` | Jump to parent directory node |
| `P` | Jump to root node |
| `K` / `J` | Jump to first / last child of current directory |

### File system operations

| Key | Action |
|---|---|
| `m` | Open NERDTree menu (create, rename, delete, move) |
| `ma` | Create file or directory (`/` suffix for directory) |
| `mm` | Move / rename |
| `md` | Delete |
| `mc` | Copy |

### Tree manipulation

| Key | Action |
|---|---|
| `C` | Change tree root to selected directory |
| `u` | Move tree root one level up |
| `R` | Refresh the tree |
| `I` | Toggle hidden files |
| `q` | Close NERDTree |
