return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- tree-sitter for parser
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "bash", "python", "lua", "vim", "vimdoc", "javascript", "html" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      indent = { enable = true },
    })
  end
}
