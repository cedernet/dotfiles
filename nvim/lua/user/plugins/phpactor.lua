return {
	'phpactor/phpactor',
	build = 'composer install --no-dev --optimize-autoloader',
	ft = 'php',
	keys = {
		{ '<Leader>pm', ':PhpactorContextMenu<CR>' },
		{ '<Leader>im', ':PhpactorImportMissingClasses<CR>' },
	},
	config = function()
		require("lspconfig").phpactor.setup({
			init_options = {
				["indexer.enabled"] = false,

				["indexer.exclude_patterns"] = {
					"**/vendor/**",
					"**/node_modules/**",
					"**/dist/**",
					"**/build/**",
					"**/.git/**",
				},

				-- optional: avoid duplicate diagnostics if Intelephense handles them
				["language_server_phpstan.enabled"] = false,
				["language_server_psalm.enabled"] = false,
			}
		})
	end
}
