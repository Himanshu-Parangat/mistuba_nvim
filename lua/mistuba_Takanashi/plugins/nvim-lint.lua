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
			markdown = { "markdownlint" },
			lua = { "luacheck" },
		}

		----------------------------------------
		--Autocmd auto start linter ------------
		----------------------------------------

		local function lint_autocmd()
			require("lint").try_lint()
		end

		local lint_augroup = vim.api.nvim_create_augroup("user-nvim-lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = lint_autocmd,
		})

		-- manually toggle
		vim.keymap.set("n", "<leader>ll", function()
			require("lint").try_lint()
			print("linter triggerd...")
		end, { desc = "Trigger linting for current file" })

		--------------------
		-- pylint ----------
		--------------------

		local pylint_ns = require("lint").get_namespace("pylint")

		vim.keymap.set("n", "<leader>lp", function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = false,
			}, pylint_ns)
		end, { desc = "Trigger linting for current file" })

	end,
}
