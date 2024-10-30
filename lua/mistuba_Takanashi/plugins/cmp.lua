return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			-- "onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"octaltree/cmp-look",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets", -- a bunch of snippets to
		},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
}

-- 	"hrsh7th/cmp-emoji",
-- 	"chrisgrieser/cmp-nerdfont",
-- 	"dmitmel/cmp-digraphs", -- digraphs unusual printable non-ASCII characters.

--  snippets
-- 	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
-- 	"nvim-lua/plenary.nvim",
