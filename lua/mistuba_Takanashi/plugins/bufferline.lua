return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				numbers = "none",
				indicator = {
					icon = "▎",
				},
			},
		})
	end,
}
