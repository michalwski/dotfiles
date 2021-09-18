local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[packadd packer.nvim]])

local startup = require("packer").startup

return startup(function(use, use_rocks)
  use({ "wbthomason/packer.nvim", opt = true })

  use("neovim/nvim-lspconfig")
  use("kabouzeid/nvim-lspinstall")

end)
