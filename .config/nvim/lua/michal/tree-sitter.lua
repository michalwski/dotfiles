require("nvim-treesitter.configs").setup({
   ensure_installed = {"heex", "javascript"},
   auto_install = true,
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false
   },
   indent = { enable = false },
})

--vim.cmd([[set foldmethod=expr]])
--vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
