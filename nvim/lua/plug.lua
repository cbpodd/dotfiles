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
-- local spider = { "chrisgrieser/nvim-spider", lazy = true } didn't love this one
local move = { "hinell/move.nvim" }
local bad_practices = { 'antonk52/bad-practices.nvim' }

-- [[ LSP ]]
local mason = { 'williamboman/mason.nvim' }
local mason_lspconfig = { 'williamboman/mason-lspconfig.nvim' }
local lspconfig = { 'neovim/nvim-lspconfig' }

-- [[ Copilot ]]
local github_copilot = { 'github/copilot.vim' }

local ufo = {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        require("ufo").setup({})
    end,
}

-- [[ Rust ]]
-- [[ rustaceanvim]]
-- vim.g.rustaceanvim = {
  -- LSP configuration
  -- server = {
    -- default_settings = {
      -- rust-analyzer language server configuration
      -- ['rust-analyzer'] = {
          -- cargo = {
              -- allFeatures = true,
              -- check = {
                  -- command = "cranky",
              -- },
          -- }
      -- },
    -- },
  -- },
-- }

local rustaceanvim = {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
}
local crates = {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup()
    end,
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

local cmp = { "hrsh7th/nvim-cmp" }
local cmp_lsp = { "hrsh7th/cmp-nvim-lsp" }
local cmp_nvim_lua = { "hrsh7th/cmp-nvim-lua" }
local cmp_lsp_signature_help = { "hrsh7th/cmp-nvim-lsp-signature-help" }
local cmp_vsnip = { "hrsh7th/cmp-vsnip" }
local cmp_path = { "hrsh7th/cmp-path" }
local cmp_buffer = { "hrsh7th/cmp-buffer" }
local vim_vsnip = { "hrsh7th/vim-vsnip" }

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
    -- spider,
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
    crates,
    neotest,
    dap,
    cmp,
    cmp_lsp,
    cmp_nvim_lua,
    cmp_lsp_signature_help,
    cmp_vsnip,
    cmp_path,
    cmp_buffer,
    vim_vsnip,
    ufo,
}

require("lazy").setup(plugins)
