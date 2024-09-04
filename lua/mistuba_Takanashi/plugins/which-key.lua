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
				-- hide quick cycle
				mode = { "n", "v" },
				{ "<leader>,", hidden = true },
				{ "<leader>.", hidden = true },
			},
			{
				-- grop keymap
				mode = { "n", "v" },
				{ "<leader>s", group = "splits" },
				{ "<leader>t", group = "tabs" },
				{ "<leader>l", group = "linter" },
				{ "<leader>c", group = "console" },
				{ "<leader>h", group = "harpoon" },
			},
			{
				-- added custome overwrite
				mode = {"n","v"},
				{"<leader>+", desc = "Increment charracter"},
				{"<leader>-", desc = "Decrement charracter"},

				{"<leader>b", desc = "reveal filesystem"},
				{"<leader>B", desc = "reveal filesystem ex"},

				{"<leader>/", desc = "commet line"},
				{"<leader>//", desc = "commet block"},
			}
		})
	end,
}

-- wk.register({
--   ["<leader>"] = {
--     ["s"] = {
--       name = "splits",
--         v = "Split Vertically",
--         h = "Split Horizontally",
--         e = "Make Split Windows Equal",
--         x = "Close Split Window",
--     },
--     ["t"] = {
--       name = "tabs",
--         o = "open new tab",
--         x = "close current tab",
--         n = "go to next tab",
--         p = "go to previous tab",
--         f = "move current buffer to new tab",
--
--         s = "toggle signs",
--         v = "toggle virtual text",
--         d = "toggle dignostic",
--         l = "supress line dignostic",
--         c = "toggle special list charracter"
--     },
--     ["l"] = {
--       name = "linter",
--         l = "Toggle luacheck linting diagnostics",
--         p = "Toggle pylint linting diagnostics",
--         e = "Toggle eslint linting diagnostics",
--     },
--     ["c"] = {
--       name = "console",
--         h= "Horizontal console",
--         v= "Vertical console",
--         t= "tab console",
--         f= "float console",
--     },
--     b = "reveal filesystem",
--     B = "reveal filesystem ex",
--   },
-- })
--
--
-- wk.register({
--   ["<C-h>"] =  "Move to Left Window",
--   ["<C-j>"] =  "Move to Window Below",
--   ["<C-k>"] =  "Move to Window Above",
--   ["<C-l>"] =  "Move to Right Window",
--  }, {
--   mode = "t",
--   prefix = "<leader>",
--   buffer = nil,
-- })
