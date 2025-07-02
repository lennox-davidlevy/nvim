return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "gruvbox",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "|" },
			},
			extensions = {
				"neo-tree",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = false,
						path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path, 3: Absolute path with ~ for home
						shorting_target = 40,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
						color = { fg = "#ebdbb2", gui = "bold" }, -- Gruvbox light foreground, bold
					},
				},
				lualine_x = { "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
