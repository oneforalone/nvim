return {

  -- auto save
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end
  },

  -- startup time
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
    lazy = true,
  },

  -- buffer manager
  {
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- telescope
  { "nvim-telescope/telescope.nvim" },

  -- float terminal
  { "voldikss/vim-floaterm" },

  -- syntax

  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },

  { 'williamboman/mason-lspconfig.nvim' },

  -- code-folding
  {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
    end
  },

}
