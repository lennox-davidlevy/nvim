-- require 'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all" (the five listed parsers should always be installed)
--   ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,

--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = true,

--   highlight = {
--     enable = true,

--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
-- }

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"html",
		"javascript",
		"typescript",
		"tsx",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"rust",
		"bash",
		"go",
		"python",
		"yaml",
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	-- auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css", "scss" }, -- list of language that will be disabled
	},
	-- autopairs = {
	-- 	enable = true,
	-- },
	autotag = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css", "yaml", "rust" } },
	additional_vim_regex_highlighting = false,
})
