return {
	'stevearc/aerial.nvim',
	lazy = true,
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	keys = {
      { "<leader>a", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
    },
	config = function()
		require("aerial").setup()
	end,
}
