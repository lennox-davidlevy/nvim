vim.keymap.set('i', 'jk', '<Esc>', {noremap=true})
vim.g.mapleader = ","

local undodir = vim.fn.stdpath("config") .. "/.undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

local options = {
	clipboard = 'unnamedplus',
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	mouse = '',
  undofile = true,
  undodir = undodir
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>n', ':Neotree toggle <CR>', {})

vim.cmd.colorscheme "gruvbox-material"
