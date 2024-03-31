-- https://github.com/smoka7/hop.nvim
return {
	'smoka7/hop.nvim',
	version = "*",
	config = function()
		require('hop').setup()
		vim.keymap.set('n', 's', ':HopWord<CR>');
		vim.keymap.set('v', 's', '<cmd>HopWord<CR>');
	end,
}
