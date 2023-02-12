local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- gruvbox therem
  use 'ellisonleao/gruvbox.nvim'
  -- file browser: nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
     tag = 'nightly',
     requires = { 'nvim-tree/nvim-web-devicons' }
  }
  -- status line: lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- indent blankline
  use 'lukas-reineke/indent-blankline.nvim'
  -- syntax
  use 'nvim-treesitter/nvim-treesitter'
  -- fuzzy finder
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'
  
  -- For rust ide configurations
  -- from https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use 'williamboman/mason-lspconfig.nvim'

  -- Completion framwork
  use 'hrsh7th/nvim-cmp'

  -- LSP completion sources
  use 'hrsh7th/cmp-nvim-lsp'

  -- Attaching Neovim to rust-analyzer
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Useful completion sources
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  -- debugger for rust
  use 'puremourning/vimspector'

  -- terminal
  use 'voldikss/vim-floaterm'

  -- comment
  use 'numToStr/Comment.nvim'

  -- buffer manager
  use {
    'j-morano/buffer_manager.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- code-folding
  use {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
    end
  }

  -- Zen mode
  use "Pocco81/true-zen.nvim"

  -- auto-save
  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
