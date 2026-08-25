-- Laravel_ls
-- local util = require('lspconfig.util')

vim.lsp.config('laravel_ls', {
	-- Don’t attach to random single PHP files
	workspace_required = true,
	cmd = { "laravel-ls" },
	filetypes = { "php", "blade" },
	root_markers = { "artisan" },
	capabilities = require("blink.cmp").get_lsp_capabilities()
})
vim.lsp.enable('laravel_ls');
