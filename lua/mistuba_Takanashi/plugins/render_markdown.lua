return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			code = {
				enabled = true,
				sign = "language",
				-- style = "normal",
				width = "block",
				left_pad = 2,
				right_pad = 4,
				border = "thin",
				above = "",
				below = "",
				-- above = "▄",
				-- below = "▀",
			},
			heading = {
				width = "block",
				left_pad = 2,
				right_pad = 4,
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
			sign = {
				enabled = false,
			},
			pipe_table = {
				preset = "round",
				padding = 1,
				alignment_indicator = "┅",
			},
			file_types = {
				"markdown",
				"gitcommit",
			},
			vim.treesitter.language.register("markdown", "gitcommit"),
		})
		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#120012", blend = 45 })

		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#271a34", fg = "none", blend = 45 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#270b1d", fg = "none", blend = 45 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#320e25", fg = "none", blend = 45 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#3d102d", fg = "none", blend = 45 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#471236", fg = "none", blend = 45 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#52143f", fg = "none", blend = 45 })
	end,
}
