# telescope.actions.set.edit error corrupts working directory when pressing Enter with no selection

## Description

When using `find_files` (or other pickers), if you press `<CR>` (Enter) when no file is selected or when search results are empty, telescope throws the error:

```
[telescope.actions.set.edit]: Nothing currently selected
```

**Expected behavior:** The picker should either close gracefully or show a user-friendly message.

**Actual behavior:** After this error occurs, telescope's working directory becomes corrupted. Subsequent `find_files` calls search from a different repository/directory than expected, even when the current buffer is from a different project.

## Steps to reproduce

1. Open telescope with `:Telescope find_files`
2. Type a nonsense search term that matches no files (e.g., `skldjaldksj`)
3. Press `<CR>` (Enter) when no results are shown
4. Close telescope and reopen it
5. Notice that telescope now searches from a different directory than expected

## Environment

- Telescope version: 0.1.8
- Neovim version: [your version]
- OS: Linux

## Workaround

Override the default `<CR>` mapping to check for valid selection:

```lua
["<CR>"] = function(prompt_bufnr)
  local selection = require("telescope.actions.state").get_selected_entry()
  if selection then
    actions.select_default(prompt_bufnr)
  else
    actions.close(prompt_bufnr)
  end
end
```

This issue is particularly problematic in tmux environments where users frequently switch between different project directories.