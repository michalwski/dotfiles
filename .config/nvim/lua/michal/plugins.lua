local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[packadd packer.nvim]])

local startup = require("packer").startup

return startup(function(use, use_rocks)
  -- package manager
  use({ "wbthomason/packer.nvim", opt = true })

  -- LSP helpers
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Treesitter helpers (requires tree-sitter cli command)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd([[TSUpdate]])
    end,
  })
  use 'RRethy/nvim-treesitter-endwise'

  -- Auto completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- color sheme
  use 'Th3Whit3Wolf/one-nvim'
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })
  use 'marko-cerovac/material.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- auto insert code end block
  use 'tpope/vim-endwise'
  -- git integration
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'f-person/git-blame.nvim'
  -- unneeded white spaces detection
  use 'ntpeters/vim-better-whitespace'

  -- faster grep (requires ack cli commnad)
  use 'mileszs/ack.vim'

  -- tmux integration plugins
  use 'christoomey/vim-tmux-navigator'
  use 'preservim/vimux'

  -- running tests
  use 'vim-test/vim-test'

  -- FZF
  use({
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  })
  use("junegunn/fzf.vim")

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- elixir
  use("elixir-editors/vim-elixir")

  -- switching between code and test files
  use 'tpope/vim-projectionist'

  -- cool icons
  use 'kyazdani42/nvim-web-devicons'
  use 'adelarsq/vim-devicons-emoji'

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  use {
    'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- quickscope
  use("unblevable/quick-scope")

  -- surround
  use("tpope/vim-surround")

  -- extended . repeat
  use("tpope/vim-repeat")

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
 }

 use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
 }

end)
