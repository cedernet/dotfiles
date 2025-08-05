vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.php",
	callback = function()
		local file = vim.fn.expand("%")
		local root = vim.fn.finddir(".git/..", ".;") or vim.fn.getcwd()
		local config_path = root .. "/.php-cs-fixer.php"

		if vim.fn.filereadable(config_path) == 0 then
			return
		end

		vim.fn.jobstart({ "php-cs-fixer", "fix", "--quiet", file }, {
			cwd = root,
			on_exit = function(_, code, _)
				if code == 0 then
					vim.cmd("edit!")
				else
					vim.notify("php-cs-fixer failed", vim.log.levels.ERROR)
				end
			end,
		})
	end,
})

vim.api.nvim_create_user_command("Phpfix", function()
	local file = vim.fn.expand("%")
	local root = vim.fn.finddir(".git/..", ".;") or vim.fn.getcwd()
	local config_path = root .. "/.php-cs-fixer.php"

	-- Check if config file exists
	if vim.fn.filereadable(config_path) == 0 then
		vim.notify("No .php-cs-fixer.php found — skipping format", vim.log.levels.WARN)
		return
	end

	vim.cmd("write") -- Save buffer
	vim.fn.jobstart({ "php-cs-fixer", "fix", "--quiet", file }, {
		cwd = root,
		on_exit = function(_, code, _)
			if code == 0 then
				vim.cmd("edit!") -- Reload file if changed
			else
				vim.notify("php-cs-fixer failed", vim.log.levels.ERROR)
			end
		end,
	})
end, {})
