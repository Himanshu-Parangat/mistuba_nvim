local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- arrow blocker 
keymap("n", "<Left>",  ":lua print('blocked use h')<CR>", opts)
keymap("n", "<Down>",  ":lua print('blocked use j')<CR>", opts)
keymap("n", "<Up>",    ":lua print('blocked use k')<CR>", opts)
keymap("n", "<Right>", ":lua print('blocked use l')<CR>", opts)

-- clear higlight
keymap("n", "<leader>th", ":nohl<CR>", opts)
vim.keymap.set("n", "<leader>/", "gcc", { noremap = true })


-- Better window navigation
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", opts) -- close current split window

keymap("n", "<leader>to", "<cmd>tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", opts) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", opts) --  move current buffer to new tab


-- Move between windows  (ctrl + Arrow)
keymap("n", "<C-Left>", "<C-w>h", opts) -- left
keymap("n", "<C-Down>", "<C-w>j", opts) -- down
keymap("n", "<C-Up>", "<C-w>k", opts) -- up
keymap("n", "<C-Right>", "<C-w>l", opts) -- right


-- Resize windows  (Shift + Arrow)
keymap("n", "<S-Left>", ":vertical resize +2<CR>", opts) -- decrease width
keymap("n", "<S-Down>", ":resize -2<CR>", opts) -- increase height
keymap("n", "<S-Up>", ":resize +2<CR>", opts) -- decrease height
keymap("n", "<S-Right>", ":vertical resize -2<CR>", opts) -- increase width


keymap("n", "<leader>B", ":Lex 30<cr>", opts)
keymap('n', '<leader>b', ':Neotree source=filesystem reveal=true position=current toggle<CR>', opts)

-- Navigate buffers
keymap("n", "<leader>.", ":bnext<CR>", opts)
keymap("n", "<leader>,", ":bprevious<CR>", opts)


-- Visual --
-- keep register paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Terminal --
-- direction = 'vertical' | 'horizontal' | 'tab' | 'float'
keymap("n", "<leader>ch", ":ToggleTerm direction=horizontal<CR>", term_opts)
keymap("n", "<leader>cv", ":ToggleTerm direction=vertical<CR>", term_opts)
keymap("n", "<leader>ct", ":ToggleTerm direction=tab<CR>", term_opts)
keymap("n", "<leader>cf", ":ToggleTerm direction=float<CR>", term_opts)



-- leave insert_mode 
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
-- Toggle virtual text display for the current line
 function Toggle_virtual_text()
     local current_line = vim.fn.line(".")
     local bufnr = vim.api.nvim_get_current_buf()
     vim.api.nvim_buf_clear_namespace(bufnr, 0, current_line - 1, current_line)
 end

vim.api.nvim_set_keymap('n', '<Leader>tl', ':lua Toggle_virtual_text()<CR>', { noremap = true, silent = true })




-- custome funtion call

function CycleCharacter(step)
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col('.')
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
keymap("n", "<leader>+", ":lua CycleCharacter(1)<CR>", opts)
keymap("n", "<leader>-", ":lua CycleCharacter(-1)<CR>", opts)




local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

vim.keymap.set('n', '<leader>td', toggle_diagnostics)



-- Function to toggle virtual text
function Toggle_virtual_text()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = not config.virtual_text,
    })
end
vim.keymap.set('n', '<leader>tv', Toggle_virtual_text)



function Toggle_signs()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        signs = not config.signs,
    })
end
vim.keymap.set('n', '<leader>ts', Toggle_signs)
