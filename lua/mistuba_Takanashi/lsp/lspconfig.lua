-- ensure installed servers 
local servers = {
  "lua_ls",
  -- "pyright",
  "jedi_language_server",
}

-- mason to handle lsp installation 
local mason = require("mason")
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- import lspconfig plugin
local lspconfig = require("lspconfig")

-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require("cmp_nvim_lsp")



vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)


  local client = vim.lsp.get_active_clients({ bufnr = ev.buf })[1]
    if client then
      local function lsp_highlight_document(client)
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          })
        end
      end

      lsp_highlight_document(client)
    end


    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }



    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- go to references
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts) -- go to references
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts) -- show diagnostics for line
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  end,
})

-- used to enable autocompletion (assign to every lsp server config
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


local config = {
  -- disable virtual text
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})





mason_lspconfig.setup_handlers({
  -- default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
  ["lua_ls"] = function()
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
  ["pyright"] = function()
    lspconfig["pyright"].setup({
      capabilities = capabilities,
        settings = {
        python = {
        analysis = {
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "none",
            reportOptionalMemberAccess = "none",
            reportOptionalSubscript = "none",
            reportPrivateImportUsage = "none",
            },
          }
        }
      },
        -- python = {
        --   analysis = {
        --     autoSearchPaths = true,
        --     diagnosticMode = "workspace",
        --     useLibraryCodeForTypes = true,
        --     diagnosticOptions = {
        --       reportUnknownMemberType = false,
        --       reportUnusedImport = false,
        --     },
        --   },
        -- },
        -- diagnosticSeverity = {
        -- -- Disable the specific diagnostic you want to hide
        -- ['reportUnusedImport'] = 'none',
        -- },
    })
  end,
})







