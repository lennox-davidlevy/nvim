return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = "BufWritePre",
	keys = { "<leader>gf" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				toml = { "pyproject-fmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				vue = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
			},

			format_on_save = nil,
			formatters = {
				stylua = {
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						"$FILENAME",
						"-", -- read from stdin
					},
				},
			},
		})

		-- Manual formatting keymap
		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				timeout_ms = 1000,
				lsp_format = true,
				async = false,
			})
		end, { desc = "Format buffer [conform]" })
	end,
}
