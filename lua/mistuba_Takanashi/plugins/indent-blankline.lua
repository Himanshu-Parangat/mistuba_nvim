return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- main = "ibl",
  -- opts = {
  --   indent = { char = "┊" },
  -- },
  config = function()
      require("ibl").setup {
          indent = { char = "┊" },
          whitespace = {
            remove_blankline_trail = true,
            },
          scope = { enabled = false },
      }
  end,
}
