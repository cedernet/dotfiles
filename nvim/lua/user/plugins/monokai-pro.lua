-- https://github.com/loctvl842/monokai-pro.nvim
return {
	'loctvl842/monokai-pro.nvim',
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			override = function()
				return {
					Normal = { bg = "#1C1C1C" }
				}
			end
		})
		vim.cmd('colorscheme monokai-pro-spectrum')
	end
}
