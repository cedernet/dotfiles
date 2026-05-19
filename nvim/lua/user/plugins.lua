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
		-- Gruvbox-material theme
		{ import = 'user.plugins.gruvbox-material' },
		-- Good light theme for general writing parchment-manuscript
		{ import = 'user.plugins.parchment'},
		-- Theme like gruvbox, but more contrast
		{ import = 'user.plugins.bamboo'},
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
		-- { import = 'user.plugins.treesitter' },
		{ import = 'user.plugins.treesitter-min' },
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
		-- Utilize my snippets in nvim/snippets
		{ import = 'user.plugins.luasnip' },
		-- Code completion
		{ import = 'user.plugins.blink' },
		-- Language Server Protocol.
		{ import = 'user.plugins.lspconfig' },
		-- PHP Refactoring Tools
		-- { import = 'user.plugins.phpactor' },
		-- Show overview of code on page
		{ import = 'user.plugins.aerial' },
		-- Better comments
		{ import = 'user.plugins.todo-comments' },
		-- Easier to use marks/bookmarks
		{ import = 'user.plugins.marks' },
		-- Jump around the file
		{ import = 'user.plugins.flash' },
		-- Generate docblocks
		-- 26-05-03: Disabled, because doesn't support new treesitter. Check later
		{ import = 'user.plugins.neogen'},
		-- Virtual comments
		{ import = 'user.plugins.haunt' },
		-- Arduino IDE
		{ import = 'user.plugins.arduino' },
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
