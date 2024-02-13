
-- vim options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Enable cursorline and cursorcolumn
-- vim.api.nvim_exec([[
--   set cursorline
--   set cursorcolumn
-- ]], false)

-- Customize the highlight for cursorline and cursorcolumn
-- vim.api.nvim_exec([[
--   highlight CursorLine   guibg=#222222 ctermbg=235
--   highlight CursorColumn guibg=#222222 ctermbg=235
--   highlight colorcolumn  guibg=#111333 ctermbg=235
-- ]], false)

-- vim.api.nvim_exec([[
--   set colorcolumn=80
-- ]], false)
-- 

-- Enable relative line numbers in normal mode
vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)

-- Disable line numbers in insert mode
vim.api.nvim_exec([[
  augroup numbertoggle
    autocmd!
    autocmd InsertEnter * set number norelativenumber
    autocmd InsertLeave * set relativenumber nonumber
  augroup END
]], false)

