return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 40,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    key_labels = {
      ["<cr>"] = "return",
    },
    motions = {
      count = true,
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    window = {
      border = "none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 1, 2, 1, 2 },
      winblend = 0,
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
    show_help = true,
    show_keys = true,
    sort_by_description = false,
    triggers = "auto",
    triggers_nowait = {
      -- marks
      "`",
      "'",
      "g`",
      "g'",
      '"',
      "<c-r>",
      "z=",
    },
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
    disable = {
      buftypes = {},
      filetypes = {},
    },
  },
  config = function ()
    local wk = require("which-key")

    wk.setup({
      ignore_missing = true,
    })


    wk.register({
      ["<leader>"] = {
        ["s"] = {
          name = "splits",
            v = "Split Vertically",
            h = "Split Horizontally",
            e = "Make Split Windows Equal",
            x = "Close Split Window",
        },
        ["t"] = {
          name = "tabs",
            o = "open new tab",
            x = "close current tab",
            n = "go to next tab",
            p = "go to previous tab",
            f = "move current buffer to new tab",

            s = "toggle signs",
            v = "toggle virtual text",
            d = "toggle dignostic",
            l = "supress line dignostic",
            c = "toggle special list charracter"

        },
        ["l"] = {
          name = "linter",
            l = "Toggle luacheck linting diagnostics",
            p = "Toggle pylint linting diagnostics",
            e = "Toggle eslint linting diagnostics",
        },
        ["c"] = {
          name = "console",
            h= "Horizontal console",
            v= "Vertical console",
            t= "tab console",
            f= "float console",
        },
        b = "reveal filesystem",
        B = "reveal filesystem ex",
      },
    })
    wk.register({
      ["+"] = "Increment charracter",
      ["-"] = "Decrement charracter",
    }, { prefix = "<leader>" })


    wk.register({
      ["<C-h>"] =  "Move to Left Window",
      ["<C-j>"] =  "Move to Window Below",
      ["<C-k>"] =  "Move to Window Above",
      ["<C-l>"] =  "Move to Right Window",
     }, {
      mode = "t",
      prefix = "<leader>",
      buffer = nil,
    })



  end
}
