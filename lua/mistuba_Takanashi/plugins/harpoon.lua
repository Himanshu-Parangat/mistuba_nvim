return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			local keymap = vim.keymap.set
			keymap("n", "<leader>ha", function()
				harpoon:list():add()
			end)
			keymap("n", "<leader>ht", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			keymap("n", "<leader>hp", function()
				harpoon:list():prev()
			end)
			keymap("n", "<leader>hn", function()
				harpoon:list():next()
			end)

			-- harpoon navigation leader followed by 1 to 9
			for i = 1, 9 do
				keymap("n", "<leader>" .. i, function()
					-- harpoon_ui.nav_file(i)
					harpoon:list():select(i)
				end)
			end

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			keymap("n", "<leader>hs", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
}
