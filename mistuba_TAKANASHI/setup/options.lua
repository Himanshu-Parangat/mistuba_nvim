
-- vim options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:⏽,foldclose:]]
vim.o.foldcolumn = '1'

vim.o.termguicolors = true

-- Enable cursorline and cursorcolumn
vim.api.nvim_exec([[
  set cursorcolumn
]], false)


-- Customize the highlight for cursorline and cursorcolumn
vim.api.nvim_exec([[
highlight CursorColumn guibg=#222222 ctermbg=90
]], false)

-- vim.api.nvim_exec([[
--   set colorcolumn=80
-- ]], false)
 

-- Enable relative line numbers in normal mode
vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)

-- Disable line numbers in insert mode
vim.api.nvim_exec([[
  augroup numbertoggle
    autocmd!
    autocmd InsertEnter * set number norelativenumber
    autocmd InsertLeave * set relativenumber 
  augroup END
]], false)



vim.api.nvim_exec([[
  augroup CursorLastPosition
    autocmd!
    autocmd BufReadPost * lua vim.api.nvim_win_set_cursor(0, {vim.fn.line("'\""), vim.fn.col("'\"")})
  augroup END
]], false)
