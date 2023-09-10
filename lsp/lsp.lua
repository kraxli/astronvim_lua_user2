return{
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
      'rafi/neoconf-venom.nvim',
    },
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require("plugins.configs.nvim-lspconfig")(plugin, opts)
      require('venom').setup()
    end,
  },
}
