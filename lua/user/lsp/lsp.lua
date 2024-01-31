local lsp = require("lsp-zero").preset("recommended")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

--remove inline messages and underline
vim.diagnostic.config({ virtual_text = false, underline = false })
--short message
vim.opt.shortmess = vim.opt.shortmess + "c"

lsp.ensure_installed({
	"tsserver",
})

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").terraformls.setup({})
require("lspconfig").sqlls.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").pylsp.setup({})
-- require("fidget").setup({})

-- require("lspconfig").pyright.setup({})

-- require("lspconfig").emmet_ls.setup({
--   filetypes = {
--     "html",
--     "css",
--     "scss",
--     "javascriptreact",
--     "typescriptreact",
--     "sass",
--   },
--   on_attach = function(client, bufnr)
--     print("hello emmet")
--   end,
-- })

lsp.setup()
