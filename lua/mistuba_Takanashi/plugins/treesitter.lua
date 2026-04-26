
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- setup (only install dir etc.)
    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- install parsers
    ts.install({
      "lua",
      "javascript",
      "tsx",
      "html",
      "css",
    })

    -- enable highlighting manually
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- optional: indent
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}


-- return{
--   "nvim-treesitter/nvim-treesitter",
-- 	dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
-- 	lazy = false,
--   build = ":TSUpdate",
--   config = function()
--     -- tree-sitter for parser
-- 		require("nvim-treesitter").setup({
--       install_dir = vim.fn.stdpath("data") .. "/site",
--     })
--     configs.setup({
--       ensure_installed = { "c", "bash", "python", "lua", "vim", "vimdoc", "javascript", "html" },
--       auto_install = true,
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = true
--       },
--       indent = { enable = true },
--     })
--   end
-- }
