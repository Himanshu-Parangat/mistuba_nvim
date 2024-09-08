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

local utils = require("mistuba_Takanashi.setup.utils")

vim.keymap.set("n", "<leader>+", function() utils.cycleCharacter(1) end, { desc = "Toggle hidden characters", noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", function() utils.cycleCharacter(-1) end, { desc = "Toggle hidden characters", noremap = true, silent = true })

vim.keymap.set("n", "<leader>tc", utils.toggleListChars, { desc = "Toggle hidden characters", noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tl", utils.supress_virtual_line_text, { desc = "Toggle hidden characters", noremap = true, silent = true })
vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle diagnostic", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", utils.toggle_virtual_text, { desc = "Toggle virtual text", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ts", utils.toggle_signs, { desc = "Toggle diagnostic signs", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tu", utils.toggle_underline, { desc = "Toggle diagnostic underline", noremap = true, silent = true })
