-- https://github.com/danymat/neogen
return {
	"danymat/neogen",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip", languages = { php = { template = { annotation_convention = "phpdoc" } } } })
		-- Keymap: generate docblock for function/class at cursor
		vim.keymap.set("n", "<leader>pd", function() require("neogen").generate() end,
			{ desc = "Generate PHPDoc (Neogen)" })
	end,
}
