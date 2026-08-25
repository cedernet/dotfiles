local home = os.getenv("HOME")

vim.lsp.config("arduino_language_server", {
	cmd = {
		"arduino-language-server",
		"-clangd", "/usr/bin/clangd",
		"-cli", "/opt/homebrew/bin/arduino-cli",
		"-cli-config", home .. "/Library/Arduino15/arduino-cli.yaml",
		"-fqbn", "arduino:renesas_uno:unor4wifi",
	},
	filetypes = { "arduino" },
	root_markers = { "sketch.yaml", "*.ino" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),

})
vim.lsp.enable("arduino_language_server")
