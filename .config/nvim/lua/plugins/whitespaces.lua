return {
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.strip_whitespace_on_save = 1
      -- vim.g.strip_only_modified_line = 1
      vim.g.better_whitespace_filetypes_blacklist =
        { "diff", "git", "gitcommit", "unite", "qf", "help", "markdown", "fugitive", "dashboard" }
    end,
  },
}
