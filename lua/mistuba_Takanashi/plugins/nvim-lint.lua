return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			lua = { "luacheck" },
		}

		----------------------------------------
		--Autocmd auto start linter ------------
		----------------------------------------

		local function lint_autocmd()
			require("lint").try_lint()
		end

		local lint_augroup = vim.api.nvim_create_augroup("user-nvim-lint", { clear = true })

	  -- auto trigger linting	
		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		-- 	group = lint_augroup,
		-- 	callback = lint_autocmd,
		-- })

		-- manually toggle
		vim.keymap.set("n", "<leader>ll", function()
			require("lint").try_lint()
			print("linter triggerd...")
		end, { desc = "Trigger linting for current file" })

		--------------------
		-- toggle linters --
		--------------------

		_G.linter_state = true

		local function toggle_linter(linter_by_name)
			_G.linter_state = not _G.linter_state

			local lint_namespace = require("lint").get_namespace(linter_by_name)

			vim.diagnostic.config({
				virtual_text = _G.linter_state,
				signs = _G.linter_state,
				underline = _G.linter_state,
			}, lint_namespace)

			local status = _G.linter_state and "enabled" or "disabled"
			print("Linting " .. status)
		end

		local function toggle_linter_keymap(key, linter_name, desc)
			vim.keymap.set("n", key, function()
				toggle_linter(linter_name)
			end, { desc = desc })
		end

		toggle_linter_keymap("<leader>ll", "luacheck", "Toggle luacheck linting diagnostics")
		toggle_linter_keymap("<leader>lp", "pylint", "Toggle pylint linting diagnostics")
		toggle_linter_keymap("<leader>le", "eslint", "Toggle eslint linting  diagnostics")
	end,
}
