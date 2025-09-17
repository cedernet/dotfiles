-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quickly clear search highlighting.
vim.keymap.set('n', '<leader>cc', ':nohlsearch<cr>')

-- close tab.
vim.keymap.set('n', '<leader>q', ':bufdo bdelete<cr>')

-- reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'y', 'myy`y')

-- when text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('n', 'c', '"_c')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- Move text up and down
vim.keymap.set('i', '<C-Down>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<C-Up>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<C-Down>', ':move .+1<CR>==')
vim.keymap.set('n', '<C-Up>', ':move .-2<CR>==')
vim.keymap.set('v', '<C-Down>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-Up>', ":move '<-2<CR>gv=gv")

-- I don't have a US keyboard
vim.api.nvim_set_keymap('n', '<', '[', {})
vim.api.nvim_set_keymap('n', '>', ']', {})

-- Remove all trailing whitespace
vim.keymap.set('n', '<leader>å', ":%s/\\s\\+$//e<CR>")

-- Tab switching easier
vim.keymap.set('n', '<C-h>', ':bprevious<CR>')
vim.keymap.set('n', '<C-l>', ':bnext<CR>')

-- Jump over char in insert mode
vim.keymap.set('i', '<C-space>', '<right>')

-- Trying to avoid constantly undoing and deleting shit
vim.keymap.set('n', '<C-K>', '<C-U>');
vim.keymap.set('n', '<C-J>', '<C-D>');

-- Reindent entire file
-- markz z, goto top, line select, goto bottom, press =, goto z, del mark
vim.keymap.set('n', '<leader>=', 'mzggVG=`z<Esc>:delm z<CR>');

-- Open terminal
vim.api.nvim_set_keymap("n", "<leader>tt", ":split<CR>:terminal<CR>", { noremap = true, silent = true })

-- Close terminal
vim.api.nvim_set_keymap("t", "<leader>tw", "exit<CR><C-\\><C-n><C-w>h", { noremap = true, silent = true })

-- Easier exit from terminal
vim.keymap.set('t', '<C-w>h', "<C-\\><C-n><C-w>h", { silent = true })

-- Actually to be able to visit help links
-- <cword> contains the word under the cursor
vim.keymap.set('n', '<C-g>', function()
	local word = vim.fn.expand('<cword>')
	vim.cmd('tag ' .. word)
end)
