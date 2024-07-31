return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		local notify = function(message)
			local bufnr = vim.api.nvim_get_current_buf()
			local formatters = require("conform").list_formatters_to_run(bufnr)
			local filename = vim.fn.expand("%:t")

			message = message or "in normal mode"

			if #formatters > 0 then
				local formatter_names = {}
				for _, formatter in ipairs(formatters) do
					table.insert(formatter_names, formatter.name)
				end
				local formatter_list = table.concat(formatter_names, ", ")
				print(string.format("Current buffer '%s' is formatted using: %s %s", filename, formatter_list, message))
			else
				print(string.format("No formatters available for '%s'", filename))
			end
		end

		vim.keymap.set("n", "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
			notify()
		end, { desc = "Format file or range (in visual mode)" })

		vim.keymap.set("v", "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
			notify("in range mode")
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
