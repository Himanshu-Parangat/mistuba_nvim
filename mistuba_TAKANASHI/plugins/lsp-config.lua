return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = {"lua_ls", "bashls", "clangd", "html", "cssls", "jsonls", "tsserver", "marksman", "pyright", "rust_analyzer"},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
    --local capabilities = require('cmp_nvim_lsp').default_capabilities()
    --local lspconfig = require('lspconfig')
    --lspconfig.lua_ls.setup ({ capabilities = capabilities })
    --lspconfig.bashls.setup ({ capabilities = capabilities})
    --lspconfig.clangd.setup ({ capabilities = capabilities})
    --lspconfig.html.setup ({ capabilities = capabilities})
    --lspconfig.cssls.setup ({ capabilities = capabilities})
    --lspconfig.jsonls.setup ({ capabilities = capabilities})
    --lspconfig.tsserver.setup ({ capabilities = capabilities})
    --lspconfig.tsserver.setup ({ capabilities = capabilities})
    --lspconfig.marksman.setup ({ capabilities = capabilities})
    --lspconfig.pyright.setup ({ capabilities = capabilities})
    --lspconfig.rust_analyzer.setup ({ capabilities = capabilities})
    ---- Global mappings.
    ---- See `:help vim.diagnostic.*` for documentation on any of the below functions
    --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    --vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

    end
  }
}
