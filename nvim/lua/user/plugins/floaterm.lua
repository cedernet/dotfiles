-- https://github.com/voldikss/vim-floaterm
return {
	'voldikss/vim-floaterm',
	keys = {
		{ '<F12>', ':FloatermToggle<CR>' },
		{ '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
	},
	cmd = { 'FloatermToggle' },
	init = function()
		-- vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.3
		vim.g.floaterm_wintype = 'split'
	end,
}
