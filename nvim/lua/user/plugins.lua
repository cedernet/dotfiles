local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{
		-- Monokai-pro theme
		{ import = 'user.plugins.monokai-pro' },
		-- Bamboo theme
		{ import = 'user.plugins.bamboo' },
		-- Add, change, and delete surrounding text.
		-- https://github.com/tpope/vim-surround
		{ 'tpope/vim-surround' },
		-- Allow plugins to enable repeating of commands.
		{ 'tpope/vim-repeat' },
		-- Jump to the last location when opening a file.
		{ 'farmergreg/vim-lastplace' },
		-- Automatically set the working directory to the project root.
		{ import = 'user.plugins.vim-rooter' },
		-- Automatically add closing brackets, quotes, etc.
		{ 'windwp/nvim-autopairs', config = true },
		-- Add smooth scrolling to avoid jarring jumps
		{ import = 'user.plugins.neoscroll' },
		-- All closing buffers without closing the split window.
		{ import = 'user.plugins.bufdelete' },
		-- Split arrays and methods onto multiple lines, or join them back up.
		{ import = 'user.plugins.treesj' },
		-- Improved syntax highlighting
		{ import = 'user.plugins.treesitter' },
		-- Fuzzy finder
		{ import = 'user.plugins.telescope' },
		-- File tree
		{ import = 'user.plugins.neo-tree' },
		-- A Status line.
		{ import = 'user.plugins.lualine' },
		-- Display buffers as tabs.
		{ import = 'user.plugins.bufferline' },
		-- Display indentation lines.
		{ import = 'user.plugins.indent-blankline' },
		-- Add a dashboard.
		{ import = 'user.plugins.dashboard-nvim' },
		-- Git integration.
		{ import = 'user.plugins.gitsigns' },
		-- Git commands. https://github.com/tpope/vim-fugitive
		{ 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },
		-- Floating terminal.
		{ import = 'user.plugins.floaterm' },
		-- Completion
		{ import = 'user.plugins.cmp' },
		-- Language Server Protocol.
		{ import = 'user.plugins.lspconfig' },
		-- PHP Refactoring Tools
		{ import = 'user.plugins.phpactor' },
		-- Show overview of code on page
		{ import = 'user.plugins.aerial' },
		-- Sublime style multicursor
		{ import = 'user.plugins.multicursors' },
		-- PHP docblocks
		{ 'brett-griffin/phpdocblocks.vim' },
		-- Better comments
		{ import = 'user.plugins.todo-comments' },
		-- Easier to use marks/bookmarks
		{ import = 'user.plugins.marks' },
		-- ChatGPT integration
		{ import = 'user.plugins.chatgpt' },
		-- Markdown parsing
		{ import = 'user.plugins.markview' },
		-- Other monokai
		{ 'crusoexia/vim-monokai', event = 'VeryLazy' },
		-- Jump around the file
		{ import = 'user.plugins.flash' },
		-- TODO and notes
		{ import = 'user.plugins.lazydo' },
		-- Other ChatGPT
		-- { import = 'user.plugins.gp' },
		-- Testing a plugin
		-- {
		-- 	dir = '/Users/ebbec/dev/nvim/example.nvim',
		-- 	opts = {
		-- 		name = 'monkeybutt',
		-- 	},
		-- },
	},
	{
		checker = {
			enabled = true,
			notify = false,
		},
		change_detection = {
			notify = false,
		},
	}
)
