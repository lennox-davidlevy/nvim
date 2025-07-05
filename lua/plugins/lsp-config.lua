return {
	-- mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",
				"ts_ls",
				"marksman",
				"pylsp",
				"jsonls",
				"prettierd",
				"ruff",
				"stylua",
				"shfmt",
				"taplo",
				"pyproject-fmt",
				"yamlls",
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				-- conflicts with lsp.config.<lsp>, duplicates clients attached to buffer, disabled automatic enable for this reason
				automatic_enable = false,
			})
		end,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local function set_hl_for_floating_window()
				vim.api.nvim_set_hl(0, "NormalFloat", {
					link = "Normal", -- make float background the same as editor background
				})
				vim.api.nvim_set_hl(0, "FloatBorder", {
					bg = "none", -- make the border background transparent
				})
			end

			set_hl_for_floating_window()

			-- create an autocommand to apply the styling whenever a colorscheme is loaded.
			-- this prevents my settings from being overwritten by a theme.
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				desc = "Apply custom float styles after colorscheme loads",
				callback = set_hl_for_floating_window,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- styling
			local function setup_styling()
				local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
				function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
					opts = opts or {}
					opts.border = opts.border or "rounded"
					opts.max_width = opts.max_width or 100
					opts.max_height = opts.max_height or 30
					return orig_util_open_floating_preview(contents, syntax, opts, ...)
				end
			end

			-- keymaps
			local function setup_keymaps()
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "Show Code Action" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, desc = "Rename variables" })
				vim.keymap.set(
					"n",
					"<leader>e",
					vim.diagnostic.open_float,
					{ silent = true, desc = "Show Line Diagnostics" }
				)

				-- Navigate diagnostics/errors may implement later
				-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "Next diagnostic" })
				-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "Previous diagnostic" })
				-- vim.keymap.set("n", "]e", function()
				-- 	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
				-- end, { silent = true, desc = "Next error" })
				-- vim.keymap.set("n", "[e", function()
				-- 	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
				-- end, { silent = true, desc = "Previous error" })
				-- vim.keymap.set("n", "]w", function()
				-- 	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
				-- end, { silent = true, desc = "Next warning" })
				-- vim.keymap.set("n", "[w", function()
				-- 	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
				-- end, { silent = true, desc = "Previous warning" })
			end

			setup_styling()
			setup_keymaps()

			-- config
			local lspconfig = require("lspconfig")

			local function on_attach(client, bufnr)
				if client.name ~= "null-ls" then
					client.server_capabilities.publishDiagnostics = false
				end
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				settings = {
					css = { validate = true },
					scss = { validate = true },
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.pylsp.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				pycodestyle = { enabled = false },
			-- 				flake8 = { enabled = false },
			-- 				pyflakes = { enabled = false },
			-- 				mccabe = { enabled = false },
			-- 				pylint = { enabled = false },
			-- 				pydocstyle = { enabled = false },
			-- 				autopep8 = { enabled = false },
			-- 				yapf = { enabled = false },
			-- 				-- for completions
			-- 				jedi_completion = { enabled = true },
			-- 				jedi_definition = { enabled = true },
			-- 				jedi_hover = { enabled = true },
			-- 				jedi_references = { enabled = true },
			-- 				jedi_signature_help = { enabled = true },
			-- 				jedi_symbols = { enabled = true },
			-- 			},
			-- 		},
			-- 	},
			-- })
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				settings = {
					basedpyright = {
						disableOrganizeImports = true,
						analysis = {
							typeCheckingMode = "basic",
							reportMissingTypeStubs = false,
							reportAny = false,
							reportUndefinedVariable = true,
							reportAttributeAccessIssue = true,
						},
					},
				},
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						format = {
							enable = true,
						},
						schemaStore = {
							enable = true,
						},
					},
				},
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "bash", "sh", "zsh" },
			})
		end,
	},
}
