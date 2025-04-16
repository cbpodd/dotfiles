-- [[ plug_config.lua ]]

-- [[ monokai ]]
require('monokai').setup {}

-- [[ nvim-notify ]]
local notify = require('notify')
notify.setup()
vim.notifiy = notify

-- [[ Telescope ]]
require('telescope').load_extension("notify")

-- [[ lualine ]]
require("lualine").setup()

-- [[ nvim-treesitter ]]
require("nvim-treesitter").setup({
    ensure_installed = { 
        "c_sharp",
        "json",
        "lua",
        "rust",
        "toml",
        "json",
        "yaml",
        "markdown",
    }
})

-- [[ nvim-comment ]]
require("nvim_comment").setup({ comment_empty = false })

-- [[ barbar ]]
require("barbar").setup({
    auto_hide = true,
    sidebar_filetypes = {
        NvimTree = { text = "files" },
        undotree = { text = "undo" },
    },
})

-- [[ nvim-cursorline ]]
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- [[ telescope-tabs ]]
require('telescope-tabs').setup {}

-- [[ wilder ]]
local wilder = require('wilder')
wilder.setup({
    modes = {':', '/', '?'},
    next_key = '<C-n>',
    previous_key = '<C-p>',
    accept_key = '<C-CR>',
})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}))

-- [[ bad-practices ]]
require('bad_practices').setup({
    most_splits = 10, -- how many splits are considered a good practice(default: 3)
    most_tabs = 20, -- how many tabs are considered a good practice(default: 3)
    max_hjkl = 10, -- how many times you can spam hjkl keys in a row(default: 10)
})

-- [[ Mason ]]
require('mason').setup()
require('mason-lspconfig').setup {
    automatic_installation = true,
}
    -- ensure_installed = {
    --     "lua_ls",
    --     "rust_analyzer",
    --     "omnisharp",
    --     "clangd",
    --     "dockerls",
    --     "jsonls",
    --     "marksman",
    --     "powershell_es",
    --     "jedi_language_server",
    --     "taplo",
    --     "lemminx",
    --     "yamlls",
    -- },

-- [[ LSPConfig ]]
local lsp = require('lspconfig')

-- [[ Rust-Neotest ]]
require("neotest").setup({
  adapters = {
    require('rustaceanvim.neotest')
  }
})

-- [[ DAP ]]
local dap = require('dap')
dap.adapters.codelldb = {
  type = "executable",
  command = "C:\\Users\\cameronpodd\\bin\\codelldb-win32-x64\\extension\\adapter\\codelldb.exe",

  -- On windows you may have to uncomment this:
  detached = false,
}

-- [[ nvim-cmp ]]
-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})
