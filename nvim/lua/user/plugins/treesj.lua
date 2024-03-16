return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	keys = {
		{ 'JJ', function() require('treesj').join() end },
		{ 'SS', function() require('treesj').split() end },
	},
	opts = {
		use_default_keymaps = false,
	},
}
