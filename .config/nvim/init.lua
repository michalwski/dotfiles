require("michal.plugins")

require("michal.nvim-cmp")

require("michal.tree-sitter")

-- map the <Leader> to <Space>
vim.g.mapleader = " "
vim.g.gitblame_highlight_group = "Question"

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
--opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.grepprg = "ag --vimgrep -Q $*"
opt.grepformat = "%f:%l:%c:%m"

require("michal.colors")

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<cr>', {})
vim.api.nvim_set_keymap('n', '<C-s>', '<Esc>:w<cr>', {})

-- FZF / Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require'telescope.builtin'.buffers({sort_mru = true})<cr>", {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--local path_to_elixirls = vim.fn.expand(vim.fn.stdpath("data") .. "/lsp_servers/elixir/elixir-ls/language_server.sh")
local path_to_elixirls = vim.fn.expand("~/projects/elixir-ls/release/language_server.sh")
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

LSP.setup("pylsp", {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
})

--LSP.setup("efm", {
--  filetypes = {
--    "elixir"
--  }
--})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({
            filetypes = {
		    "javascript",
                    "typescript",
                    "css",
                    "scss",
                    "html",
                    "json",
                    "yaml",
                    "markdown",
                    "graphql",
                    "md",
                    "txt"
                    }
	}),
        null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.diagnostics.credo,
    },
})


local filename_section = {'filename', path = 1,}


require('lualine').setup({
    sections = { lualine_c = {filename_section}},
    inactive_sections =  {lualine_c = {filename_section}}
})

