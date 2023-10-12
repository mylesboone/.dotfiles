local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

map('i', 'jj', '<ESC>', options)
map('n', '<leader>q', ':wq<CR>', { noremap = true, desc = 'wq' })
map('n', '<leader>w', ':w<CR>', { noremap = true, desc = 'w' })
map('n', '<leader>vs', ':vs<CR>', { noremap = true, desc = 'vs' })
map('n', '<CR>', ':noh<CR><CR>', options) -- cancel search by pressing return
map('n', '<Down>', ':cnext<CR>', silent_options)
map('n', '<Left>', ':vertical resize +2<CR>', silent_options)
map('n', '<Right>', ':vertical resize -2<CR>', silent_options)
map('n', '<Up>', ':cprevious<CR>', silent_options)
map('n', '<leader><CR>', 'gt', { noremap = true, desc = 'next tab' })
map('n', '<leader>gh', '<Plug>GitGoBack', { noremap = true, desc = 'history' })
map('n', '<leader>fm', '<Plug>OpenDbMigrate', { noremap = true, desc = 'migrations' })
map('n', 'N', 'Nzz', options)
map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$', options) -- split line
map('n', 'n', 'nzz', options)
