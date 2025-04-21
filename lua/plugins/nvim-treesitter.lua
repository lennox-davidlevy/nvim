return { 
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua", "vimdoc"},
    highlight = { enabled = true },
    indent = { enabled = true }
  }
}
