return {
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		-- For json stuff
		'b0o/schemastore.nvim',
		{ 'jose-elias-alvarez/null-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
		'jayp0521/mason-null-ls.nvim',
	},
	config = function()
		-- Setup Mason to automatically install LSP servers
		require('mason').setup({
			ui = {
				height = 0.8,
			},
		})
		require('mason-lspconfig').setup({
			automatic_installation = false
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Lua
		require('lspconfig').lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = {'vim'}
					}
				}
			}
		})

		-- Vim Ls
		-- require('lspconfig').vimls.setup({
		-- 	filetypes = {
		-- 		'vim',
		-- 	},
		-- })

		-- PHP
		require('lspconfig').intelephense.setup({
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
					stubs = {
						"bcmath",
						"bz2",
						"Core",
						"curl",
						"date",
						"dom",
						"fileinfo",
						"filter",
						"gd",
						"gettext",
						"hash",
						"iconv",
						"imap",
						"intl",
						"json",
						"libxml",
						"mbstring",
						"mcrypt",
						"mysql",
						"mysqli",
						"openssl",
						"password",
						"pcntl",
						"pcre",
						"PDO",
						"pdo_mysql",
						"Phar",
						"random",
						"readline",
						"regex",
						"session",
						"SimpleXML",
						"sockets",
						"sodium",
						"standard",
						"superglobals",
						"tokenizer",
						"xml",
						"xdebug",
						"xmlreader",
						"xmlwriter",
						"yaml",
						"zip",
						"zlib",
						"wordpress-stubs",
						"woocommerce-stubs",
						"acf-pro-stubs",
						"wordpress-globals",
						"wp-cli-stubs",
						"genesis-stubs",
						"polylang-stubs"
					},
					environment = {
						includePaths = {
							'/Users/ebbec/.composer/vendor/php-stubs/',
							'/Users/ebbec/.composer/vendor/wpsyntex/',
							-- '/home/ebbec/.composer/vendor/php-stubs/',
							-- '/home/ebbec/.composer/vendor/wpsyntex/',
						}
					},
					files = {
						maxSize = 5000000;
					};
				};
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

		require('lspconfig').phpactor.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				client.server_capabilities.completionProvider = false
				client.server_capabilities.hoverProvider = false
				client.server_capabilities.implementationProvider = false
				client.server_capabilities.referencesProvider = false
				client.server_capabilities.renameProvider = false
				client.server_capabilities.selectionRangeProvider = false
				client.server_capabilities.signatureHelpProvider = false
				client.server_capabilities.typeDefinitionProvider = false
				client.server_capabilities.workspaceSymbolProvider = false
				client.server_capabilities.definitionProvider = false
				client.server_capabilities.documentHighlightProvider = false
				client.server_capabilities.documentSymbolProvider = false
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			init_options = {
				["language_server_phpstan.enabled"] = false,
				["language_server_psalm.enabled"] = false,
			},
			handlers = {
				['textDocument/publishDiagnostics'] = function() end
			}
		})

		-- Vue, JavaScript, TypeScript
		require('lspconfig').volar.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				-- if client.server_capabilities.inlayHintProvider then
				-- 	vim.lsp.buf.inlay_hint(bufnr, true)
				-- end
			end,
			capabilities = capabilities,
		})

		require('lspconfig').ts_ls.setup{
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = {"javascript", "typescript", "vue"},
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				"vue",
			},
		}

		-- Tailwind CSS
		require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

		-- JSON
		require('lspconfig').jsonls.setup({
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require('schemastore').json.schemas(),
				},
			},
		})

		-- Emmet
		require('lspconfig').emmet_ls.setup({
			capabilities = capabilities,
			filetypes = {
				"css",
				"php",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					}
				}
			}
		})

		-- null-ls
		local null_ls = require('null-ls')
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			temp_dir = '/tmp',
			sources = {
				null_ls.builtins.diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ '.eslintrc.js' })
					end,
				}),

				null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),

				null_ls.builtins.formatting.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
					end,
				}),

				-- Custom rules https://mlocati.github.io/php-cs-fixer-configurator/#version:3.51
				-- Documentation https://laravel.com/docs/11.x/pint
				null_ls.builtins.formatting.pint.with({
					condition = function(utils)
						return utils.root_has_file({ 'vendor/bin/pint' })
					end,
				}),

				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--plugin-search-dir=." },
					filetypes = {
						"javascript",
						"css",
						"php"
					},
					condition = function(utils)
						return utils.root_has_file({
							'.prettierrc',
							'.prettierrc.json',
							'.prettierrc.yml',
							'.prettierrc.js',
							'prettier.config.js',
						})
					end,
					prefer_local = true,
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
						end,
					})
				end
			end,
		})

		require('mason-null-ls').setup({ automatic_installation = true })

		-- Keymaps
		vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
		vim.keymap.set('n', '<d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
		vim.keymap.set('n', '>d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
		vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>')
		vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
		vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
		vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
		-- vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

		-- Commands
		vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

		-- Diagnostic configuration
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				source = true,
			}
		})

		-- Add borders to popups
		-- https://vi.stackexchange.com/questions/39074/user-borders-around-lsp-floating-windows
		-- local _border = "single"
		local _border = "rounded"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover, {
				border = _border
			}
		)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help, {
				border = _border
			}
		)
		vim.diagnostic.config{
			float={border=_border}
		}
		require('lspconfig.ui.windows').default_options = {
			border = _border
		}

		-- Sign configuration
		vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
		vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
		vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
		vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
	end,
}
