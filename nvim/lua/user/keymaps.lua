-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quickly clear search highlighting.
vim.keymap.set('n', '<leader>k', ':nohlsearch<cr>')

-- close all open buffers.
vim.keymap.set('n', '<leader>q', ':bufdo bdelete<cr>')

-- allow gf to open non-existent files.
vim.keymap.set('', 'gf', ':edit <cfile><cr>')

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
-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<leader>x', ':!open %<cr><cr>')

-- Disable annoying command line thing.
vim.keymap.set('n', 'q:', ':q<CR>')

-- Move text up and down
vim.keymap.set('i', '<C-Down>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<C-Up>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<C-Down>', ':move .+1<CR>==')
vim.keymap.set('n', '<C-Up>', ':move .-2<CR>==')
vim.keymap.set('v', '<C-Down>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-Up>', ":move '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('n', '<', '[', {})
vim.api.nvim_set_keymap('n', '>', ']', {})
-- vim.keymap.set('o', '<', '[')
-- vim.keymap.set('o', '>', ']')
-- vim.keymap.set('x', '<', '[')
-- vim.keymap.set('x', '<', '[')

