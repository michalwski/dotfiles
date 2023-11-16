return {
  "vim-test/vim-test",
  init = function()
    vim.cmd([[let test#strategy = "vimux"]])
  end,
  keys = {
    { "<leader>mt", "<cmd>TestFile<cr>", desc = "Run test file." },
    { "<leader>ml", "<cmd>TestNearest<cr>", desc = "Test nearest test case." },
    { "<leader>mv", "<cmd>TestVisit<cr>", desc = "Visit the last test file." },
  },
  dependencies = {
    "preservim/vimux",
  },
}
