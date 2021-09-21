
require("michal.plugins")

require("michal.nvim-cmp")

require("michal.tree-sitter")

vim.g.mapleader = "<Space>"

local LSP = require("michal.lsp")

local opt = vim.opt

opt.termguicolors = true
opt.foldmethod = "syntax"
opt.foldlevelstart = 99

require("michal.colors")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':GFiles<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', {noremap = true})
-- Telescope


local path_to_elixirls = vim.fn.expand(vim.fn.stdpath("data") .. "/lspinstall/elixir/elixir-ls/language_server.sh")
LSP.setup("elixirls", {
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
    },
  },
  cmd = { path_to_elixirls },
})

