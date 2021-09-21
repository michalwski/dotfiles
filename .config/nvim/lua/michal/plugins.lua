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
  use("kabouzeid/nvim-lspinstall")

  -- Treesitter helpers (requires tree-sitter cli command)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd([[TSUpdate]])
    end,
  })

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- color sheme
  use("marko-cerovac/material.nvim")
  use 'sainnhe/edge'
  use 'folke/tokyonight.nvim'
  use 'Th3Whit3Wolf/one-nvim'

  -- auto insert code end block
  use 'tpope/vim-endwise'
  -- git integration
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  -- unneeded white spaces detection
  use 'ntpeters/vim-better-whitespace'

  -- faster grep (requires ack cli commnad)
  use 'mileszs/ack.vim'

  -- tmux integration plugins
  use 'christoomey/vim-tmux-navigator'
  use 'preservim/vimux'
  use 'spiegela/vimix'

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






end)
