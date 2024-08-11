return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	opts = { lsp = { auto_attach = true } },
	config = function()
		local navbuddy = require("nvim-navbuddy")
		local actions = require("nvim-navbuddy.actions")
		local custome_icons = require("mistuba_Takanashi.icons.default")

		navbuddy.setup({
			window = {
				border = "rounded",
				size = "80%",
				position = "50%",
				scrolloff = nil,
				sections = {
					left = {
						size = "20%",
						border = nil,
					},
					mid = {
						size = "40%",
						border = nil,
					},
					right = {
						border = nil,
						preview = "leaf",
					},
				},
			},
			node_markers = {
				enabled = true,
				icons = {
					leaf = "  ",
					leaf_selected = " → ",
					branch = " ",
				},
			},
			icons = custome_icons,
			use_default_mappings = true,
			mappings = {
				["<esc>"] = actions.close(),
				["q"] = actions.close(),

				["j"] = actions.next_sibling(),
				["k"] = actions.previous_sibling(),

				["h"] = actions.parent(),
				["l"] = actions.children(),
				["0"] = actions.root(),

				["v"] = actions.visual_name(),
				["V"] = actions.visual_scope(),

				["y"] = actions.yank_name(),
				["Y"] = actions.yank_scope(),

				["i"] = actions.insert_name(),
				["I"] = actions.insert_scope(),

				["a"] = actions.append_name(),
				["A"] = actions.append_scope(),

				["r"] = actions.rename(),

				["d"] = actions.delete(),

				["f"] = actions.fold_create(),
				["F"] = actions.fold_delete(),

				["c"] = actions.comment(),

				["<enter>"] = actions.select(),
				["o"] = actions.select(),

				["J"] = actions.move_down(),
				["K"] = actions.move_up(),

				["s"] = actions.toggle_preview(),

				["<C-v>"] = actions.vsplit(),
				["<C-s>"] = actions.hsplit(),

				["t"] = actions.telescope({
					layout_config = {
						height = 0.60,
						width = 0.60,
						prompt_position = "top",
						preview_width = 0.50,
					},
					layout_strategy = "horizontal",
				}),

				["g?"] = actions.help(),
			},
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			source_buffer = {
				follow_node = true,
				highlight = true,
				reorient = "smart",
				scrolloff = nil,
			},
			custom_hl_group = nil,
		})

		local navic = require("nvim-navic")

		navic.setup({
			icons = custome_icons,
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			highlight = true,
			separator = "  ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = false,
			click = false,
			format_text = function(text)
				return text
			end,
		})

		vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"

		-- vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "", fg = "#ffffff"})
		-- vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "", fg = "#ffffff"})
	end,
}
