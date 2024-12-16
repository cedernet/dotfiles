-- https://github.com/smoka7/hop.nvim
return {
	'smoka7/hop.nvim',
	version = "*",
	config = function()
		require('hop').setup()
		-- vim.keymap.set('n', 's', ':HopWord<CR>');
		-- vim.keymap.set('v', 's', '<cmd>HopWord<CR>');
		vim.keymap.set('n', 's', ':HopChar2<CR>');
		vim.keymap.set('v', 's', '<cmd>HopChar2<CR>');
	end,
}
