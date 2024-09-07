-----------------------------------------
-- delay highlight on yank
-----------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-my-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
	end,
})


-------------------------------------------
-- resore cursor position
-------------------------------------------

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_command('silent! normal! g`"zv')
  end,
})



-----------------------------------------
-- Toggle List Chars
-----------------------------------------

local toggleListChars = function ()
	local list_enabled = vim.api.nvim_get_option_value("list", {})
	if list_enabled then
		vim.api.nvim_set_option_value("list", false, {})
		print("listchars disabled")
	else
		vim.api.nvim_set_option_value("list", true, {})

		local listchar = require("mistuba_Takanashi.icons.listchars")

		vim.opt.listchars = listchar

		vim.opt.showbreak = "↪\\"

		print("listchars enabled")
	end
end


vim.keymap.set("n", "<leader>tc", toggleListChars, { desc = "Toggle hidden characters", noremap = true, silent = true })
