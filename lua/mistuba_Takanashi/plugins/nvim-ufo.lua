return{
  {
    'kevinhwang91/nvim-ufo',
      dependencies = {
        'kevinhwang91/promise-async'
      },
      config =function ()

          -- UFO folding
          vim.o.foldcolumn = "1" -- '0' is not bad
          vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
          vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

          -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
          vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
          vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
          require('ufo').setup({
             -- provider_selector = function(bufnr, filetype, buftype)
             --    return {'treesitter', 'indent'}
             -- end
          })
      end
  },
  {
    "luukvbaal/statuscol.nvim", config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          -- configuration goes here, for example:
          relculright = true,
          segments = {
            {
              sign = {
                namespace = { "diagnostic/signs" },
                maxwidth = 1,
                auto = true
              },
              click = "v:lua.ScSa"
            },
            {
              text = { builtin.lnumfunc },
              click = "v:lua.ScLa",
            },
            {
              sign = { name = { ".*" },
                maxwidth = 1,
                colwidth = 1,
                auto = true,
                wrap = true
              },
              click = "v:lua.ScSa"
            },
            {
              text = {" "},
            },
            {
              text = { builtin.foldfunc },
              click = "v:lua.ScFa"
            },
          }
        })
      end,


  }
}


