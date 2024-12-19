return {
	'ribru17/bamboo.nvim',
	lazy = true,
	priority = 900,
	config = function()
		require('bamboo').setup()
		-- require('bamboo').load()
	end,
}
