-- [[ init.lua ]]

-- [[ LEADER ]]
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"

vim.g.mapleader = ","
vim.g.localleader = "\\"

vim.loader.enable()

-- IMPORTS
require('plug')    -- Plugins
require('plug_config') -- Plugin Configuration
require('vars')    -- Variables
require('opts')    -- Options
require('keys')    -- Keymaps
