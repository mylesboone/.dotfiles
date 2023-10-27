return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('fzf-lua').setup({
      'default',
      winopts    = {
        width   = 1,
        height  = 1,
        preview = {
          hidden       = "nohidden",
          vertical     = "up:70%",
          horizontal   = "up:70%",
        },
      },
      grep = {
        rg_opts = "--sort-files --hidden --column --line-number --no-heading " ..
        "--color=always --smart-case -g '!{.git,node_modules}/*'",
      }
    })
  end,
  keys = {
    { '<leader>gg', "<cmd>lua require('fzf-lua').git_status()<CR>", desc = 'git changes' },
    { '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", desc = 'find buffer' },
    { '<leader>k', "<cmd>lua require('fzf-lua').files()<CR>", desc = 'find file' },
    { '<leader>ff', "<cmd>lua require('fzf-lua').grep({ no_esc=true })<CR>", desc = 'grep' },
    { '<leader>ff', "<cmd>lua require('fzf-lua').grep_visual()<CR>", mode = 'v', desc = 'grep visual selection' },
    { '<leader>fs', "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = 'grep current word' },
  },
}
