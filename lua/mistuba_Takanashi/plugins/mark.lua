return {
	{
		"walkersumida/fusen.nvim",
		version = "*",
		event = "VimEnter",
		dependencies = {
			"chentoast/marks.nvim",
		},
		config = function()
			---------------------------------------------------------------------
			-- fusen.nvim setup
			---------------------------------------------------------------------
			require("fusen").setup({
				annotation_display = {
					mode = "eol", -- "eol", "float", "both", "none"
					spacing = 6,
					float = {
						delay = 100,
						border = "rounded",
						max_width = 40,
						max_height = 2,
					},
				},

				mark = {
					icon = "",
					hl_group = "FusenMark",
				},

				keymaps = {
				},
			})

			-- Fusen command keymaps
			vim.keymap.set("n", "<leader>ma", "<cmd>FusenAddMark<CR>",        { desc = "Annotate Mark" })
			vim.keymap.set("n", "<leader>mD", "<cmd>FusenClearBuffer<CR>",    { desc = "Clear all marks in buffer" })

			vim.keymap.set("n", "md", function()
				vim.cmd("FusenClearMark")
				require("marks").delete_line()
			end, { desc = "Delete line mark" })


			vim.keymap.set("n", "mD", function()
				vim.cmd("FusenClearBuffer")
				vim.cmd("delmarks!")
				require("marks").delete_buf()
			end, { desc = "Delete buffer line mark" })

			vim.keymap.set("n", "mo", function()
				vim.cmd("Telescope fusen marks")
			end, { desc = "Find marks" })

			-- vim.keymap.set("n", "<leader>mC","<cmd>FusenClearAll<CR>",       { desc = "Clear ALL marks (global wipe)" })
			--
			-- vim.keymap.set("n", "<leader>m]", "<cmd>FusenNext<CR>",           { desc = "Jump to next mark" })
			-- vim.keymap.set("n", "<leader>m[", "<cmd>FusenPrev<CR>",           { desc = "Jump to previous mark" })
			-- vim.keymap.set("n", "<leader>ml", "<cmd>FusenList<CR>",           { desc = "List all marks" })
			-- vim.keymap.set("n", "<leader>mr", "<cmd>FusenRefresh<CR>",        { desc = "Refresh marks" })
			--
			-- vim.keymap.set("n", "<leader>ms", "<cmd>FusenSave<CR>",           { desc = "Save marks manually" })
			-- vim.keymap.set("n", "<leader>mS", "<cmd>FusenLoad<CR>",           { desc = "Load marks manually" })
			--
			-- vim.keymap.set("n", "<leader>mi", "<cmd>FusenInfo<CR>",           { desc = "Show info for current line mark" })
			-- vim.keymap.set("n", "<leader>mb", "<cmd>FusenBranch<CR>",         { desc = "Show git branch info" })
			-- vim.keymap.set("n", "<leader>mO", "<cmd>FusenOpenSaveFile<CR>",   { desc = "Open save file for debugging" })
			--
			-- vim.keymap.set("n", "<leader>me", "<cmd>FusenEnable<CR>",         { desc = "Enable Fusen (show marks)" })
			-- vim.keymap.set("n", "<leader>mE", "<cmd>FusenDisable<CR>",        { desc = "Disable Fusen (hide marks)" })
			-- vim.keymap.set("n", "<leader>mt", "<cmd>FusenToggle<CR>",         { desc = "Toggle Fusen on/off" })


			vim.api.nvim_set_hl(0, "FusenMark", { fg = "#9399b3" })

			---------------------------------------------------------------------
			-- marks.nvim setup
			---------------------------------------------------------------------
			require("marks").setup({
				default_mappings = false,
				mappings = {
					set = "ms",
					preview = "mp",
					-- delete_line = "md",
					delete_buf = "mD",
				},
			})

		end,
	},
}

