-----------------------------------------
-- Cmp competion
-----------------------------------------

-- require using protected call
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

--   פּ ﯟ   some other good icons
local kind_icons = require("mistuba_Takanashi.icons.default")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				calc = "[calc]",
				look = "[look]",
			})[entry.source.name]
			return vim_item
		end,
	}, --
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "calc" },
	}, {
		-- completion from All buffers
		{
			name = "buffer",
			option = {
				keyword_length = 3,
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		-- sudo pacman -S words
		{
			name = "look",
			keyword_length = 2,
			option = {
				convert_case = true,
				loud = true,
				dict = {
					"/usr/share/dict/words",
				},
			},
		},
		{
			-- get_cwd
			name = "path",
			option = {
				-- Options go into this table
				trailing_slash = false,
			},
		},
	}),
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- 	matching = { disallow_symbol_nonprefix_matching = false },
-- })
