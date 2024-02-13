return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- tree-sitter for parser
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "bash", "python", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      auto_install = true,
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = { enable = true },
    })
  end
}
