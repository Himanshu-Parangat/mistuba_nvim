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
-- restore cursor position
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

local utils = {}

function utils.toggleListChars()
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


-------------------
-- toggle lua line 
-------------------

local lualine_active = false
function utils.toggle_lua_line()
    lualine_active = not lualine_active
    if lualine_active then
				vim.opt.laststatus = 0
				vim.opt.cmdheight = 0
				require('lualine').hide()
    else
				vim.opt.laststatus = 2
				vim.opt.cmdheight = 2
		    require('lualine').hide({unhide=true})
    end
end


------------
-- line wrap
------------

local wrap_active = false
function utils.toggle_wrap()
    wrap_active = not wrap_active
    if wrap_active then
        vim.wo.wrap = true
    else
        vim.wo.wrap = false
    end
end


---------------------------------------------------
-- Toggle virtual text display for the current line
---------------------------------------------------

function utils.supress_virtual_line_text()
	local current_line = vim.fn.line(".")
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(bufnr, 0, current_line - 1, current_line)
end


---------------------------------
-- Function to toggle diagnostics
---------------------------------

local diagnostics_active = true
function utils.toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end


----------------------------------
-- Function to toggle virtual text
----------------------------------

_G.vt_state = true

function utils.toggle_virtual_text()
	_G.vt_state = not _G.vt_state

	vim.diagnostic.config({
		virtual_text = _G.vt_state,
	})

	local status = _G.vt_state and "enabled" or "disabled"
	print("virtual text " .. status)
end

--------------------------------------
-- Function to toggle diagnostic signs
--------------------------------------

_G.sign_state = true

function utils.toggle_signs()
	_G.sign_state = not _G.sign_state

	vim.diagnostic.config({
		signs = _G.sign_state,
	})

	local status = _G.sign_state and "enabled" or "disabled"
	print("diagnostic signs " .. status)
end


------------------------------------------
-- Function to toggle diagnostic underline
------------------------------------------

_G.underline_state = true

function utils.toggle_underline()
	_G.underline_state = not _G.underline_state

	vim.diagnostic.config({
		underline = _G.underline_state,
	})

	local status = _G.underline_state and "enabled" or "disabled"
	print("diagnostic underline " .. status)
end


-----------------------
-- custome funtion call
-----------------------


function utils.cycleCharacter(step)
	local line = vim.api.nvim_get_current_line()
	local col = vim.fn.col(".")
	local char = string.byte(line:sub(col, col))
	local new_char

	-- Check if the character is a digit
	if char >= 48 and char <= 57 then -- ASCII values for digits 0-9
		-- Increment/decrement the digit
		new_char = tostring((tonumber(string.char(char)) + step) % 10)
	elseif char >= 65 and char <= 90 then -- ASCII values for uppercase letters
		-- Cycle to next/previous uppercase letter
		new_char = string.char((char - 65 + step) % 26 + 65)
	elseif char >= 97 and char <= 122 then -- ASCII values for lowercase letters
		-- Cycle to next/previous lowercase letter
		new_char = string.char((char - 97 + step) % 26 + 97)
	else
		-- Character is neither a digit nor an alphabet, do nothing
		return
	end

	vim.api.nvim_set_current_line(line:sub(1, col - 1) .. new_char .. line:sub(col + 1))
end

---------------------
-- check git files --
---------------------

function utils.git_status()
	require("telescope.builtin").git_status({
		prompt_title = "git files",
	})
end

return utils
