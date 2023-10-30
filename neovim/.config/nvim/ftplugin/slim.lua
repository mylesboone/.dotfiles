vim.opt_local.foldmethod = 'indent'

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ":Econtroller<CR>", { noremap = true, desc = 'open controller' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>m', ":Emodel<CR>", { noremap = true, desc = 'open model' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>v', ":Eview<CR>", { noremap = true, desc = 'open view' })
