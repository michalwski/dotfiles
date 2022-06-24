local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm({ select = true })
	},
	sources = {
		{ name = 'nvim_lsp' },
		-- For vsnip user.
		{ name = 'vsnip' },
		{ name = 'buffer' },
	},
	experimental = {
		ghost_text = true
	}
})
