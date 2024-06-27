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
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '%', '%zz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', '[c', '[czz')
vim.keymap.set('n', ']c', ']czz')

-- Move between windows without <C-W>
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- Move selected text up/down with Alt+{jk}
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Move to the last visited buffer
vim.keymap.set('n', '<Leader>b', ":b#<Enter>")

-- Easy move to buffers (show opened buffers when gb)
vim.keymap.set('n', 'gb', ":ls<Enter>:b ")

-- System clipboard copy paste with leader
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p')
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>P', '"+P') -- (uppercase)

-- Activate Diff quicly
vim.keymap.set('n', '<leader>dt', ':diffthis<Enter>')
vim.keymap.set('n', '<leader>do', ':diffoff<Enter>')

-- toggle spell checking
vim.keymap.set('n', '<leader>s', ':set spell!<Enter>')

-- toggle wrap
vim.keymap.set('n', '<leader>w', ':set wrap!<Enter>')

-- toggle whitespace
vim.keymap.set('n', '<leader>l', ':set list!<Enter>')

-- PLUGINS REMAPS
-----------------

-- UndoTree
vim.keymap.set('n', '<A-u>', ':UndotreeToggle<Enter>')

-- Comment (keymaps are in plugin conf (nvim/lua/plugins_conf/comment.lua))
-- '<Leader>/' for toggle comment
-- '<Leader>?' for toggle block comment

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Gitsigns
-- move between chunks
vim.keymap.set('n', '<leader>]c', ':Gitsigns next_hunk<Enter>')
vim.keymap.set('n', '<leader>[c', ':Gitsigns prev_hunk<Enter>')
vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<Enter>')
vim.keymap.set('n', '<leader>hu', ':Gitsigns reset_hunk<Enter>')
