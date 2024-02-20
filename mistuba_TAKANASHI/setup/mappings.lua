-- map leader
vim.g.mapleader = " "

-- map default 
vim.keymap.set('n', '<leader>ex',vim.cmd.Ex)

-- Map Escape key to clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })


-- harpoon
vim.api.nvim_set_keymap('n', '<leader>ht', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', ':lua require("harpoon.ui").nav_file(6)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', ':lua require("harpoon.ui").nav_file(7)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', ':lua require("harpoon.ui").nav_file(8)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', ':lua require("harpoon.ui").nav_file(9)<CR>', { noremap = true, silent = true })
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


-- toggle undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')

vim.keymap.set('n', '<leader>e', ':Neotree source=filesystem reveal=true position=current toggle<CR>')



-- telescop 
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})


-- switch buffer
-- vim.keymap.set('n', '<leader>p', ':bprev<CR>', {})
-- vim.keymap.set('n', '<leader>n', ':bnext<CR>', {})

-- Switch between panes using Ctrl and arrow keys
-- vim.keymap.set('n', '<C-Left>', '<C-w>h', {})
-- vim.keymap.set('n', '<C-Down>', '<C-w>j', {})
-- vim.keymap.set('n', '<C-Up>', '<C-w>k', {})
-- vim.keymap.set('n', '<C-Right>', '<C-w>l', {})



-- {"add ctrl x ctrl o"}
