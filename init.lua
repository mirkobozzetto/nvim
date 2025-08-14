-- Neovim Configuration Entry Point
-- Load configuration modules

-- Core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Plugin manager
require('config.lazy')
