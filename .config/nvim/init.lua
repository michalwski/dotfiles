
require("michal.plugins")

require("michal.nvim-cmp")

require("michal.tree-sitter")

local LSP = require("michal.lsp")

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

local opt = vim.opt

opt.termguicolors = true
opt.foldmethod = "syntax"
opt.foldlevelstart = 99

require("michal.colors")
