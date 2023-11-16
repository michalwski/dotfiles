return {
  {
    "preservim/vimux",
    keys = {
      { "<leader>vi", "<cmd>VimuxInspectRunner<cr>", desc = "Inspect runner pane" },
      { "<leader>vp", "<cmd>VimuxPromptCommand<cr>", desc = "Prompt for a command to run" },
      { "<leader>vl", "<cmd>VimuxRunLastCommand<cr>", desc = "Run last command executed by VimuxRunCommand" },
      { "<leader>vz", "<cmd>VimuxZoomRunner<cr>", desc = "Zoom the tmux runner pane" },
      { "<leader>vc", "<cmd>VimuxClearRunnerHistory<cr>", desc = "Clear VimuxRuner History" },
      { "<leader>vq", ":VimuxCloseRunner<cr>", desc = "Quit the VimuxRunner" },
    },
  },

  { "christoomey/vim-tmux-navigator" },
}
