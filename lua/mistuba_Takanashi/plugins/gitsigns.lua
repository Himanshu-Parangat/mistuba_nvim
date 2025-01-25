return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			-- extr symbol  󱋱 󱖢
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "󰔌" },
				change = { text = "󰔌" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "next change hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "previous change hunk" })

				-- Actions

				-- stage hunk
				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage buffer" })
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "hunk stage" })
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "hunk stage" })

				-- unstage hunk
				-- map("n", "<leader>hU", gitsigns.undo_stage_hunk, { desc = "unstage buffer" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "hunk unstage" })
				map("v", "<leader>hu", function()
					gitsigns.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "hunk unstage" })

				-- -- reset hunk
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset buffer" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset hunk" })
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset hunk" })


				-- Text object
				map({ "o", "x" }, "hv", ":<C-U>Gitsigns select_hunk<CR>", { desc = "hunk visual select" })

				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "hunk preview" })
				map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "hunk preview inline" })


				-- show diff
				map("n", "<leader>hD", gitsigns.diffthis, { desc = "diff against staged" })
				map("n", "<leader>hd", function()
					gitsigns.diffthis("~")
				end, { desc = "diff against last commit" })

				-- local list
				map("n", "<leader>hL", function()
					gitsigns.setloclist("all")
				end, { desc = "populate local list with hunks" })


				map("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "toogle current line blame" })
				map("n", "<leader>hB", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "blame line" })



				-- usefull hl groups
				vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#A6E3A1" })
				vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#F9E2AF" })
				vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F38BA8" })

				-- Staged changes
				vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "#94e2d5" })
				vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = "#cba6f7" })
				vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = "#f5c2e7" })

				-- Additional groups
				vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#89DCEB" })
				vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#F38BA8" })
			end,
		})
	end,
}
