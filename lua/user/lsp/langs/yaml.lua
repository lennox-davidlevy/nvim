require("lspconfig").yamlls.setup({
	on_attach = function()
		print("yamlls attached")
	end,
	filetypes = {
		"yaml",
		"yaml.ansible",
		"yaml.docker-compose",
		"helm",
		"yml",
	},
	settings = {
		yaml = {
			format = { enable = true, singleQuote = true },
			validate = false,
			hover = true,
			completion = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				kubernetes = {
					"/*.helm.yaml",
					"/*.k8s.yaml",
				},
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.9.9-standalone-strict/all.json"] = "/*.k8s.{yml,yaml}",
				-- ["https://raw.githubusercontent.com/robbyki/schemas/1f05c98df4ca8398f502f554734ff5e87acfcc4c/openshift/all.json"] = "/*.ocp.{yml,yaml}",
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json"] = "roles/tasks/**/*.{yml,yaml}",
				-- ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-playbook.json"] = "playbook{s,}/**/*.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-playbook.json"] = "/*.playbook.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json"] = "inventory/*.{ini,yml}",
				["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
				["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["https://json.schemastore.org/helmfile"] = "helmfile.{yml,yaml}",
			},
		},
	},
})

-- hover fix
-- local function hover_wrapper(err, request, ctx, config)
-- 	local bufnr, winnr = vim.lsp.handlers.hover(err, request, ctx, config)
-- 	if bufnr == nil or winnr == nil then
-- 		return
-- 	end
-- 	local contents = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
-- 	contents = vim.tbl_map(function(line)
-- 		return string.gsub(line, "&emsp;", "")
-- 	end, contents)
-- 	vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
-- 	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)
-- 	vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
-- 	vim.api.nvim_win_set_height(winnr, #contents)

-- 	return bufnr, winnr
-- end

-- vim.lsp.handlers["textDocument/hover"] = hover_wrapper
