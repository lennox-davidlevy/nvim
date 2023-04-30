-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- functional
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({ "windwp/nvim-ts-autotag" })
	use({ "tpope/vim-commentary" })
	use({ "tpope/vim-surround" })
	use({ "mbbill/undotree" })
	use({ "christoomey/vim-tmux-navigator" })
	use({ "ThePrimeagen/harpoon" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Rust
	use("simrat39/rust-tools.nvim")
	use({ "j-hui/fidget.nvim" })

	-- Git
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })

	-- Bufferline
	use({ "akinsho/bufferline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })

	-- Colors
	use({ "lennox-davidlevy/warlock_transparent" })
	use({ "Shatur/neovim-ayu" })
	use({ "fcpg/vim-farout" })
	use({ "michaeldyrynda/carbon.vim" })
	use({ "sainnhe/gruvbox-material" })
	use({ "folke/tokyonight.nvim" })

	-- Treesitter and Tree
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({ "kyazdani42/nvim-tree.lua" })

	--Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-path" },
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "rafamadriz/friendly-snippets" })

	-- Testing
end)
