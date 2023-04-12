--require("material").setup()
--vim.g.material_style = "lighter"

--vim.o.background = "light" -- or "light" for light mode
--vim.cmd([[color one-nvim]])

vim.api.nvim_set_option('background', 'light')
vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd[[colorscheme catppuccin]]

-- auto dark/light

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 3000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
		vim.cmd('colorscheme catppuccin')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
		vim.cmd('colorscheme catppuccin')
	end,
})

auto_dark_mode.init()

-- restore the intro message as the init above make is disappear

local num_args = vim.api.nvim_eval(vim.api.nvim_exec('echo argc()', true))
if num_args == 0 then
    vim.api.nvim_exec('intro', false)
end
