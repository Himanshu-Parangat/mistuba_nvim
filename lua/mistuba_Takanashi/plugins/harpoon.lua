return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },

				-- set marks specific to each git branch inside git repository
				mark_branch = false,

				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			}

			-- harpoon
			local harpoon_ui = require("harpoon.ui")
			local harpoon_mark = require("harpoon.mark")
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "<leader>ht", function()
				harpoon_ui.toggle_quick_menu()
			end, opts)
			keymap("n", "<leader>ha", function()
				harpoon_mark.add_file()
			end, opts)
			keymap("n", "<leader>hn", function()
				harpoon_ui.nav_next()
			end, opts)
			keymap("n", "<leader>hp", function()
				harpoon_ui.nav_prev()
			end, opts)

			for i = 1, 9 do
				keymap("n", "<leader>" .. i, function()
					harpoon_ui.nav_file(i)
				end, opts)
			end
		end,
	},
}
