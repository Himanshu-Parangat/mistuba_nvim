return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup()
    vim.keymap.set("n", "<Leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    vim.keymap.set("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", {})
  end
}
