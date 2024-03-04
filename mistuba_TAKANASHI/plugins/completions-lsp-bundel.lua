return{
  -- seting up MASON
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
  -- Lua snip setup
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.completion.spell,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
 	end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup ({ capabilities = capabilities })
    lspconfig.bashls.setup ({ capabilities = capabilities})
    lspconfig.clangd.setup ({ capabilities = capabilities})
    lspconfig.html.setup ({ capabilities = capabilities})
    lspconfig.cssls.setup ({ capabilities = capabilities})
    lspconfig.jsonls.setup ({ capabilities = capabilities})
    lspconfig.tsserver.setup ({ capabilities = capabilities})
    lspconfig.tsserver.setup ({ capabilities = capabilities})
    lspconfig.marksman.setup ({ capabilities = capabilities})
    lspconfig.pyright.setup ({ capabilities = capabilities})
    lspconfig.rust_analyzer.setup ({ capabilities = capabilities})
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

    end
  },
  -- CMP list
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
    -- config = function ()
    --   local cmp = require("cmp")
    --
    --   cmp.setup({
    --     sources = {
    --       {
    --         name = 'path',
    --         option = {
    --           -- Options go into this table
    --         },
    --       },
    --     },
    --   })
    -- end
  },
}
