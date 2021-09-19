
require("michal.plugins")

local LSP = require("michal.lsp")

local path_to_elixirls = vim.fn.expand(vim.fn.stdpath("data") .. "/lspinstall/elixir/elixir-ls/language_server.sh")
LSP.setup("elixirls", {
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
      enableTestLenses = true,
    },
  },
  cmd = { path_to_elixirls },
})
