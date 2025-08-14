-- Options de configuration Neovim
vim = vim or {}

local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = ' '
g.maplocalleader = ' '

-- Interface
opt.number = true          -- Numéros de lignes
opt.relativenumber = true  -- Numéros relatifs
opt.cursorline = true      -- Highlight ligne courante
opt.signcolumn = 'yes'     -- Toujours afficher la colonne des signes
opt.colorcolumn = '80,120' -- Lignes guides à 80 et 120 caractères
opt.wrap = false           -- Pas de retour à la ligne automatique
opt.scrolloff = 8          -- Lignes minimum au-dessus/en-dessous du curseur
opt.sidescrolloff = 8      -- Colonnes minimum à gauche/droite

-- Indentation
opt.expandtab = true   -- Utiliser des espaces au lieu de tabs
opt.shiftwidth = 2     -- Taille de l'indentation
opt.tabstop = 2        -- Taille d'une tabulation
opt.softtabstop = 2    -- Taille d'une tabulation en mode insertion
opt.smartindent = true -- Indentation intelligente
opt.breakindent = true -- Indentation conservée sur les lignes wrappées

-- Recherche
opt.ignorecase = true -- Recherche insensible à la casse
opt.smartcase = true  -- Sensible si majuscule dans la recherche
opt.hlsearch = true   -- Highlight les résultats
opt.incsearch = true  -- Recherche incrémentale

-- Comportement
opt.mouse = 'a'                               -- Support de la souris
opt.clipboard = 'unnamedplus'                 -- Utiliser le clipboard système
opt.undofile = true                           -- Sauvegarder l'historique undo
opt.updatetime = 250                          -- Temps avant mise à jour (ms)
opt.timeoutlen = 300                          -- Temps d'attente pour les combinaisons de touches
opt.completeopt = 'menuone,noselect,noinsert' -- Options pour l'autocomplétion
opt.wildmode = 'longest:full,full'            -- Mode de complétion en ligne de commande

-- Apparence
opt.termguicolors = true      -- Couleurs 24-bit
opt.pumheight = 10            -- Hauteur max du menu popup
opt.showmode = false          -- Ne pas afficher le mode (déjà dans lualine)
opt.splitbelow = true         -- Nouveaux splits en bas
opt.splitright = true         -- Nouveaux splits à droite
opt.fillchars = { eob = ' ' } -- Supprimer les ~ en fin de buffer

-- Performance
opt.lazyredraw = false -- Redraw seulement quand nécessaire
opt.synmaxcol = 240    -- Limite de colonne pour la syntaxe

-- Backup
opt.backup = false      -- Pas de fichiers backup
opt.swapfile = false    -- Pas de fichiers swap
opt.writebackup = false -- Pas de backup avant écriture

-- Sessions
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,terminal'
