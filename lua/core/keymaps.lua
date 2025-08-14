-- Keymaps principaux
vim = vim or {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable the default space key
keymap('', '<Space>', '<Nop>', opts)

-- =============================================================================
-- NORMAL MODE
-- =============================================================================

-- Files
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'Sauvegarder' })
keymap('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Sauvegarder tout' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quitter' })
keymap('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Forcer quitter tout' })
keymap('n', '<leader>x', '<cmd>x<CR>', { desc = 'Sauvegarder et quitter' })

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Fenêtre gauche' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Fenêtre bas' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Fenêtre haut' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Fenêtre droite' })

-- Resize windows
keymap('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Réduire hauteur' })
keymap('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Augmenter hauteur' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Réduire largeur' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Augmenter largeur' })

-- Split windows
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Égaliser splits' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Fermer split' })

-- Buffers navigation
keymap('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Buffer précédent' })
keymap('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Buffer suivant' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Fermer buffer' })
keymap('n', '<leader>bD', '<cmd>%bd|e#<CR>', { desc = 'Fermer autres buffers' })

-- Tabs navigation
keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Nouvel onglet' })
keymap('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Fermer onglet' })
keymap('n', '<leader>to', '<cmd>tabonly<CR>', { desc = 'Fermer autres onglets' })
keymap('n', '<Tab>', '<cmd>tabnext<CR>', { desc = 'Onglet suivant' })
keymap('n', '<S-Tab>', '<cmd>tabprevious<CR>', { desc = 'Onglet précédent' })

-- Quick navigation
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Descendre demi-page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Monter demi-page' })
keymap('n', 'n', 'nzzzv', { desc = 'Recherche suivante centrée' })
keymap('n', 'N', 'Nzzzv', { desc = 'Recherche précédente centrée' })

-- Clear search highlighting
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })

-- Toggle settings
keymap('n', '<leader>uw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })
keymap('n', '<leader>un', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative numbers' })
keymap('n', '<leader>us', '<cmd>set spell!<CR>', { desc = 'Toggle spell check' })

-- =============================================================================
-- MODE INSERTION
-- =============================================================================

-- Escape with jk or jj
keymap('i', 'jk', '<Esc>', { desc = 'Échapper' })
keymap('i', 'jj', '<Esc>', { desc = 'Échapper' })

  -- Quick navigation in insert mode
keymap('i', '<C-h>', '<Left>', { desc = 'Gauche' })
keymap('i', '<C-l>', '<Right>', { desc = 'Droite' })
keymap('i', '<C-j>', '<Down>', { desc = 'Bas' })
keymap('i', '<C-k>', '<Up>', { desc = 'Haut' })

-- Go to beginning/end of line
keymap('i', '<C-a>', '<Home>', { desc = 'Début de ligne' })
keymap('i', '<C-e>', '<End>', { desc = 'Fin de ligne' })

-- =============================================================================
-- VISUAL MODE
-- =============================================================================

-- Indentation
keymap('v', '<', '<gv', { desc = 'Indenter gauche' })
keymap('v', '>', '>gv', { desc = 'Indenter droite' })

-- Move text
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Déplacer bas' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Déplacer haut' })

-- Copier sans perdre le registre
keymap('v', 'p', '"_dP', { desc = 'Coller sans perdre' })

-- =============================================================================
-- WORD MOVEMENT (macOS)
-- =============================================================================

-- Option + arrows
keymap({ 'n', 'i', 'v' }, '<M-Left>', '<C-Left>', { desc = 'Mot gauche' })
keymap({ 'n', 'i', 'v' }, '<M-Right>', '<C-Right>', { desc = 'Mot droite' })

-- Option + b/w (vim style)
keymap({ 'n', 'v' }, '<M-b>', 'b', { desc = 'Mot précédent' })
keymap({ 'n', 'v' }, '<M-w>', 'w', { desc = 'Mot suivant' })
keymap('i', '<M-b>', '<C-o>b', { desc = 'Mot précédent (insert)' })
keymap('i', '<M-w>', '<C-o>w', { desc = 'Mot suivant (insert)' })

-- Command + arrows for beginning/end of line (macOS)
keymap({'n', 'v', 'i'}, '<D-Left>', '<Home>', { desc = 'Début de ligne' })
keymap({'n', 'v', 'i'}, '<D-Right>', '<End>', { desc = 'Fin de ligne' })
keymap({'n', 'v', 'i'}, '<D-Up>', 'gg', { desc = 'Début du fichier' })
keymap({'n', 'v', 'i'}, '<D-Down>', 'G', { desc = 'Fin du fichier' })

-- =============================================================================
-- USEFUL COMMANDS
-- =============================================================================

-- Quickfix
keymap('n', '<leader>co', '<cmd>copen<CR>', { desc = 'Ouvrir quickfix' })
keymap('n', '<leader>cc', '<cmd>cclose<CR>', { desc = 'Fermer quickfix' })
keymap('n', '[q', '<cmd>cprevious<CR>', { desc = 'Quickfix précédent' })
keymap('n', ']q', '<cmd>cnext<CR>', { desc = 'Quickfix suivant' })

-- Location list
keymap('n', '<leader>lo', '<cmd>lopen<CR>', { desc = 'Ouvrir location list' })
keymap('n', '<leader>lc', '<cmd>lclose<CR>', { desc = 'Fermer location list' })
keymap('n', '[l', '<cmd>lprevious<CR>', { desc = 'Location précédente' })
keymap('n', ']l', '<cmd>lnext<CR>', { desc = 'Location suivante' })

-- Macros
keymap('n', 'Q', '@q', { desc = 'Exécuter macro q' })
keymap('x', 'Q', ':norm @q<CR>', { desc = 'Exécuter macro sur sélection' })

-- =============================================================================
-- FORMATAGE
-- =============================================================================

-- Format the current buffer
keymap('n', '<leader>cf', function()
  vim.lsp.buf.format({ async = false })
end, { desc = 'Formater le fichier' })

-- Format the selection
keymap('v', '<leader>cf', function()
  vim.lsp.buf.format({
    async = false,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end, { desc = 'Formater la sélection' })

-- Toggle format on save
keymap('n', '<leader>cF', function()
  vim.g.format_on_save = not vim.g.format_on_save
  if vim.g.format_on_save then
    vim.notify("Format on save: ON", vim.log.levels.INFO)
  else
    vim.notify("Format on save: OFF", vim.log.levels.INFO)
  end
end, { desc = 'Toggle format on save' })
