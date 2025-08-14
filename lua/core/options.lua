-- Options de configuration Neovim
vim = vim or {}

local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = ' '
g.maplocalleader = ' '

-- Interface
opt.number = true          -- Line numbers
opt.relativenumber = true  -- Relative line numbers
opt.cursorline = true      -- Highlight current line
opt.signcolumn = 'yes'     -- Always show the sign column
-- opt.colorcolumn = '80,120' -- Guides lines disabled (format on save active)
opt.wrap = false           -- No automatic line wrapping
opt.scrolloff = 8          -- Minimum lines above/below the cursor
opt.sidescrolloff = 8      -- Minimum columns left/right of the cursor

-- Indentation
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Indentation size
opt.tabstop = 2        -- Size of a tab
opt.softtabstop = 2    -- Size of a tab in insert mode
opt.smartindent = true -- Smart indentation
opt.breakindent = true -- Indentation preserved on wrapped lines

-- Recherche
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true  -- Case-sensitive if uppercase in search
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Incremental search

-- Comportement
opt.mouse = 'a'                               -- Mouse support
opt.clipboard = 'unnamedplus'                 -- Use system clipboard
opt.undofile = true                           -- Save undo history
opt.updatetime = 250                          -- Update time (ms)
opt.timeoutlen = 300                          -- Timeout for key combinations
opt.completeopt = 'menuone,noselect,noinsert' -- Autocompletion options
opt.wildmode = 'longest:full,full'            -- Completion mode for command line

-- Apparence
opt.termguicolors = true      -- 24-bit colors
opt.pumheight = 10            -- Maximum height of the popup menu
opt.showmode = false          -- Don't show the mode (already in lualine)
opt.splitbelow = true         -- New splits below
opt.splitright = true         -- New splits to the right
opt.fillchars = { eob = ' ' } -- Remove ~ at the end of the buffer

-- Performance
opt.lazyredraw = false -- Redraw only when necessary
opt.synmaxcol = 240    -- Maximum column for syntax

-- Backup
opt.backup = false      -- No backup files
opt.swapfile = false    -- No swap files
opt.writebackup = false -- No backup before writing

-- Sessions
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,terminal'
