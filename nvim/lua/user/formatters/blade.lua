vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.blade.php",
	callback = function()
		local file = vim.fn.expand("%")
		local root = vim.fn.finddir(".git/..", ".;") or vim.fn.getcwd()

		vim.fn.jobstart({ "blade-formatter", "--write", file }, {
			cwd = root,
			on_exit = function(_, code, _)
				if code == 0 then
					vim.cmd("edit!")
				else
					vim.notify("blade-formatter failed", vim.log.levels.ERROR)
				end
			end,
		})
	end,
})

vim.api.nvim_create_user_command("Bladefix", function()
	local file = vim.fn.expand("%")
	local root = vim.fn.finddir(".git/..", ".;") or vim.fn.getcwd()

	vim.cmd("write") -- Save buffer
	vim.fn.jobstart({ "blade-formatter", "--wrap", "100", "--write", file }, {
		cwd = root,
		on_exit = function(_, code, _)
			if code == 0 then
				vim.cmd("edit!") -- Reload file if changed
			else
				vim.notify("blade-formatter", vim.log.levels.ERROR)
			end
		end,
	})
end, {})
