local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape sequence
map('i', 'jk', '<Esc>', { noremap = true })


-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Splits
map("n", "<leader>s", ":sp<CR> <C-w>j<CR>", opts)
map("n", "<leader>v", ":vsp<CR> <C-w>l<CR>", opts)

map("n", "tt", ":tab split<CR>", opts)
map("n", "tr", ":tabc<CR>", opts)
map("n", "<leader>o", ":on<CR>", opts)

-- Navigate buffers
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bb", ":bprevious<CR>", opts)
