
require("michal.plugins")

require("michal.nvim-cmp")

require("michal.tree-sitter")

-- map the <Leader> to <Space>
vim.g.mapleader = " "

local LSP = require("michal.lsp")

local opt = vim.opt

opt.termguicolors = true
opt.foldmethod = "syntax"
opt.foldlevelstart = 99
opt.number = true
opt.title = true
opt.colorcolumn = "98"
opt.wrap = false

require("michal.colors")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':GFiles<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', {noremap = true})
-- Telescope

-- Vimux Key Mappings
-- Inspect runner pane
vim.api.nvim_set_keymap('', '<Leader>vi', ':VimuxInspectRunner<cr>', {})
-- Prompt for a command to run
vim.api.nvim_set_keymap('', '<Leader>vp', ':VimuxPromptCommand<cr>', {})
-- Run last command executed by VimuxRunCommand
vim.api.nvim_set_keymap('', '<Leader>vl', ':VimuxRunLastCommand<cr>', {})
-- Zoom the tmux runner pane
vim.api.nvim_set_keymap('', '<Leader>vz', ':VimuxZoomRunner<cr>', {})
-- Clear VimuxRuner History
vim.api.nvim_set_keymap('', '<Leader>vc', ':VimuxClearRunnerHistory<cr>', {})
-- Quit the VimuxRunner
vim.api.nvim_set_keymap('', '<Leader>vq', ':VimuxCloseRunner<cr>', {})
-- Run all tests in file
vim.api.nvim_set_keymap('', '<Leader>mt', ':TestFile<cr>', {})
-- Run nearest test (at the current line)
vim.api.nvim_set_keymap('', '<Leader>ml', ':TestNearest<cr>', {})
-- Run all tests
vim.api.nvim_set_keymap('', '<Leader>mT', ':TestSuite<cr>', {})

-- Enable default vimix mappings
vim.cmd([[let test#strategy = "vimux"]])

local path_to_elixirls = vim.fn.expand(vim.fn.stdpath("data") .. "/lspinstall/elixir/elixir-ls/language_server.sh")
LSP.setup("elixirls", {
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
    },
  },
  cmd = { path_to_elixirls },
})

