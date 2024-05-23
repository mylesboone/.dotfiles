return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
        lsp_zero.buffer_autoformat()
        if (client.name == "eslint") then
          vim.cmd('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue EslintFixAll')
        end
      end)

      vim.diagnostic.config({ virtual_text = false, })
    end,
    keys = {
      { '<leader>la', '<cmd> lua vim.lsp.buf.code_action()<CR>', desc = 'action' },
      { '<leader>ll', '<cmd> lua vim.diagnostic.open_float()<CR>', desc = 'diagnostics' },
      { '<leader>lh', '<cmd> lua vim.lsp.buf.hover()<CR>', desc = 'hover' },
      { '<leader>ld', '<cmd> lua vim.lsp.buf.definition()<CR>', desc = 'definition' },
      { '<leader>lr', '<cmd> lua vim.lsp.buf.references()<CR>', desc = 'references' },
      { '<leader>ln', '<cmd> lua vim.lsp.buf.rename()<CR>', desc = 'rename' },
      { '<leader>ls', '<cmd> lua vim.lsp.buf.signature_help()<CR>', desc = 'sig' },

    },
  },

  {
    'williamboman/mason.nvim',
    dependencies = { 'VonHeikemen/lsp-zero.nvim' },
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'bashls',
          'docker_compose_language_service',
          'dockerls',
          'eslint',
          'golangci_lint_ls',
          'gopls',
          'jsonls',
          'solargraph',
          'tsserver',
          'yamlls'
        }
      })
      require("mason-lspconfig").setup_handlers {
        function (server_name)
          require("lspconfig")[server_name].setup {}
        end,
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load({paths = "./snippets"})
        end,
      },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require 'luasnip'
      local cmp_action = require('lsp-zero').cmp_action()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            fallback()
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        })
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
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
