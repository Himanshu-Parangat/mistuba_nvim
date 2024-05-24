return {
  {
    "lunarvim/colorschemes",
    priority = 999,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
         flavour = "mocha",
         transparent_background = true,
         dim_inactive = {
             enabled = false, -- dims the background color of inactive window
             shade = "dark",
             percentage = 0.15, -- percentage of the shade to apply to the inactive window
         },
         integrations = {
             telescope = true,
             -- harpoon = true,
             mason = true,
         },
         color_overrides = {
            all = {
                text = "#f9a8d4",
            },
            mocha = {
              yellow = "#DFFFD0",
              green = "#CAFFAF",
              -- lavender= "#f9a8d4",
            },
         }
      })
      vim.cmd([[colorscheme catppuccin]])
    end
  },
}
