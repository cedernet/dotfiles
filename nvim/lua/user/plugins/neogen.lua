-- https://github.com/danymat/neogen
return {
	"danymat/neogen",
	lazy = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
			languages = {
				php = {
					template = {
						annotation_convention = "phpdoc",
					},
				}
			},
		})
	end,
	keys = {
		{ "<leader>pd", "<cmd>Neogen<cr>", desc = "Neogen generate docblock" },
	}
}
