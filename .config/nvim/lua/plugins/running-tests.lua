return {
  {
    "vim-test/vim-test",
    init = function()
      vim.cmd([[let test#strategy = "vimux"]])
    end,
    keys = {
      { "<leader>mt", "<cmd>TestFile<cr>", desc = "Run test file." },
      { "<leader>ml", "<cmd>TestNearest<cr>", desc = "Test nearest test case." },
      { "<leader>mef", "<cmd>TestSuite --failed<cr>", desc = "Re-test ExUnit failed test cases." },
      { "<leader>mv", "<cmd>TestVisit<cr>", desc = "Visit the last test file." },
    },
    dependencies = {
      "preservim/vimux",
    },
  },
  {
    "tpope/vim-projectionist",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>a", "<cmd>A<cr>", desc = "Switch to alternate file, test or source code." },
    },
    cmd = { "A" },
  },
}
