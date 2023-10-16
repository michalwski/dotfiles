return {
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      local path_to_elixirls = vim.fn.expand("~/projects/elixir-ls/release/language_server.sh")

      elixir.setup({
        nextls = { enable = false },
        credo = {},
        elixirls = {
          enable = true,
          cmd = path_to_elixirls,
          settings = elixirls.settings({
            dialyzerEnabled = true,
            fetchDeps = false,
            enableTestLenses = false,
          }),
          on_attach = function(client, bufnr)
            --vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            --vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            --vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
