vim.opt_local.iskeyword:append("!")
vim.opt_local.iskeyword:append("?")

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ":Econtroller<CR>", { noremap = true, desc = 'open controller' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>m', ":Emodel<CR>", { noremap = true, desc = 'open model' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>v', ":Eview<CR>", { noremap = true, desc = 'open view' })

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>.', "<Plug>RailsOpenAlt", { noremap = true, desc = 'open alt' })

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', ":call RunNearestSpec()<CR>", { noremap = true, desc = 'nearest spec' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rf', ":call RunCurrentSpecFile()<CR>", { noremap = true, desc = 'current file' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rl', ":call RunLastSpec()<CR>", { noremap = true, desc = 'last spec' })
