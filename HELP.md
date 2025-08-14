# 🚀 Complete Neovim Guide - All Keybindings

## 📁 Folder Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── core/               # Base configuration
│   │   ├── options.lua     # Options Neovim
│   │   ├── keymaps.lua     # Global keybindings
│   │   └── autocmds.lua    # Autocommands
│   ├── config/
│   │   └── lazy.lua        # Plugin manager configuration
│   └── plugins/            # Plugin configurations
│       ├── colorscheme.lua # Theme
│       ├── ui.lua          # User interface
│       ├── editor.lua      # Editor tools
│       ├── lsp.lua         # LSP configuration
│       ├── completion.lua  # Autocompletion
│       └── treesitter.lua  # Advanced syntax
└── HELP.md                 # This help file
```

## ⌨️ Complete Keyboard Shortcuts

> **Leader key**: `Espace`

### 🔤 Normal Mode

#### Files and Buffers

| Raccourci    | Action                  |
| ------------ | ----------------------- |
| `<leader>w`  | Save                    |
| `<leader>W`  | Save all files          |
| `<leader>q`  | Quit                    |
| `<leader>Q`  | Force quit              |
| `<leader>x`  | Save and quit           |
| `<leader>bd` | Close buffer            |
| `<leader>bD` | Close all other buffers |
| `Shift+h`    | Previous buffer         |
| `Shift+l`    | Next buffer             |

#### Navigation

| Raccourci      | Action                              |
| -------------- | ----------------------------------- |
| `Ctrl+h/j/k/l` | Navigate between windows            |
| `Ctrl+d`       | Scroll down half-page (centered)    |
| `Ctrl+u`       | Scroll up half-page (centered)      |
| `n`            | Next search (centered)              |
| `N`            | Previous search (centered)          |
| `gg`           | Beginning of file                   |
| `G`            | End of file                         |
| `{` / `}`      | Previous/next paragraph             |
| `%`            | Go to the corresponding parenthesis |

#### Word Movement (macOS)

| Raccourci    | Action                          |
| ------------ | ------------------------------- |
| `Option+←/→` | Left/right word                 |
| `Option+b`   | Previous word                   |
| `Option+w`   | Next word                       |
| `b` / `w`    | Previous/next word (vim native) |
| `e` / `ge`   | Next/previous word (vim native) |

#### Windows and Splits

| Raccourci    | Action           |
| ------------ | ---------------- |
| `<leader>sv` | Split vertical   |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Equalize splits  |
| `<leader>sx` | Close split      |
| `Ctrl+↑/↓`   | Resize height    |
| `Ctrl+←/→`   | Resize width     |

#### Tabs

| Raccourci    | Action           |
| ------------ | ---------------- |
| `<leader>tn` | New tab          |
| `<leader>tc` | Close tab        |
| `<leader>to` | Close other tabs |
| `Tab`        | Next tab         |
| `Shift+Tab`  | Previous tab     |

### 🔍 Telescope (Fuzzy Search)

| Raccourci    | Action                   |
| ------------ | ------------------------ |
| `<leader>ff` | Search files             |
| `<leader>fg` | Search in content (grep) |
| `<leader>fb` | List buffers             |
| `<leader>fh` | Help pages               |
| `<leader>fr` | Recent files             |
| `<leader>fc` | Available commands       |
| `<leader>fk` | All keymaps              |
| `<leader>fs` | Search in current buffer |
| `<leader>fd` | LSP diagnostics          |
| `<leader>fm` | Marks                    |
| `<leader>ft` | List of TODOs            |

### 🌲 File Explorer (NvimTree)

| Raccourci    | Action            |
| ------------ | ----------------- |
| `<leader>e`  | Toggle explorer   |
| `<leader>ef` | Find current file |

**In the explorer:**
| Raccourci | Action |
|-----------|--------|
| `Enter` | Open file/folder |
| `h` | Close folder |
| `l` | Open folder |
| `a` | Create file/folder |
| `r` | Rename |
| `d` | Delete |
| `x` | Cut |
| `c` | Copy |
| `p` | Coller |
| `y` | Copy name |
| `Y` | Copy path |
| `gy` | Copy absolute path |
| `H` | Toggle hidden files |
| `R` | Refresh |

### 💻 LSP (Language Server Protocol)

| Raccourci    | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gD`         | Go to declaration     |
| `gi`         | Go to implementation  |
| `gr`         | See references        |
| `gt`         | Go to type            |
| `K`          | Documentation (hover) |
| `Ctrl+k`     | Function signature    |
| `<leader>lr` | Rename symbol         |
| `<leader>la` | Code actions          |
| `<leader>lf` | Format file           |
| `<leader>ld` | Line diagnostics      |
| `<leader>lq` | Diagnostic list       |
| `<leader>lp` | Preview definition    |
| `<leader>lo` | Code outline          |
| `[d`         | Previous diagnostic   |
| `]d`         | Next diagnostic       |

### 🎨 Formatting

| Raccourci    | Action                          |
| ------------ | ------------------------------- |
| `<leader>cf` | Format file/selection           |
| `<leader>cF` | Toggle automatic format on save |

### 🐙 Git (Gitsigns)

| Raccourci     | Action                                  |
| ------------- | --------------------------------------- |
| `]c`          | Next hunk                               |
| `[c`          | Previous hunk                           |
| `<leader>gs`  | Stage hunk                              |
| `<leader>gr`  | Reset hunk                              |
| `<leader>gS`  | Stage buffer                            |
| `<leader>gR`  | Reset buffer                            |
| `<leader>gu`  | Undo stage hunk                         |
| `<leader>gp`  | Preview hunk                            |
| `<leader>gb`  | Blame line                              |
| `<leader>gtb` | Toggle blame                            |
| `<leader>gd`  | Diff this                               |
| `<leader>gD`  | Diff this ~ (diff with the last commit) |
| `<leader>gtd` | Toggle deleted (show deleted lines)     |

### 💬 Commentaires

| Raccourci     | Action                     |
| ------------- | -------------------------- |
| `gcc`         | Comment/uncomment line     |
| `gbc`         | Comment/uncomment block    |
| `gc` (visual) | Comment selection          |
| `gb` (visual) | Comment block selection    |
| `gcO`         | Add comment above          |
| `gco`         | Add comment below          |
| `gcA`         | Add comment at end of line |

### 🖥️ Terminal

| Raccourci    | Action                   |
| ------------ | ------------------------ |
| `Ctrl+\`     | Toggle floating terminal |
| `<leader>tf` | Floating terminal        |
| `<leader>th` | Horizontal terminal      |
| `<leader>tv` | Vertical terminal        |

**In the terminal:**
| Raccourci | Action |
|-----------|--------|
| `Esc` or `jk` | Normal mode |
| `Ctrl+h/j/k/l` | Navigate between windows |

### ✏️ Mode Insertion

| Raccourci    | Action                         |
| ------------ | ------------------------------ |
| `jk` or `jj` | Escape (return to normal mode) |
| `Ctrl+h/l`   | Left/Right                     |
| `Ctrl+j/k`   | Down/Up                        |
| `Ctrl+a`     | Beginning of line              |
| `Ctrl+e`     | End of line                    |
| `Option+←/→` | Left/Right word                |
| `Option+b/w` | Previous/next word             |

### 🎯 Visual Mode

| Raccourci | Action                            |
| --------- | --------------------------------- |
| `<` / `>` | Indent left/right                 |
| `J` / `K` | Move selection down/up            |
| `p`       | Paste without losing the register |
| `gc`      | Comment selection                 |

### 🔄 Autocomplétion (dans l'éditeur)

| Raccourci    | Action              |
| ------------ | ------------------- |
| `Tab`        | Next suggestion     |
| `Shift+Tab`  | Previous suggestion |
| `Enter`      | Accept suggestion   |
| `Ctrl+Space` | Open suggestions    |
| `Ctrl+e`     | Fermer suggestions  |
| `Ctrl+b/f`   | Scroll docs         |

### 🎨 Surround (entourage de texte)

| Raccourci          | Action                  |
| ------------------ | ----------------------- |
| `ys{motion}{char}` | Entourer avec caractère |
| `ds{char}`         | Supprimer entourage     |
| `cs{old}{new}`     | Changer entourage       |
| `S{char}` (visuel) | Entourer sélection      |

**Exemples:**

- `ysiw"` : Entourer mot avec guillemets
- `ds"` : Supprimer guillemets
- `cs"'` : Changer " en '

### 🔧 Toggle Settings

| Raccourci    | Action                    |
| ------------ | ------------------------- |
| `<leader>uw` | Toggle wrap               |
| `<leader>un` | Toggle numéros relatifs   |
| `<leader>us` | Toggle spell check        |
| `Esc`        | Clear highlight recherche |

### 📋 Quickfix & Location List

| Raccourci    | Action                       |
| ------------ | ---------------------------- |
| `<leader>co` | Ouvrir quickfix              |
| `<leader>cc` | Fermer quickfix              |
| `[q` / `]q`  | Quickfix précédent/suivant   |
| `<leader>lo` | Ouvrir location list         |
| `<leader>lc` | Fermer location list         |
| `[l` / `]l`  | Location précédente/suivante |

### 🎯 Treesitter Text Objects

| Raccourci | Action                         |
| --------- | ------------------------------ |
| `vaf`     | Sélectionner fonction (outer)  |
| `vif`     | Sélectionner fonction (inner)  |
| `vac`     | Sélectionner classe (outer)    |
| `vic`     | Sélectionner classe (inner)    |
| `vaa`     | Sélectionner paramètre (outer) |
| `via`     | Sélectionner paramètre (inner) |

### 📝 Macros

| Raccourci | Action                     |
| --------- | -------------------------- |
| `qa`      | Enregistrer macro dans 'a' |
| `q`       | Arrêter enregistrement     |
| `@a`      | Exécuter macro 'a'         |
| `Q`       | Exécuter macro 'q'         |
| `@@`      | Répéter dernière macro     |

### 🚀 TODO Comments

| Raccourci    | Action              |
| ------------ | ------------------- |
| `]t`         | TODO suivant        |
| `[t`         | TODO précédent      |
| `<leader>ft` | Liste tous les TODO |

**Supported keywords:**

- `TODO:` - Task to do
- `FIX:` / `FIXME:` / `BUG:` - Bug to fix
- `HACK:` - Temporary solution
- `WARN:` / `WARNING:` - Warning
- `PERF:` / `OPTIMIZE:` - Optimization needed
- `NOTE:` / `INFO:` - Important information
- `TEST:` - Test needed

## 🛠️ Commandes Utiles

### Lazy (Gestionnaire de Plugins)

- `:Lazy` - Plugin manager
- `:Lazy update` - Update plugins
- `:Lazy sync` - Sync plugins
- `:Lazy clean` - Clean unused plugins

### Mason (Gestionnaire LSP)

- `:Mason` - LSP manager
- `:MasonUpdate` - Update Mason
- `:MasonInstall <server>` - Install an LSP server

### Telescope

- `:Telescope` - See all Telescope commands
- `:Telescope help_tags` - Search in help

### Divers

- `:checkhealth` - Check Neovim health
- `:TSInstall <language>` - Install Treesitter support
- `:ConformInfo` - Info on formatters

## 💡 Tips & Tricks

1. **Which-key**: Press `<leader>` and wait for all shortcuts to appear

2. **Quick search**:

   - `/` to search
   - `*` to search the word under the cursor
   - `Ctrl+/` in Telescope to see the history

3. **Navigation rapide**:

   - `Ctrl+o` to go back in history
   - `Ctrl+i` to go forward in history
   - `''` to go back to the last position

4. **Quick editing**:

   - `ci"` to change the content between quotes
   - `da(` to delete around parentheses
   - `.` to repeat the last command

5. **Multi-cursors** (with substitution):

   - `:%s/old/new/g` - Replace in the whole file
   - `:s/old/new/g` - Replace in the line
   - Visual + `:s/old/new/g` - Replace in the selection

6. **Marks**:
   - `ma` - Create mark 'a'
   - `'a` - Go to mark 'a'
   - `:marks` - See all marks

## 🔄 Update

To update this configuration:

1. `:Lazy update` - Update plugins
2. `:TSUpdate` - Update Treesitter
3. `:MasonUpdate` - Update LSP servers

---

**Reminder**: Leader key = `Space`

To see this file in Neovim: `:e ~/.config/nvim/HELP.md`
