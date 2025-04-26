return { 
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "lua", "vimdoc", "python", "typescript", "json", "html", "yaml", "bash", "markdown", "markdown_inline" },
    indent = {
      enable = true
    },
    highlight = {
      enable = true
    }
  }
}
