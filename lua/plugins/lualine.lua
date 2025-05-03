return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 1000,
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "gruvbox",
			},
			extensions = {
				"neo-tree",
			},
		})
	end,
}
