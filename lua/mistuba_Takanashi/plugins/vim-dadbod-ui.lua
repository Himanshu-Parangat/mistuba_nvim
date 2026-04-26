return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
		vim.g.vim_dadbod_completion_mark = '[db]'
		vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/dadbod_ui'


		-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
		-- autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
  end,
  config = function()
    -- Keymap: <leader>db → Add a new DB connection

		vim.api.nvim_create_autocmd("FileType", {
		pattern = { "dbui", "dbout" },
		callback = function()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].filetype == "alpha" then
					vim.api.nvim_win_close(win, true)
				end
			end

		end,

		})



		vim.api.nvim_create_autocmd("FileType", {
		pattern = { "dbui", "dbout", "sql" },
			callback = function()
					vim.opt_local.number = true
					vim.opt_local.relativenumber = true
			end,
		})

		vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if vim.bo.filetype == "dbui"
      or vim.bo.filetype == "dbout"
      or vim.bo.filetype == "sql"
    then
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
    end
  end,
})



  end,
}

