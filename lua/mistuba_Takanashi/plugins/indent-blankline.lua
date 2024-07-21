return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
      require("ibl").setup {
          indent = {
            char = "┊"
          },
          whitespace = {
            remove_blankline_trail = true,
            },
          scope = {
            show_start = false,
            show_end = false
          }
      }
  end,
}
