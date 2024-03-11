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
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('n', 'c', '"_c')
-- vim.keymap.set('v', 'p', '"0p')
-- vim.keymap.set('v', 'P', '"0P')
-- vim.keymap.set('v', 'y', '"0y')
-- vim.keymap.set('v', 'd', '"0d')

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

-- I don't have a US keyboard
vim.api.nvim_set_keymap('n', '<', '[', {})
vim.api.nvim_set_keymap('n', '>', ']', {})

-- Remove all trailing whitespace
vim.keymap.set('n', '<leader>å', ":%s/\\s\\+$//e<CR>")

-- Tab switching easier
vim.keymap.set('n', '<C-h>', ':bprevious<CR>')
vim.keymap.set('n', '<C-l>', ':bnext<CR>')

-- Pane switching easier
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')

-- Jump over char in insert mode
vim.keymap.set('i', '<C-space>', '<right>')

-- Remove windows line breaks
vim.keymap.set('n', '<leader>M', ':%s/^M//g<CR>');

