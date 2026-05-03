return {
	-- 2026-05-03: Could not get the lsp working from here at all
	-- Doing that via lspconfig now.
	"yuukiflow/Arduino-Nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Load Arduino plugin for .ino files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "arduino",
			callback = function()
				require("Arduino-Nvim")
			end,
		})
	end,
}
