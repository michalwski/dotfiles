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
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
                ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
		['<CR>'] = cmp.mapping({
                    i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                    c = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end
                })

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
