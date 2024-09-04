return{
  'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    },
    config =function ()

        -- UFO folding
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        -- Using ufo provider need remap `zR` and `zM`. 
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "open all folds", noremap = true, silent = true})
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "close all folds", noremap = true, silent = true})
    end
}
