return {
  {
    'chrisbra/Recover.vim',
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {},
    keys = {
      { '-', "<cmd>Oil<CR>", desc = 'open parent dir' },
    },
  }
}
