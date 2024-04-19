return   {
	'xiyaowong/transparent.nvim',
	config = function()
		require('transparent').setup {
			extra_groups = {
				'NvimTreeNormal',
				'NvimTreeNormalNC',
				-- Add other groups
			},
		}
		require('transparent').clear_prefix('NeoTree')
		vim.api.nvim_set_keymap(
			'n',
			'<leader>tt',
			':TransparentToggle<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
