function ColorScheme(color)
	color = { color or "farout" }
	vim.cmd.colorscheme(color)
end

ColorScheme()
