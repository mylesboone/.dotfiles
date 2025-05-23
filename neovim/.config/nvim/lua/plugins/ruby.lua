return {
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
}
