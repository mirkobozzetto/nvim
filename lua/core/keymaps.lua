-- Main keymaps
vim = vim or {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable the default space key
keymap('', '<Space>', '<Nop>', opts)

-- =============================================================================
-- NORMAL MODE
-- =============================================================================

-- Files
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
keymap('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Force quit all' })
keymap('n', '<leader>x', '<cmd>x<CR>', { desc = 'Save and quit' })

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

-- Resize windows
keymap('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Decrease height' })
keymap('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Increase height' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease width' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase width' })

-- Split windows
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Equalize splits' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close split' })

-- Buffers navigation
keymap('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
keymap('n', '<leader>bD', '<cmd>%bd|e#<CR>', { desc = 'Close other buffers' })

-- Tabs navigation
keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'New tab' })
keymap('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })
keymap('n', '<leader>to', '<cmd>tabonly<CR>', { desc = 'Close other tabs' })
keymap('n', '<Tab>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
keymap('n', '<S-Tab>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- Quick navigation
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half page' })
keymap('n', 'n', 'nzzzv', { desc = 'Next search centered' })
keymap('n', 'N', 'Nzzzv', { desc = 'Previous search centered' })

-- Clear search highlighting
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })

-- Toggle settings
keymap('n', '<leader>uw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })
keymap('n', '<leader>un', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative numbers' })
keymap('n', '<leader>us', '<cmd>set spell!<CR>', { desc = 'Toggle spell check' })

-- =============================================================================
-- INSERT MODE
-- =============================================================================

-- Escape with jk or jj
keymap('i', 'jk', '<Esc>', { desc = 'Escape' })
keymap('i', 'jj', '<Esc>', { desc = 'Escape' })

  -- Quick navigation in insert mode
keymap('i', '<C-h>', '<Left>', { desc = 'Left' })
keymap('i', '<C-l>', '<Right>', { desc = 'Right' })
keymap('i', '<C-j>', '<Down>', { desc = 'Down' })
keymap('i', '<C-k>', '<Up>', { desc = 'Up' })

-- Go to beginning/end of line
keymap('i', '<C-a>', '<Home>', { desc = 'Beginning of line' })
keymap('i', '<C-e>', '<End>', { desc = 'End of line' })

-- =============================================================================
-- VISUAL MODE
-- =============================================================================

-- Indentation
keymap('v', '<', '<gv', { desc = 'Indent left' })
keymap('v', '>', '>gv', { desc = 'Indent right' })

-- Move text
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up' })

-- Copy without losing register
keymap('v', 'p', '"_dP', { desc = 'Paste without losing' })

-- =============================================================================
-- WORD MOVEMENT (macOS)
-- =============================================================================

-- Option + arrows
keymap({ 'n', 'i', 'v' }, '<M-Left>', '<C-Left>', { desc = 'Word left' })
keymap({ 'n', 'i', 'v' }, '<M-Right>', '<C-Right>', { desc = 'Word right' })

-- Option + b/w (vim style)
keymap({ 'n', 'v' }, '<M-b>', 'b', { desc = 'Previous word' })
keymap({ 'n', 'v' }, '<M-w>', 'w', { desc = 'Next word' })
keymap('i', '<M-b>', '<C-o>b', { desc = 'Previous word (insert)' })
keymap('i', '<M-w>', '<C-o>w', { desc = 'Next word (insert)' })

-- Command + arrows for beginning/end of line (macOS)
keymap({'n', 'v', 'i'}, '<D-Left>', '<Home>', { desc = 'Beginning of line' })
keymap({'n', 'v', 'i'}, '<D-Right>', '<End>', { desc = 'End of line' })
keymap({'n', 'v', 'i'}, '<D-Up>', 'gg', { desc = 'Beginning of file' })
keymap({'n', 'v', 'i'}, '<D-Down>', 'G', { desc = 'End of file' })

-- =============================================================================
-- USEFUL COMMANDS
-- =============================================================================

-- Quickfix
keymap('n', '<leader>co', '<cmd>copen<CR>', { desc = 'Open quickfix' })
keymap('n', '<leader>cc', '<cmd>cclose<CR>', { desc = 'Close quickfix' })
keymap('n', '[q', '<cmd>cprevious<CR>', { desc = 'Previous quickfix' })
keymap('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix' })

-- Location list
keymap('n', '<leader>lo', '<cmd>lopen<CR>', { desc = 'Open location list' })
keymap('n', '<leader>lc', '<cmd>lclose<CR>', { desc = 'Close location list' })
keymap('n', '[l', '<cmd>lprevious<CR>', { desc = 'Previous location' })
keymap('n', ']l', '<cmd>lnext<CR>', { desc = 'Next location' })

-- Macros
keymap('n', 'Q', '@q', { desc = 'Execute macro q' })
keymap('x', 'Q', ':norm @q<CR>', { desc = 'Execute macro on selection' })

-- =============================================================================
-- FORMATTING
-- =============================================================================

-- Format the current buffer
keymap('n', '<leader>cf', function()
  vim.lsp.buf.format({ async = false })
end, { desc = 'Format file' })

-- Format the selection
keymap('v', '<leader>cf', function()
  vim.lsp.buf.format({
    async = false,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end, { desc = 'Format selection' })

-- Toggle format on save
keymap('n', '<leader>cF', function()
  vim.g.format_on_save = not vim.g.format_on_save
  if vim.g.format_on_save then
    vim.notify("Format on save: ON", vim.log.levels.INFO)
  else
    vim.notify("Format on save: OFF", vim.log.levels.INFO)
  end
end, { desc = 'Toggle format on save' })
