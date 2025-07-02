return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"vimdoc",
			"python",
			"typescript",
			"json",
			"html",
			"yaml",
			"bash",
			"markdown",
			"markdown_inline",
      "go"
		},
		auto_install = true,
		indent = {
			enable = true,
		},
		highlight = {
			enable = true,
      additional_vim_regex_highlighting = false,
		},
	},
}
