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
	capabilities = require("blink.cmp").get_lsp_capabilities()
})
vim.lsp.enable('intelephense');
