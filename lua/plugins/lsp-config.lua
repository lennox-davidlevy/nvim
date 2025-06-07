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
					link = "Normal", -- Make float background the same as editor background
				})
				vim.api.nvim_set_hl(0, "FloatBorder", {
					bg = "none", -- Make the border background transparent
				})
			end

			-- 2. Apply the styling immediately on startup.
			set_hl_for_floating_window()

			-- 3. Create an autocommand to re-apply the styling whenever a colorscheme is loaded.
			--    This prevents your settings from being overwritten by a theme.
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
				vim.keymap.set(
					"n",
					"<leader>e",
					vim.diagnostic.open_float,
					{ silent = true, desc = "Show Line Diagnostics" }
				)
			end

			setup_styling()
			setup_keymaps()

			-- config
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
		end,
	},
}
