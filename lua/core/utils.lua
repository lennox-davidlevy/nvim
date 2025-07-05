local M = {}

-- Changes the working dir to fix some weird bug I am getting with telescope and tmux.
-- Must keep an eye on this one, have no idea why it started, but it is bizarre.
function M.auto_cd_git_root()
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		return
	end

	local current_dir = vim.fn.fnamemodify(current_file, ":h")
	local git_root = vim.fn.systemlist(
		"cd " .. vim.fn.shellescape(current_dir) .. " && git rev-parse --show-toplevel 2>/dev/null"
	)[1]

	if git_root and git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
		local current_cwd = vim.fn.getcwd()
		if current_cwd ~= git_root then
			vim.cmd("cd " .. vim.fn.fnameescape(git_root))
		end
	end
end

return M

