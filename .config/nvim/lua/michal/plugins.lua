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

  -- Treesitter helpers
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd([[TSUpdate]])
    end,
  })

end)
