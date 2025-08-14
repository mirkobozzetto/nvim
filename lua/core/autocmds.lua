-- Autocommandes
vim = vim or {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight lors du yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- Retour à la dernière position dans le fichier
augroup('RememberPosition', { clear = true })
autocmd('BufReadPost', {
  group = 'RememberPosition',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Format automatique à la sauvegarde (basé sur vim.g.format_on_save)
vim.g.format_on_save = false -- Désactivé par défaut

augroup('FormatOnSave', { clear = true })
autocmd('BufWritePre', {
  group = 'FormatOnSave',
  pattern = { '*.lua', '*.py', '*.js', '*.ts', '*.jsx', '*.tsx', '*.json', '*.html', '*.css', '*.scss' },
  callback = function()
    if vim.g.format_on_save then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Close some buffers with 'q'
augroup('QuickClose', { clear = true })
autocmd('FileType', {
  group = 'QuickClose',
  pattern = { 'help', 'qf', 'lspinfo', 'man', 'notify' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = true, silent = true })
  end,
})

-- Disable line numbers in terminal
augroup('TerminalSettings', { clear = true })
autocmd('TermOpen', {
  group = 'TerminalSettings',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

-- Create directories automatically if they don't exist
augroup('MkdirOnSave', { clear = true })
autocmd('BufWritePre', {
  group = 'MkdirOnSave',
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Remove trailing spaces
augroup('TrimWhitespace', { clear = true })
autocmd('BufWritePre', {
  group = 'TrimWhitespace',
  pattern = '*',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})
