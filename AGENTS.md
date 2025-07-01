# Agent Guidelines for Neovim Configuration

## Build/Test Commands
- No build system - this is a Neovim Lua configuration
- Test by opening Neovim: `nvim` (configuration auto-loads from init.lua)
- Check syntax: `luacheck lua/` (if luacheck is installed)
- Reload config: `:source %` or restart Neovim

## Code Style Guidelines

### File Structure
- Core config: `lua/core/` (options.lua, keymaps.lua)
- Plugins: `lua/plugins/` (one file per plugin/feature)
- Entry point: `init.lua` (requires core modules, sets up lazy.nvim)

### Lua Conventions
- Use tabs for indentation (tabstop=2, shiftwidth=2, expandtab=true)
- Snake_case for variables and functions
- Use `local` for all variables to avoid global scope pollution
- Plugin configs return table with lazy.nvim spec format
- Use double quotes for strings consistently

### Imports/Requires
- Use `require("module")` at top of files
- Group requires: core modules first, then plugins
- Use local variables for required modules: `local telescope = require("telescope")`
- Avoid circular dependencies between modules

### Error Handling
- Use `pcall()` for potentially failing operations (e.g., colorscheme loading)
- Provide fallbacks and user notifications with `vim.notify()`
- Check for plugin availability before configuration
- Handle missing directories with `vim.fn.mkdir(path, "p")`

### Plugin Configuration
- Use lazy loading with `keys`, `cmd`, or `event` triggers
- Define keymaps in plugin spec for better organization
- Use descriptive `desc` fields for all keymaps
- Prefer function configs over inline tables for complex setups
