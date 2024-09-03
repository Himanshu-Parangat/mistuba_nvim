return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()

			-- harpoon
			-- local harpoon_ui = require("harpoon.ui")
			-- local harpoon_mark = require("harpoon.mark")
			-- local opts = { noremap = true, silent = true }
			-- local keymap = vim.keymap.set
			--
			-- keymap("n", "<leader>ht", function()
			-- 	harpoon_ui.toggle_quick_menu()
			-- end, opts)
			-- keymap("n", "<leader>ha", function()
			-- 	harpoon_mark.add_file()
			-- end, opts)
			-- keymap("n", "<leader>hn", function()
			-- 	harpoon_ui.nav_next()
			-- end, opts)
			-- keymap("n", "<leader>hp", function()
			-- 	harpoon_ui.nav_prev()
			-- end, opts)
			--
			-- for i = 1, 9 do
			-- 	keymap("n", "<leader>" .. i, function()
			-- 		harpoon_ui.nav_file(i)
			-- 	end, opts)
			-- end
		end,
	},
}
