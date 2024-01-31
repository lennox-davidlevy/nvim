function ColorScheme(color)
	-- color = { color or "tokyonight-moon" }
	color = { color or "ayu-dark" }
	vim.cmd.colorscheme(color)
end

ColorScheme()
