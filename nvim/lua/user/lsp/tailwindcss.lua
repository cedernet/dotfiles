-- Tailwind CSS
vim.lsp.config('tailwindcss', {
	capabilities = require("blink.cmp").get_lsp_capabilities()
})
vim.lsp.enable('tailwindcss');
