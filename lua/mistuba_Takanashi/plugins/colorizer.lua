return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
        '*';
        html = {
          mode = 'background',
          names = true;
        },
        css = { rgb_fn = true; }, -- Enable parsing rgb(...) functions in css.
      }
    end
  },
}

