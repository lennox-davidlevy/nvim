return {
	-- mason
	{
		"williamboman/mason.nvim",
		config = true,
	},

	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "bashls", "ts_ls" },
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
					opts.max_width = opts.max_width or 80
					opts.max_height = opts.max_height or 20
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
			end

			setup_styling()
			setup_keymaps()

			-- this is a function to fix the vim.lsp.buf.rename issue in python files while using pyright.
			local function create_pyright_handlers()
				local function fix_workspace_edit(workspace_edit)
					if workspace_edit and workspace_edit.documentChanges then
						for _, change in ipairs(workspace_edit.documentChanges) do
							if change.edits then
								for _, edit in ipairs(change.edits) do
									if edit.annotationId and not workspace_edit.changeAnnotations then
										edit.annotationId = nil
									end
								end
							end
						end
					end
					return workspace_edit
				end

				return {
					["textDocument/rename"] = function(err, result, ctx, config)
						if result and result.documentChanges then
							result = fix_workspace_edit(result)
						end
						vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)
					end,
				}
			end

			-- config
			local lspconfig = require("lspconfig")

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
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				handlers = create_pyright_handlers(),
				settings = {
					python = {
						analysis = {
							ignore = { "*" },
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "bash", "sh", "zsh" },
				settings = {
					bashIde = {
						globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
					},
				},
			})
		end,
	},
}
