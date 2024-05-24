return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })


    local api = require('Comment.api')


    -- Toggle current line (linewise) normal mode
    vim.keymap.set('n', '<leader>/', api.toggle.linewise.current)

    -- Toggle current line (blockwise) normal mode
    vim.keymap.set('n', '<leader>//', api.toggle.blockwise.current)


    local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
    )

    -- Toggle selection (linewise) visual mode
    vim.keymap.set('x', '<leader>/', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
    end)

    -- Toggle selection (blockwise) visual mode
    vim.keymap.set('x', '<leader>//', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.blockwise(vim.fn.visualmode())
    end)



  end,
}
