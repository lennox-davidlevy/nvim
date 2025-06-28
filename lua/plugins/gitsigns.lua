return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "A" },
				change = { text = "C" },
				delete = { text = "D" },
				topdelete = { text = "T" },
				changedelete = { text = "X" },
				untracked = { text = "U" },
			},
			signcolumn = true,
			watch_gitdir = { follow_files = true },
			attach_to_untracked = false,
			update_debounce = 100,
			max_file_length = 40000,
		})
	end,
}
