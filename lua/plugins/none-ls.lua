return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

    -- avoid formatting issues
		local function lsp_formatting(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
				timeout_ms = 2000,
			})
		end

		local sources = {
			-- === Formatting ===
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,

			-- === Diagnostics ===
			null_ls.builtins.diagnostics.dotenv_linter,
			null_ls.builtins.diagnostics.pylint,
      require("none-ls.diagnostics.eslint_d"),
		}
		null_ls.setup({
			sources = sources,
		})
		vim.keymap.set("n", "<leader>gf", function()
			lsp_formatting(vim.api.nvim_get_current_buf())
		end)
	end,
}
