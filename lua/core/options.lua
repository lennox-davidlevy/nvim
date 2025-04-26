vim.g.mapleader = ","

local options = {
  -- style
  number = true,
  signcolumn = 'yes',
  termguicolors = true,
  cmdheight = 1,
  showmode = false,

  -- functionality
  ignorecase = true,
  splitright = true,
  splitbelow = true,
	clipboard = 'unnamedplus',
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	mouse = '',

  -- undo tree
  undofile = true,
  undodir = undodir
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


local undodir = vim.fn.stdpath("config") .. "/.undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

print("Core options loaded...")
