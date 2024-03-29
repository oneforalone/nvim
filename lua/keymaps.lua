-- general keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- nvim-tree
vim.keymap.set('n', '<c-f>', ':NvimTreeFindFileToggle<CR>')

-- lualine
vim.keymap.set('n', '<Space>b', ':LualineBuffersJump! ')

-- buffer manager
vim.keymap.set({ 't', 'n' }, '<Space>bm', require("buffer_manager.ui").toggle_quick_menu, {noremap = true})
-- Using J, K to swith between buffers
vim.api.nvim_command([[
autocmd FileType buffer_manager vnoremap J :m '>+1<CR>gv=gv
autocmd FileType buffer_manager vnoremap K :m '<-2<CR>gv=gv
]])
-- using <leader><num> to swich between buffers
local keys = '1234567890'
for i = 1, #keys do
  local key = keys:sub(i, i)
  vim.keymap.set( 'n', string.format('<leader>%s', key), function () require("buffer_manager.ui").nav_file(i) end, opts
  )
end

-- window manager
-- for more bindings, refer to:
-- https://neovim.io/doc/user/windows.html#window-move-cursor
vim.keymap.set('n', "<leader>wh", ":wincmd h<CR>")
vim.keymap.set('n', "<leader>wj", ":wincmd j<CR>")
vim.keymap.set('n', "<leader>wk", ":wincmd k<CR>")
vim.keymap.set('n', "<leader>wl", ":wincmd l<CR>")
vim.keymap.set('n', "<leader>ws", ":split<CR>")
vim.keymap.set('n', "<leader>wv", ":vsplit<CR>")
vim.keymap.set('n', "<leader>wo", ":wincmd o<CR>")

-- fold-cycle
vim.keymap.set('n', '<tab>',
  function() return require('fold-cycle').open() end,
  {silent = true, desc = 'Fold-cycle: open folds'})
vim.keymap.set('n', '<s-tab>',
  function() return require('fold-cycle').close() end,
  {silent = true, desc = 'Fold-cycle: close folds'})
vim.keymap.set('n', 'zC',
  function() return require('fold-cycle').close_all() end,
  {remap = true, silent = true, desc = 'Fold-cycle: close all folds'})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- FloaTerm
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=iTerm --height=0.8 --width=0.7 --autoclose=2 zsh <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle iTerm<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- -- Vimspector
-- vim.cmd([[
-- nmap <F9> <cmd>call vimspector#Launch()<cr>
-- nmap <F5> <cmd>call vimspector#StepOver()<cr>
-- nmap <F8> <cmd>call vimspector#Reset()<cr>
-- nmap <F11> <cmd>call vimspector#StepOver()<cr>")
-- nmap <F12> <cmd>call vimspector#StepOut()<cr>")
-- nmap <F10> <cmd>call vimspector#StepInto()<cr>")
-- ]])
-- vim.keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")

vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})
