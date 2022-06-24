
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
opt.hlsearch = true
opt.incsearch = true

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
-- NvimTree toogle
vim.api.nvim_set_keymap('', '<Leader>t', ':NvimTreeToggle<cr>', {})
vim.api.nvim_set_keymap('', '<Leader>r', ':NvimTreeRefresh<cr>', {})
vim.api.nvim_set_keymap('', '<Leader>f', ':NvimTreeFindFile<cr>', {})

-- Enable default vimix mappings
vim.cmd([[let test#strategy = "vimux"]])

-- automatically remove trailing whitespace
vim.cmd([[autocmd BufWritePre * StripWhitespace]])

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local path_to_elixirls = vim.fn.expand(vim.fn.stdpath("data") .. "/lsp_servers/elixir/elixir-ls/language_server.sh")
-- local path_to_elixirls = vim.fn.expand("~/projects/elixir-ls/rel/language_server.sh")
LSP.setup("elixirls", {
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
    },
  },
  cmd = { path_to_elixirls },
})

