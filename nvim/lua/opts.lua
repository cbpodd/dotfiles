--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = '80,120,160,240'
opt.number = true
opt.wildmenu = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"

opt.lazyredraw = true


-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for
opt.backspace = "indent,eol,start"
opt.smarttab = true
opt.autoindent = true
opt.cindent = true

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Folding ]]
opt.foldenable = true
opt.foldlevelstart = 3

-- [[ Spell check ]]
opt.spell = true
opt.spelllang = "en_us"
