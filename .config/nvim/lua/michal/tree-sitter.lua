require("nvim-treesitter.configs").setup({
   ensure_installed = {"heex", "javascript", "elixir"},
   auto_install = true,
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false
   },
   endwise = { enable = true },
   indent = { enable = false },
})

--vim.cmd([[set foldmethod=expr]])
--vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
