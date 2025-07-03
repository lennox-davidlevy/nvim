return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{ "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")
		local command = require("neo-tree.command")

		neotree.setup({

			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						command.execute({ action = "close" })
					end,
				},
			},

			default_component_configs = {
				icon = {
					folder_closed = "[+]",
					folder_open = "[⎵",
					folder_empty = "[]",
					default = "",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "A",
						modified = "M",
						deleted = "D",
						renamed = "R",
						-- Status type
						untracked = "?",
						ignored = "I",
						unstaged = "!",
						staged = "S",
						conflict = "C",
					},
				},
				type = {
					enabled = false,
				},
			},
		})
	end,
}
