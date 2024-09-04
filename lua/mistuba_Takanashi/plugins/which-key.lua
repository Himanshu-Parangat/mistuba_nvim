return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.nvim",
		version = false,
	},
	event = "VeryLazy",
	opts = {
		---@type false | "classic" | "modern" | "helix"
		preset = "classic",
		notify = true,
		-- sort = {"group", "local", "order", "alphanum", "mod" },
		win = {
			no_overlap = false,
		},
		replace = {
			key = {
				function(key)
					return require("which-key.view").format(key)
				end,
				-- { "<Space>", "SPC" },
			},
			desc = {
				{ "<[cC]md>", "" },
				{ "<[cC][rR]>", "" },
				{ "<[sS]ilent>", "" },
				{ "^lua%s+", "" },
				{ "^lua ", "" },
				{ "^call%s+", "" },
				{ "^:%s*", "" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
			{
				-- hide harpoon swiching
				mode = { "n", "v" },
				{ "<leader>1", hidden = true },
				{ "<leader>2", hidden = true },
				{ "<leader>3", hidden = true },
				{ "<leader>4", hidden = true },
				{ "<leader>5", hidden = true },
				{ "<leader>6", hidden = true },
				{ "<leader>7", hidden = true },
				{ "<leader>8", hidden = true },
				{ "<leader>9", hidden = true },
			},
			{
				-- grop keymap
				mode = { "n", "v" },
				{ "<leader>h", group = "harapoon", icon = " " },
				{ "<leader>l", group = "linter", icon = "󰁨 " },
				{ "<leader>c", group = "console", icon = " " },
				{ "<leader>s", group = "splits", icon = " " },
				{ "<leader>t", group = "tabs" },
				{ "<leader>p", group = "telescope" },
			},
			{
				-- added custome overwrite
				mode = { "n", "v" },

				{ "<leader>/", icon = "󱀡 ",  desc = "commet line" },
				{ "<leader>//", icon = "󱀡 ",desc = "commet block" },
				{ "<leader>+", icon = "󰧴 ",desc = "Inclement character" },
				{ "<leader>-", icon = "󰧳 ",desc = "Decrement character" },
			},
		})
	end,
}
