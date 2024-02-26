return {
  {
    'thoughtbot/vim-rspec',
    config = function()
      vim.g.rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
    end,
  },
  {
    'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end
  },
  {
    'tpope/vim-rails',
    lazy = true,
    ft = {'slim', 'ruby'},
  },
  {
    'rhysd/vim-textobj-ruby',
    dependencies = {
      'kana/vim-textobj-user'
    },
  },
  {
    'slim-template/vim-slim',
  },
  {
    'Exafunction/codeium.vim',
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
}
