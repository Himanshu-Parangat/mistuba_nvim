-----------------------
-- diagnostic
-----------------------

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

-- diagnostic keymap
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-----------------------
-- auto cmd for lsp
-----------------------

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("mistuba-lsp-attach", { clear = true }),
	callback = function(event)
		-- keymap shorter
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gs", vim.lsp.buf.signature_help, "signature help")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("mistuba-lsp-highlight", { clear = false })

			-- cursor rest
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			-- cursor is up to somting
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("mistuba-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "mistuba-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		-- enable inlay hints if supported
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

-----------------------
-- LSP
-----------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- code fold capabilities
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
require("ufo").setup()

capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	tailwindcss = {},
	jinja_lsp = {},
	cssls = {},
	dockerls = {},
	docker_compose_language_service = {},

	lua_ls = {
		settings = {
			Lua = {
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
				telemetry = {
					enable = false,
				},
				hint = {
					enable = true,
				},
			},
		},
	},
}

-----------------------
-- mason
-----------------------

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

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {

	-- Formater
	"black",
	"isort",
	"prettier",
	"stylua",

	-- Linter 
  "eslint_d",
  "luacheck",
  "pylint",

	--lsplsp
  "jinja-lsp", -- "jinja_lsp"
  "css-lsp",  -- "cssls" microsoft lsp for CSS/SCSS 
  "emmet-language-server", -- "emmet_language_server" A language server for emmet.io.
  "jinja-lsp", -- "jinja_lsp"
  "json-lsp",  -- "jsonls",
  "lua-language-server", -- "lua_ls",
  "pyright",
  "tailwindcss-language-server",
	"tailwindcss",
  "typescript-language-server", -- "ts_ls",

	"dockerls",
	"docker_compose_language_service",
})

local mason_tool_installer = require("mason-tool-installer")
mason_tool_installer.setup({ ensure_installed = ensure_installed })

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})

---------------------------------------
-- additional docker-compose lsp setup 
---------------------------------------

local ft_lsp_group = vim.api.nvim_create_augroup("ft_lsp_group",{clear=true})
vim.api.nvim_create_autocmd({"BufReadPost","BufNewFile"},{
    pattern={"docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml"},
    group = ft_lsp_group,
    desc = "Fix the issue where the LSP does not start with docker-compose.",
    callback = function ()
        vim.opt.filetype = "yaml.docker-compose"
    end
})
