return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {"<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files"},
      {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
      {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers"},
      {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help"},
      {"<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Find Theme"},
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup{
        defaults = {
          mappings = {
            i = {
              ["qq"] = actions.close
            },
            n = {
              ["q"] = actions.close
            }
          }
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
