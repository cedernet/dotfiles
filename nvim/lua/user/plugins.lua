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

require("lazy").setup({
	-- Monokai-pro theme
	-- {
	-- 	'loctvl842/monokai-pro.nvim',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 		vim.cmd('colorscheme monokai-pro')
	-- 	end
	-- },
	-- Monokai theme
	{
		'ellisonleao/gruvbox.nvim',
		-- priority = 1000,
		config = function(plugin, opts)
			require("gruvbox").setup()
			-- vim.cmd('colorscheme gruvbox')
		end
	},
	{
		'sainnhe/gruvbox-material',
		priority = 1000,
		config = function(plugin, opts)
			-- require("gruvbox-material").setup()
			vim.cmd('colorscheme gruvbox-material')
		end
	},
	-- Color scheme
	{ import = 'user.plugins.tokyonight' },
	-- Commenting support.
	{ import = 'user.plugins.vim-commentary' },
	-- Add, change, and delete surrounding text.
	{ 'tpope/vim-surround' },
	-- Useful commands like :Rename and :SudoWrite.
	{ 'tpope/vim-eunuch' },
	-- Pairs of handy bracket mappings, like [b and ]b.
	{ 'tpope/vim-unimpaired', event = 'VeryLazy' },
	-- Allow plugins to enable repeating of commands.
	{ 'tpope/vim-repeat' },
	-- Navigate seamlessly between Vim windows and Tmux panes.
	{ 'christoomey/vim-tmux-navigator' },
	-- Jump to the last location when opening a file.
	{ 'farmergreg/vim-lastplace' },
	-- Enable * searching with visually selected text.
	{ 'nelstrom/vim-visual-star-search' },
	-- Automatically create parent dirs when saving.
	{ 'jessarcher/vim-heritage' },
	-- Text objects for HTML attributes.
	{ 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },
	-- Automatically set the working directory to the project root.
	{ import = 'user.plugins.vim-rooter' },
	-- Automatically add closing brackets, quotes, etc.
	{ 'windwp/nvim-autopairs', config = true },
	-- Add smooth scrolling to avoid jarring jumps
	{ 'karb94/neoscroll.nvim', config = true },
	-- All closing buffers without closing the split window.
	{ import = 'user.plugins.bufdelete' },
	-- Split arrays and methods onto multiple lines, or join them back up.
	{ import = 'user.plugins.treesj' },
	-- Automatically fix indentation when pasting code.
	-- TODO: Won't allow keymaps work with '_dp'. See if can be fixed.
	-- { import = 'user.plugins.vim-pasta' },
	-- Improved syntax highlighting
	{ import = 'user.plugins.treesitter' },
	-- Disable backgrounds to make vim transparent
	{ 'xiyaowong/transparent.nvim' },
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
	-- Git commands.
	{ 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },
	--- Floating terminal.
	{ import = 'user.plugins.floaterm' },
	-- Completion
	{ import = 'user.plugins.cmp' },
	-- Language Server Protocol.
	{ import = 'user.plugins.lspconfig' },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = {
			"monokai",
			"tokyonight",
			"habamax",
		},
	},
})
