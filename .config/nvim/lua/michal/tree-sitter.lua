--require("nvim-treesitter.configs").setup({
--   highlight = { enable = false },
--   indent = { enable = false },
--})

vim.cmd([[set foldmethod=expr]])
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
