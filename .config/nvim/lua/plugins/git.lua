return {
  {
    "tpope/vim-fugitive",
    version = "*",
    lazy = true,
    cmd = { "G", "Gdiffsplit" },
  },
  { "f-person/git-blame.nvim", version = "*", event = { "BufEnter" } },
}
