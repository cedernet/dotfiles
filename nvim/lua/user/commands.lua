---------------------------------------------------------------
-- Parse Leena's lists
---------------------------------------------------------------
vim.api.nvim_create_user_command(
	"Leenalle",
	function ()
		vim.cmd("silent %s/\\d)/\r- /g")
		vim.cmd("silent %s/-  /- /g")
		vim.cmd("silent %s/\\s\\+$//ge")
		vim.cmd("normal! ggdd")
	end,
	{}
)

