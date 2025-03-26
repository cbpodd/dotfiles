-- [[ plug.lua ]]

-- [[ Boostrap Lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]

-- [[ Theme ]]
-- local gruvbox = {
--     'morhetz/gruvbox',
--     config = function() vim.cmd.colorscheme("gruvbox") end
-- }
local monokai = { 'tanvirtin/monokai.nvim' }

-- [[ Visual ]]
local tree_sitter = {
    'nvim-treesitter/nvim-treesitter'
}
local error_lens = {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    }
}
local startify = {
    'mhinz/vim-startify'
}
local devicons = {
    "nvim-tree/nvim-web-devicons", opts = {}
}
local lualine = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 
      'nvim-tree/nvim-web-devicons',
      opt = true,
  },
}
local indentLine = { 'Yggdroot/indentline' }
local barbar = {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
}
local cursorline = { 'yamatsum/nvim-cursorline' }
local wilder = { 'gelguy/wilder.nvim' }
local numbertoggle = { "sitiom/nvim-numbertoggle" }

-- [[ Filesystem ]]
local nvim_tree = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = true,
}
local mkdir = { 'jghauser/mkdir.nvim' }

-- [[ Telescope ]]
local telescope = {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
}
local telescope_tabs = {
	'LukasPietzschmann/telescope-tabs',
	dependencies = { 'nvim-telescope/telescope.nvim' },
}
local notify = { 'rcarriga/nvim-notify' }

-- [[ Editing ]]
local nvim_comment = { 'terrortylor/nvim-comment' }
local undotree = { 'mbbill/undotree' }
local surround = { 'tpope/vim-surround' }
local autopairs = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
}
local muren = {
  'AckslD/muren.nvim',
  config = true,
}

-- [[ Git ]]
local fugitive = { 'tpope/vim-fugitive' }
local gv = { 'junegunn/gv.vim' }
local git_conflict = {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
}
local git_blame = { 'f-person/git-blame.nvim' }


-- [[ Terminal ]]
local floaterm = { 'voldikss/vim-floaterm' }

-- [[ Movement ]]
local spider = { "chrisgrieser/nvim-spider", lazy = true }
local move = { "hinell/move.nvim" }
local bad_practices = { 'antonk52/bad-practices.nvim' }

-- [[ LSP ]]
local mason = { 'williamboman/mason.nvim' }
local mason_lspconfig = { 'williamboman/mason-lspconfig.nvim' }
local lspconfig = { 'neovim/nvim-lspconfig' }

-- [[ Copilot ]]
local github_copilot = { 'github/copilot.vim' }

-- [[ Rust ]]
local rustaceanvim = {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
}

-- [[ Testing ]]
local neotest = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  }
}
-- [[ Debugging ]]
local dap = { 'mfussenegger/nvim-dap' }

-- [[ Plugins ]]
local plugins = {
    monokai,
    error_lens,
    nvim_tree,
    devicons,
    startify,
    lualine,
    tree_sitter,
    nvim_comment,
    telescope,
    indentLine,
    fugitive,
    gv,
    autopairs,
    floaterm,
    undotree,
    surround,
    barbar,
    git_conflict,
    cursorline,
    mkdir,
    git_blame,
    spider,
    telescope_tabs,
    wilder,
    notify,
    move,
    bad_practices,
    numbertoggle,
    muren,
    mason,
    mason_lspconfig,
    lspconfig,
    github_copilot,
    rustaceanvim,
    neotest,
    dap,
}

require("lazy").setup(plugins)
