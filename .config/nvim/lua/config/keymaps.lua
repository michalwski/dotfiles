-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { noremap = true, desc = "Window to the left" })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { noremap = true, desc = "Window to the right" })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { noremap = true, desc = "Window to the up" })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { noremap = true, desc = "Window to the down" })
