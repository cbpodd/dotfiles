-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

local silentnoremap = {noremap = true, silent = true}

-- [[ Remap Tabs ]]
map('n', 'T', ':tabnew ', {noremap=true})
map('n', 'J', ':tabp<CR>', silentnoremap)
map('n', 'K', ':tabn<CR>', silentnoremap)

-- [[ Intuitive Increment & Decrement ]]
map('n', '+', '<c-a>', silentnoremap)
map('n', '-', '<c-x>', silentnoremap)

-- [[ New Line Inplace ]]
map('n', '_', 'm`o<Esc>``', silentnoremap)
map('n', '<C-_>', 'm`O<Esc>``', silentnoremap)

-- [[ Common Typos ]]
map('n', ';', ':', {noremap=true})

-- [[ Plugins ]]
-- Toggle nvim tree
map('n', '+', [[:NvimTreeToggle<CR>]], silentnoremap)

-- Undotree
set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Telescope
local builtin = require('telescope.builtin')
set('n', '<leader>ff', builtin.find_files, {})
set('n', '<leader>fg', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fh', builtin.help_tags, {})
local telescope_tabs = require('telescope-tabs')
set('n', '<leader>ft', telescope_tabs.list_tabs, {})

-- Floatterm
map('n', '<leader>tc', [[:FloatermNew<cr>]], silentnoremap)
map('t', '<leader>tc', [[<C-\><C-n>:FloatermNew<cr>]], silentnoremap)
map('n', '<leader>tt', [[:FloatermToggle<cr>]], silentnoremap)
map('t', '<leader>tt', [[<C-\><C-n>:FloatermToggle<cr>]], silentnoremap)
map('n', '<leader>tn', [[:FloatermNext<cr>]], silentnoremap)
map('t', '<leader>tn', [[<C-\><C-n>:FloatermNext<cr>]], silentnoremap)
map('n', '<leader>tp', [[:FloatermPrev<cr>]], silentnoremap)
map('t', '<leader>tp', [[<C-\><C-n>:FloatermPrev<cr>]], silentnoremap)
map('n', '<leader>tG', [[:FloatermLast<cr>]], silentnoremap)
map('t', '<leader>tG', [[<C-\><C-n>:FloatermLast<cr>]], silentnoremap)
map('n', '<leader>tgg', [[:FloatermFirst<cr>]], silentnoremap)
map('t', '<leader>tgg', [[<C-\><C-n>:FloatermFirst<cr>]], silentnoremap)
map('n', '<leader>tk', [[:FloatermKill<cr>]], silentnoremap)
map('t', '<leader>tk', [[<C-\><C-n>:FloatermKill<cr>]], silentnoremap)

-- Spider
set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Move
set('n', '<leader>mj', ':MoveLine 1<CR>', silentnoremap)
set('n', '<leader>mk', ':MoveLine -1<CR>', silentnoremap)
set('n', '<leader>mh', ':MoveWord -1<CR>', silentnoremap)
set('n', '<leader>ml', ':MoveWord 1<CR>', silentnoremap)
set('x', '<leader>mj', ':MoveBlock 1<CR>', silentnoremap)
set('x', '<leader>mk', ':MoveBlock -1<CR>', silentnoremap)
set('v', '<leader>mh', ':MoveHBlock -1<CR>', silentnoremap)
set('v', '<leader>ml', ':MoveHBlock 1<CR>', silentnoremap)

-- MurenToggle
map('n', '<leader>mt', [[:MurenToggle<cr>]], silentnoremap)
map('n', '<leader>mf', [[:MurenFresh<cr>]], silentnoremap)
