-- TODO: Fix this with this https://github.com/neovim/nvim-lspconfig

return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		-- For json stuff
		'b0o/schemastore.nvim',
	},
	config = function()
		require('mason').setup({
			ui = {
				height = 0.8,
			},
		})

		-- NOTE: This caused lsp's to trigger twice
		require('mason-lspconfig').setup({
			automatic_enable = false
		})

		-- JSON
		-- vim.lsp.config('jsonls', {
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		json = {
		-- 			schemas = require('schemastore').json.schemas(),
		-- 		},
		-- 	},
		-- })
		-- vim.lsp.enable('jsonls');

		-- Keymaps
		vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
		vim.keymap.set('n', '<d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
		vim.keymap.set('n', '>d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
		vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>')
		vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
		-- vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
		vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
		-- vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

		-- Commands
		vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

		-- Sign configuration
		vim.diagnostic.config {
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "󰋼",
					[vim.diagnostic.severity.HINT] = "󰌵",
				},
			},
			float = {
				border = "rounded",
				format = function(d)
					return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
				end,
			},
			underline = true,
			jump = {
				float = true,
			},
		}
	end,
}
