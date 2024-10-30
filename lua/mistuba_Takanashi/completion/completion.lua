-----------------------------------------
-- Cmp competion
-----------------------------------------

-- require using protected call
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()


--   פּ ﯟ   some other good icons
local kind_icons = require("mistuba_Takanashi.icons.default")

cmp.setup({
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = "[Snippet]",
				nvim_lsp = "[Lsp]",
				buffer = "[Buffer]",
				nvim_lua = "[nvim]",
				calc = "[calc]",
				look = "[look]",
				path = "[path]",
			})[entry.source.name]
			return vim_item
		end,
	}, --
})

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip`
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
})

cmp.setup({
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})


cmp.setup({
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "calc" },
		{
			name = "buffer",
			option = {
				keyword_length = 3,
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{
			-- get_cwd
			name = "path",
			option = {
				trailing_slash = false,
			},
		},
	}, {
		-- sudo pacman -S words
		{
			name = "look",
			keyword_length = 4,
			max_item_count = 6,
			option = {
				convert_case = true,
				loud = true,
				dict = {
					"/usr/share/dict/words",
				},
			},
		},
	}),
})


cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})
