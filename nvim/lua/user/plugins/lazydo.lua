--[[
https://github.com/Dan7h3x/LazyDo

:LazyDoToggle - Toggle the task manager window
]]--
return {
	{
		"Dan7h3x/LazyDo",
		branch = "main",
		cmd = { "LazyDoToggle", "LazyDoPin" },
		keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
			{
				"<leader>lt",
				"<ESC><CMD>LazyDoToggle<CR>",
				mode = { "n" },
			},
		},
		event = "VeryLazy",
		opts = {
			-- your config here
		},
	},
}
