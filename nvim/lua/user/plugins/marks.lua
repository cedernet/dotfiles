return {
	'chentoast/marks.nvim',
	config = function()
		require('marks').setup({
			force_write_shada = true,
			mappings = {
				set = "m",
				set_next = "m,",
				toggle = "m;",
				next = "m>",
				prev = "m<",
				preview = "m:",
				next_bookmark = "m}",
				prev_bookmark = "m{",
				delete = "dm",
				delete_line = "dm-",
				delete_bookmark = "dm=",
				delete_buf = "dm<space>"
			}
		});
	end
}

