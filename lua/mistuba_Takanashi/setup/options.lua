-- :help options
vim.opt.backup = false                          -- creates a backup file
-- vim.opt.clipboard = 'unnamedplus'            -- sync systemclipboard with nvim register
vim.opt.cmdheight = 2                           -- more space in the bottom of neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- always show tabs.  can be 0, 1 or 2
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- indenting based on syntax of the code being edited.
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile

-- vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)

vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = false                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation for autoindent or ">>" "<<"
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab (it only shown visually)
vim.opt.softtabstop = 2                         -- Number of spaces per tab while editing
vim.opt.cursorline = true                       -- highlight the current line where cursor is 
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                  -- set relative numbered lines
vim.opt.numberwidth = 2                         -- set number column width to 2 {default 4} space between left boder and number
-- vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "auto"                      -- sign column, "yes" "no" "auto"
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- Maintains 8 lines of buffer above and below cursor during scroll
vim.opt.sidescrolloff = 8                       -- Maintains 8 lines of buffer each sides during scroll
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications


vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"            -- auto go to (up or down) when reach at (begining or end) of line.
vim.cmd [[set iskeyword+=-,_]]                  -- treate hyphens and underscores as keyword
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- save session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
