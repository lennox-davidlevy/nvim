function ColorScheme(color)
	color = { color or "ayu-dark" }
	vim.cmd.colorscheme(color)
end

ColorScheme()
