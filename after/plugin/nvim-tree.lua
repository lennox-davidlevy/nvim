local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      show = {
        file = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "v",
          arrow_closed = ">",
          default = "[]",
          open = "[⎵",
          empty = "||",
          empty_open = "|_",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "US",
          staged = "ST",
          unmerged = "UN",
          renamed = "RN",
          untracked = "UT",
          deleted = "DE",
          ignored = "IG",
        },
      },
    },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 40,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
  },
})
