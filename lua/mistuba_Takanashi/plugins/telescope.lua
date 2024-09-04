return{
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
      },
      config =function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files,{ desc = "project find"})
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "project grep search"})
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "project buffer search"})
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "project help tag search"})
      end
  }
}

