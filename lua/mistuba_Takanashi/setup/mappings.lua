--Remap space as leader key
vim.api.nvim_set_keymap("", "<space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten function name
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local function keymap(mode, keypress, executed_command, desc, options)
	-- Merge the provided options with the desc option
	local options = vim.tbl_extend("force", options or {}, { desc = desc })
	vim.api.nvim_set_keymap(mode, keypress, executed_command, options)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- arrow blocker
keymap("n", "<Left>", ":lua print('blocked use h')<CR>", "blocked h", opts)
keymap("n", "<Down>", ":lua print('blocked use j')<CR>", "blocked j", opts)
keymap("n", "<Up>", ":lua print('blocked use k')<CR>", "blocked k", opts)
keymap("n", "<Right>", ":lua print('blocked use l')<CR>", "blocked l", opts)

-- clear higlight
keymap("n", "<leader>nh", ":nohl<CR>", "Clear search highlights", opts)

-- Better window navigation
keymap("n", "<leader>sv", "<C-w>v", "Split window vertically", opts)
keymap("n", "<leader>sh", "<C-w>s", "Split window horizontally", opts)
keymap("n", "<leader>se", "<C-w>=", "Make split windows equal width & height", opts)
keymap("n", "<leader>sx", "<cmd>close<CR>", "Close current split window", opts)

keymap("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab", opts)
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab", opts)
keymap("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab", opts)
keymap("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab", opts)
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", "Move current buffer to new tab", opts)

-- Move between windows  (ctrl + Arrow)
keymap("n", "<C-Left>", "<C-w>h", "focus left", opts) -- left
keymap("n", "<C-Down>", "<C-w>j", "focus down", opts) -- down
keymap("n", "<C-Up>", "<C-w>k", "focus up", opts) -- up
keymap("n", "<C-Right>", "<C-w>l", "focus right", opts) -- right

-- Resize windows  (Shift + Arrow)
keymap("n", "<S-Left>", ":vertical resize +2<CR>", "decrease width", opts) -- decrease width
keymap("n", "<S-Down>", ":resize -2<CR>", "increase height", opts) -- increase height
keymap("n", "<S-Up>", ":resize +2<CR>", "decrease height", opts) -- decrease height
keymap("n", "<S-Right>", ":vertical resize -2<CR>", "increase width", opts) -- increase width

keymap("n", "<leader>B", ":Lex 30<cr>", "split ex mode", opts)
keymap(
	"n",
	"<leader>b",
	":Neotree source=filesystem reveal=true position=current toggle<CR>",
	"reveal filesystem page",
	opts
)

-- Navigate buffers
keymap("n", "<leader>.", ":bnext<CR>", "move buffer next", opts)
keymap("n", "<leader>,", ":bprevious<CR>", "move buffer previous", opts)

-- Visual --
-- keep register paste
keymap("v", "p", '"_dP', "keep register paste ", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", "stay indent", opts)
keymap("v", ">", ">gv", "stay indent", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", "move line up", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", "move line down", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", "move block down", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", "move block up", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", "move block down", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", "move block up", opts)

-- Terminal --
-- direction = 'vertical' | 'horizontal' | 'tab' | 'float'
keymap("n", "<leader>ch", ":ToggleTerm direction=horizontal<CR>", "toggle horizontal console", term_opts)
keymap("n", "<leader>cv", ":ToggleTerm direction=vertical<CR>", "toggle vertical console", term_opts)
keymap("n", "<leader>ct", ":ToggleTerm direction=tab<CR>", "toggle tab console", term_opts)
keymap("n", "<leader>cf", ":ToggleTerm direction=float<CR>", "toggle float console", term_opts)

-- leave insert_mode
keymap("t", "<esc>", [[<C-\><C-n>]], "normal mode", opts)

-- custome funtion call

function CycleCharacter(step)
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

-- Map the function to the keybindings
keymap("n", "<leader>+", ":lua CycleCharacter(1)<CR>", "Increment character", opts)
keymap("n", "<leader>-", ":lua CycleCharacter(-1)<CR>", "Decrement character", opts)

-- Toggle virtual text display for the current line
function Supress_virtual_line_text()
	local current_line = vim.fn.line(".")
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(bufnr, 0, current_line - 1, current_line)
end

keymap("n", "<Leader>tl", ":lua Supress_virtual_line_text()<CR>", "toggle(supress) line vtext", opts)

-- Function to toggle diagnostics
local diagnostics_active = true
function Toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end

keymap("n", "<leader>td", ":lua Toggle_diagnostics()<CR>", "toggle diagnostics", opts)

-- Function to toggle virtual text
_G.vt_state = true

function Toggle_virtual_text()
	_G.vt_state = not _G.vt_state

	vim.diagnostic.config({
		virtual_text = _G.vt_state,
	})

	local status = _G.vt_state and "enabled" or "disabled"
	print("virtual text " .. status)
end

-- Function to toggle diagnostic signs
_G.sign_state = true

function Toggle_signs()
	_G.sign_state = not _G.sign_state

	vim.diagnostic.config({
		signs = _G.sign_state,
	})

	local status = _G.sign_state and "enabled" or "disabled"
	print("diagnostic signs " .. status)
end

-- Function to toggle diagnostic underline
_G.underline_state = true

function Toggle_underline()
	_G.underline_state = not _G.underline_state

	vim.diagnostic.config({
		underline = _G.underline_state,
	})

	local status = _G.underline_state and "enabled" or "disabled"
	print("diagnostic underline " .. status)
end

keymap("n", "<leader>tv", ":lua Toggle_virtual_text()<CR>", "toggle virtual text", opts)
keymap("n", "<leader>ts", ":lua Toggle_signs()<CR>", "toggle diagnostic signs", opts)
keymap("n", "<leader>tu", ":lua Toggle_underline()<CR>", "toggle diagnostic underline", opts)
