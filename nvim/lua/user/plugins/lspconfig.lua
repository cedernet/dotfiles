-- TODO: Fix this with this https://github.com/neovim/nvim-lspconfig

return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		-- For json stuff
		'b0o/schemastore.nvim',
		-- { 'nvimtools/none-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
	},
	config = function()
		-- Setup Mason to automatically install LSP servers
		require('mason').setup({
			ui = {
				height = 0.8,
			},
		})

		-- NOTE: This caused lsp's to trigger twice
		--	
		require('mason-lspconfig').setup({
			automatic_enable = false
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- PHP
		vim.lsp.config('intelephense', {
			commands = {
				IntelephenseIndex = {
					function()
						vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
					end,
				},
			},
			-- https://github.com/Mte90/dotfiles/blob/master/.config/nvim/lua/plugin/lsp.lua
			settings = {
				intelephense = {
					stubs = { "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter", "gd", "gettext", "hash", "iconv", "imap", "intl", "json", "libxml", "mbstring", "mcrypt", "mysql", "mysqli", "openssl", "password", "pcntl", "pcre", "PDO", "pdo_mysql", "Phar", "random", "readline", "regex", "session", "SimpleXML", "sockets", "sodium", "standard", "superglobals", "tokenizer", "xml", "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", "zlib", "wordpress-stubs", "woocommerce-stubs", "acf-pro-stubs", "wordpress-globals", "wp-cli-stubs", "genesis-stubs", "polylang-stubs" },
					environment = {
						includePaths = {
							'/Users/ebbec/.composer/vendor/php-stubs/',
							'/Users/ebbec/.composer/vendor/wpsyntex/',
							-- '/home/ebbec/.composer/vendor/php-stubs/',
							-- '/home/ebbec/.composer/vendor/wpsyntex/',
						}
					},
					files = {
						maxSize = 5000000,
					},
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				-- if client.server_capabilities.inlayHintProvider then
				--   vim.lsp.buf.inlay_hint(bufnr, true)
				-- end
			end,
			capabilities = capabilities
		})
		vim.lsp.enable('intelephense');

		-- Laravel_ls
		local util = require('lspconfig.util')

		vim.lsp.config('laravel_ls', {
			-- Don’t attach to random single PHP files
			single_file_support = false,

			root_dir = function(fname)
				-- start from composer.json/.git and walk up
				local root = util.root_pattern('composer.json', '.git')(fname)
				if not root then return nil end

				-- Laravel hallmark files
				local artisan = util.path.join(root, 'artisan')
				local bootstrap_app = util.path.join(root, 'bootstrap', 'app.php')
				if util.path.is_file(artisan) or util.path.is_file(bootstrap_app) then
					return root
				end

				return nil -- not Laravel don’t start laravel_ls
			end,
		})
		vim.lsp.enable('laravel_ls');

		-- JavaScript, TypeScript
		vim.lsp.config('ts_ls', {
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				"vue",
			},
		})
		vim.lsp.enable('ts_ls');

		-- Tailwind CSS
		-- vim.lsp.config('tailwindcss', {
		-- 	capabilities = capabilities
		-- })
		-- vim.lsp.enable('tailwindcss');

		-- JSON
		vim.lsp.config('jsonls', {
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require('schemastore').json.schemas(),
				},
			},
		})
		vim.lsp.enable('jsonls');

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
