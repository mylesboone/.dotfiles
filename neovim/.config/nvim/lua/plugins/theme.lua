return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup({
      options = {
        styles = {
          comments = 'italic',
          keywords = 'bold',
          types = 'bold',
        }
      }
    })

    vim.cmd('colorscheme duskfox')
  end,
}
