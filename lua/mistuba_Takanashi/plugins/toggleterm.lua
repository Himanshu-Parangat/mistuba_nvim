return{
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require("toggleterm").setup{
        -- size based on orrentation 
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,

        -- terminal options 
        shade_terminals = true,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        persist_size = true,
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        direction = 'vertical', -- 'vertical' | 'horizontal' | 'tab' | 'float'

        -- flotingoptions 
        float_opts = {
          border = 'curved',  -- 'single' | 'double' | 'shadow' | 'curved'  
          title_pos = 'left' -- 'left' | 'center' | 'right', position of the title of the floating window
        },

        -- winbar top tittel 
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end
        },

      }
    end,
  }
}


