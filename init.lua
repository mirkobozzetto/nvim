-- Neovim Configuration Entry Point
-- Charge les modules de configuration

-- Core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Plugin manager
require('config.lazy')
