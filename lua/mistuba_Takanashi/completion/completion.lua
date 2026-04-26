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

local tail_col_cmp_ok, tailwindcss_colorizer_cmp = pcall(require, "tailwindcss-colorizer-cmp")
if not tail_col_cmp_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

--   פּ ﯟ   some other good icons
local kind_icons = require("mistuba_Takanashi.icons.default")

cmp.setup({
	formatting = {
		fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = "[Snippet]",
				nvim_lsp = "[Lsp]",
				buffer = "[Buffer]",
				nvim_lua = "[nvim]",
				nvim_lsp_signature_help_cmp = "[signature]",
				['vim-dadbod-completion'] = '[DB]',
				['render-markdown']='[markdown]',
				['cmp-tw2css']='[tailwind2css]',
				css_variables = '[css var]',
				tailwindcss_colorizer_cmp='[tailwindcss]',
				calc = "[calc]",
				look = "[dict]",
				path = "[path]",
			})[entry.source.name]
			return tailwindcss_colorizer_cmp.formatter(entry, vim_item)
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
			-- luasnip.lsp_expand(args.body) -- For `luasnip`
			require("luasnip").lsp_expand(args.body)
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
})

require("mini.pairs").setup()


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
    { name = 'nvim_lsp_signature_help' },
		{ name = 'render-markdown' },
		{ name = 'vim-dadbod-completion'},
		{ name = "tailwindcss-colorizer-cmp" },
		{ name = 'cmp-tw2css' },
		{ name = 'css-variables' },
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
		["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-down>"] = cmp.mapping.scroll_docs(4),
		["<C-up>"] = cmp.mapping.scroll_docs(-4),
		["<C-]>"] = cmp.mapping.abort(),
		["<C-[>"] = cmp.mapping.abort(),
		["<C-e>"] = cmp.mapping.abort(),
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

		["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

	}),
})
