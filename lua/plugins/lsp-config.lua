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
      automatic_setup = false
		},
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
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
			lspconfig.lua_ls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.ts_ls.setup({})
			-- lspconfig.pyright.setup({})
		end,
	},
}
