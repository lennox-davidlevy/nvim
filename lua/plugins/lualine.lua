return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "auto",
			},
			extensions = {
				"neo-tree",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						function()
							local filepath = vim.fn.expand("%:p")
							if filepath == "" then return "[No Name]" end
							local filename = vim.fn.fnamemodify(filepath, ":t")
							local parent = vim.fn.fnamemodify(filepath, ":h:t")
							local display = parent .. "/" .. filename
							if vim.bo.modified then
								-- Modern/Clean symbols
								-- display = display .. " ●"     -- dot
								-- display = display .. " ◆"     -- diamond
								-- display = display .. " ▲"     -- triangle (current)
								-- display = display .. " ■"     -- square
								-- display = display .. " ▼"     -- down triangle
								-- display = display .. " ◉"     -- circle with dot
								-- display = display .. " ⬢"     -- hexagon
								-- display = display .. " ⬟"     -- pentagon
								
								-- Retro/Gaming symbols
								-- display = display .. " ★"     -- star
								-- display = display .. " ♦"     -- diamond suit
								-- display = display .. " ♠"     -- spade suit
								-- display = display .. " ♣"     -- club suit
								-- display = display .. " ♥"     -- heart suit
								-- display = display .. " ◊"     -- lozenge
								-- display = display .. " ◈"     -- white diamond
								-- display = display .. " ⬟"     -- pentagon
								-- display = display .. " ⬢"     -- hexagon
								-- display = display .. " ⬣"     -- hexagon outline
								
								-- Tech/Code symbols
								-- display = display .. " ⚡"     -- lightning bolt
								-- display = display .. " ⚠"     -- warning sign
								-- display = display .. " ⚙"     -- gear
								-- display = display .. " ⚫"     -- black circle
								-- display = display .. " ⚪"     -- white circle
								-- display = display .. " ⭐"     -- star
								-- display = display .. " 🔥"     -- fire
								display = display .. " 💾"     -- floppy disk
								-- display = display .. " 📝"     -- memo
								-- display = display .. " ✏️"     -- pencil
								
								-- Arrows and pointers
								-- display = display .. " ➤"     -- arrow
								-- display = display .. " ▶"     -- play button
								-- display = display .. " ►"     -- play button alt
								-- display = display .. " ⇨"     -- arrow right double
								-- display = display .. " ⟩"     -- angle bracket
								-- display = display .. " ❯"     -- angle bracket bold
								
								-- Minimal/Subtle
								-- display = display .. " •"     -- bullet
								-- display = display .. " ·"     -- middle dot
								-- display = display .. " ‣"     -- triangular bullet
								-- display = display .. " ◦"     -- white bullet
								-- display = display .. " ▪"     -- small square
								-- display = display .. " ▫"     -- small white square
								-- display = display .. " ⁎"     -- asterisk
								-- display = display .. " ∘"     -- ring operator
								
								-- Fun/Unique
								-- display = display .. " ⚡"     -- lightning
								-- display = display .. " ✨"     -- sparkles
								-- display = display .. " 🌟"     -- glowing star
								-- display = display .. " 💫"     -- dizzy star
								-- display = display .. " ⭕"     -- heavy circle
								-- display = display .. " 🔴"     -- red circle
								-- display = display .. " 🟡"     -- yellow circle
								-- display = display .. " 🟠"     -- orange circle
								-- display = display .. " ⚫"     -- black circle
								-- display = display .. " 🔸"     -- small orange diamond
								-- display = display .. " 🔹"     -- small blue diamond
								-- display = display .. " 💎"     -- gem
								
								-- display = display .. " ▲"
							end
							return display
						end,
						color = { fg = "#000000", bg = "#ffff00", gui = "bold" },
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
