
-- leader key
vim.keymap.set('n', '<Space>', '<NOP>')
vim.g.mapleader = " " 
vim.g.maplocalleader = "\\"

-- Keep the buffer centered
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', '<C-i', '<C-izz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '%', '%zz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

-- Move selected text up/down with Alt+{jk}
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- PLUGINS REMAPS
-----------------

-- Gitsigns
-- move between chunks
vim.keymap.set('n', '<leader>]c', ':Gitsigns next_hunk<Enter>')
vim.keymap.set('n', '<leader>[c', ':Gitsigns prev_hunk<Enter>')
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<Enter>')
vim.keymap.set('n', '<leader>hu', ':Gitsigns reset_hunk<Enter>')

