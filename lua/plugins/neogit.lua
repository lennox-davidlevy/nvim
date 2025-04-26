return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    -- diffview
    {"<leader>df", "<cmd>DiffviewOpen<cr>", mode = "n", desc = "Open diffview", },
    {"<leader>dc", "<cmd>DiffviewClose<cr>", mode = "n", desc = "Close diffview"},
    -- neogit
    {"<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit"},
  }
}
