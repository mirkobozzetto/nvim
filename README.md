# 🚀 MIRKOvim

<div align="center">

**A modern, feature-rich Neovim configuration built for productivity**

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1+-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

</div>

---

## ✨ Features

### 🎯 Core Features

- **📁 Modular Architecture** - Clean, maintainable configuration structure
- **⚡ Lightning Fast** - Lazy loading for optimal startup time
- **🎨 Beautiful UI** - Catppuccin theme with custom dashboard
- **📝 Smart Completion** - LSP-powered autocompletion with snippets
- **🔍 Fuzzy Finding** - Telescope for file, text, and command searching
- **🌲 File Explorer** - NvimTree with git integration
- **💻 Multi-Language Support** - LSP configurations for popular languages

### 🛠️ Development Tools

- **🔧 LSP Integration** - Full language server support with Mason
- **🎯 Treesitter** - Advanced syntax highlighting and text objects
- **🐙 Git Integration** - Gitsigns for inline git information
- **📊 Status Line** - Informative Lualine with git & diagnostic info
- **🔄 Auto-pairs** - Smart bracket and quote completion
- **💬 Comments** - Quick comment toggling with `gcc`
- **🎨 Formatting** - Auto-format on save (toggleable)
- **🖥️ Terminal** - Integrated floating terminal

## 📦 Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Node.js (for some LSP servers)
- Python 3 (optional, for Python development)
- Ripgrep (for better searching)

### Quick Install

1. **Backup your existing config** (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Clone this configuration**:

```bash
git clone https://github.com/yourusername/MIRKOvim.git ~/.config/nvim
```

3. **Start Neovim**:

```bash
nvim
```

The first launch will automatically install all plugins and LSP servers!

## 🎮 Key Mappings

> **Leader key**: `Space`

### 📝 Essential Shortcuts

| Key          | Description          |
| ------------ | -------------------- |
| `Space + e`  | Toggle file explorer |
| `Space + ff` | Find files           |
| `Space + fg` | Live grep            |
| `Space + fb` | Browse buffers       |
| `Space + w`  | Save file            |
| `Space + q`  | Quit                 |

### 🔍 Navigation

| Key              | Description              |
| ---------------- | ------------------------ |
| `Ctrl + h/j/k/l` | Navigate between windows |
| `Shift + h/l`    | Navigate buffers         |
| `Option + ←/→`   | Move by word (macOS)     |
| `Tab`            | Next tab                 |
| `Shift + Tab`    | Previous tab             |

### 💻 Code Actions

| Key          | Description         |
| ------------ | ------------------- |
| `gd`         | Go to definition    |
| `K`          | Hover documentation |
| `Space + lr` | Rename symbol       |
| `Space + la` | Code actions        |
| `Space + cf` | Format file         |
| `gcc`        | Toggle comment      |

### 🖥️ Terminal

| Key          | Description              |
| ------------ | ------------------------ |
| `Ctrl + \`   | Toggle floating terminal |
| `Space + th` | Horizontal terminal      |
| `Space + tv` | Vertical terminal        |

> 💡 **Pro Tip**: Press `Space` and wait to see all available keymaps with WhichKey!

## 📂 Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── core/               # Core settings
│   │   ├── options.lua     # Neovim options
│   │   ├── keymaps.lua     # Key mappings
│   │   └── autocmds.lua    # Auto commands
│   ├── config/
│   │   └── lazy.lua        # Plugin manager config
│   └── plugins/            # Plugin configurations
│       ├── colorscheme.lua # Theme settings
│       ├── ui.lua          # UI plugins
│       ├── editor.lua      # Editor enhancements
│       ├── lsp.lua         # Language servers
│       ├── completion.lua  # Autocompletion
│       └── treesitter.lua  # Syntax highlighting
├── HELP.md                 # Complete shortcuts guide
└── README.md               # This file
```

## 🔌 Included Plugins

### UI & Theme

- 🎨 [Catppuccin](https://github.com/catppuccin/nvim) - Soothing pastel theme
- 📊 [Lualine](https://github.com/nvim-lualine/lualine.nvim) - Fast statusline
- 🌲 [NvimTree](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- 🚀 [Alpha](https://github.com/goolord/alpha-nvim) - Start screen
- 📢 [Notify](https://github.com/rcarriga/nvim-notify) - Beautiful notifications

### Editor

- 🔍 [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- 💬 [Comment](https://github.com/numToStr/Comment.nvim) - Smart comments
- 🔄 [Autopairs](https://github.com/windwp/nvim-autopairs) - Auto close brackets
- 🎯 [Todo Comments](https://github.com/folke/todo-comments.nvim) - Highlight TODOs
- 🖥️ [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) - Terminal integration

### Development

- 🔧 [LSP Config](https://github.com/neovim/nvim-lspconfig) - Language servers
- 📦 [Mason](https://github.com/williamboman/mason.nvim) - LSP installer
- 🌳 [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- 🔮 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- 🐙 [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration

## 🎨 Customization

### Adding Custom Keymaps

Edit `lua/core/keymaps.lua`:

```lua
vim.keymap.set('n', '<leader>xx', '<cmd>YourCommand<CR>', { desc = 'Description' })
```

### Installing New Plugins

Add to any file in `lua/plugins/`:

```lua
return {
  {
    'author/plugin-name',
    config = function()
      require('plugin-name').setup({})
    end,
  },
}
```

### Changing Theme

Edit `lua/plugins/colorscheme.lua` and replace catppuccin with your preferred theme.

## 🚀 Commands

| Command           | Description         |
| ----------------- | ------------------- |
| `:Lazy`           | Plugin manager      |
| `:Mason`          | LSP installer       |
| `:checkhealth`    | Check Neovim health |
| `:Telescope`      | Open Telescope      |
| `:NvimTreeToggle` | Toggle file tree    |

## 📚 Documentation

- **Complete keybindings**: See [HELP.md](HELP.md) for all shortcuts
- **Quick help**: Press `Space` and wait for WhichKey
- **Neovim help**: `:help` in Neovim

## 🤝 Contributing

Contributions are welcome! Feel free to:

- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

Special thanks to the Neovim community and all the plugin authors who made this configuration possible.

---

<div align="center">

**Enjoy coding with MIRKOvim! 🚀**

Made with ❤️ by Mirko

</div>
