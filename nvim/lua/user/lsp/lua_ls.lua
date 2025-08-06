vim.lsp.config['luals'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' }
			},
			format = {
				enable = true,
				defaultConfig = {
					align_array_table = "false",       -- Disables aligning array-like tables
					align_continuous_assign_statement = "false", -- Disables aligning '=' signs
				},
			},
		}
	}
}
vim.lsp.enable('luals')
