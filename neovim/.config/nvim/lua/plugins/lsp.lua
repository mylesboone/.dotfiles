return {
  {
    'williamboman/mason.nvim',
    dependencies = { 'VonHeikemen/lsp-zero.nvim' },
    config = function()
      require('mason').setup()
    end,
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  }
}
