require("lspconfig").emmet_ls.setup({
  filetypes = {
    "html",
    "css",
    "scss",
    "sass",
  },
  on_attach = function(client, bufnr)
    print("emmet attached")
  end,
})
