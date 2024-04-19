return  {
	'sainnhe/everforest',
	config = function()
		vim.g.everforest_terminal_colors = 1
		vim.g.everforest_background = 'hard'
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_better_performance = 1
		vim.g.everforest_cursor = 'aqua'
		vim.cmd [[colorscheme everforest]]
	end,
}
