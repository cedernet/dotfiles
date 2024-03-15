return {
	'Djancyp/better-comments.nvim',
	config = function()
		require("better-comment").Setup({
			tags = {
				{
					name = "TODO",
					fg = "#6aa84f",
					bg = "",
					bold = true,
					virtual_text = "",
				},
				{
					name = "NOTE",
					fg = "#0a7aca",
					bg = "",
					bold = true,
					virtual_text = "",
				},
				{
					name = "WARNING",
					fg = "#FFA500",
					bg = "",
					bold = false,
					virtual_text = "",
				},
				{
					name = "!",
					fg = "#f44747",
					bg = "",
					bold = true,
					virtual_text = "",
				}

			}
		})
	end,
}

