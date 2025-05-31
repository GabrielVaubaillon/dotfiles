-- NVIM config
-- by Gabriel Vaubaillon

-- I try to have as much as my config from native
-- vim-nvim features. This file should be easy to modify
-- to work without any plugin.
-- check vanilla keyword in comments for no-plugin setup
-- comment the prose line if cannot download spellings

-- TODO
--  - netrw
--  - experiment with and without line numbers
--  - marks in sign colum
--  - status line theme. fix not visible enough
--  - pylint/ruff/mypy in quickfix window. NO PLUGIN
--  - check sidescrolloff
--  - custom ruler for ^G ?

-- OPTIONS
----------

-- Use nvim colors
vim.opt.termguicolors = true

-- status line -- uncomment for vanilla
-- vim.opt.statusline = "%h %<%.20f%m%r%=%(%y[%{&fenc==''?&enc:&fenc}][%l:%c]%)"

-- Show mode - may be set to false with some status lines
vim.opt.showmode = true

-- Line numbers, relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Always insert signcolumn -- comment for vanilla
vim.opt.signcolumn = 'yes:1'

-- decrease update time to 200ms
vim.opt.updatetime = 50

-- Mouse mode
vim.opt.mouse = 'a'

-- Case-insensitive unless \C
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Hide/Show blank characters
vim.opt.list = false
vim.opt.listchars = {
    --showbreak= '↪',
    tab = '→ ',
    space = '·',
    trail = '•',
    eol = '¶',
    precedes = '«',
    extends = '»',
    nbsp = '×'
}

-- Set tabs as 4 space by default
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 0

-- wrapped lines continue with same indent
vim.opt.breakindent = true

-- enable auto indenting
vim.opt.smartindent = true

-- disable text wrap
vim.opt.wrap = false

-- show character limit
vim.opt.colorcolumn = '100'

-- View substitution live
vim.opt.inccommand = 'split'

-- Show current line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- jump to match immediately when searching
vim.opt.incsearch = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- When splitting, keep the old window left (vertical), up (horizontal)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Autocompletion options
vim.opt.completeopt = { 'menuone', 'preview' }

-- diff options
vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60"
-- vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60,algorithm:histogram"
-- vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60,algorithm:histogram,indent-heuristic"

-- KEYMAPS
----------

-- leader key
vim.keymap.set('n', '<Space>', '<NOP>')
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keep the buffer centered when jumping around
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

-- Activate Diff quickly
vim.keymap.set('n', '<leader>dt', ':diffthis<Enter>')
vim.keymap.set('n', '<leader>do', ':diffoff<Enter>')

-- toggle wrap
vim.keymap.set('n', '<leader>w', ':set wrap!<Enter>')

-- toggle whitespace
vim.keymap.set('n', '<leader>l', ':set list!<Enter>')

-- toggle line numbers
vim.keymap.set('n', '<leader>n', ':set nu! rnu!<Enter>')

-- quickfix
vim.keymap.set('n', '<leader>q', ':copen<Enter>') -- try ':botright copen' if issues
vim.keymap.set('n', '<leader>Q', ':cclose<Enter>')
vim.keymap.set('n', ']q', ':cnext<Enter>zz')
vim.keymap.set('n', '[q', ':cprevious<Enter>zz')

-- todo and fixme in quickfix
-- TODO: decide if want copen
vim.keymap.set('n', '<leader>tt', ':vimgrep /\\CTODO\\|FIXME/ %<Enter>')
vim.keymap.set('n', '<leader>ta', ':vimgrep /\\CTODO\\|FIXME/ **<Enter>')

-- search in project
vim.keymap.set('n', '<leader>sf', ':vimgrep // **/*<left><left><left><left><left><left>')

-- AUTOCOMMANDS
---------------

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Keep windows ratio when resizing
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto-resize windows on terminal buffer resize',
  group = vim.api.nvim_create_augroup("WinResize", { clear = true }),
  pattern = "*",
  command = "wincmd =",
})

-- Load help vertical window rather than horizontal
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd("L")
    vim.cmd.wincmd("=")
  end,
})

-- Automatically delete trailing space at save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup("delete_trailing_space", { clear = true }),
  pattern = "*",
  callback = function()
    -- Save cursor position to restore later
    local curpos = vim.api.nvim_win_get_cursor(0)
    -- Search and replace trailing whitespaces
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, curpos)
  end,
})

-- Spell checking and not code specific config
require("prose")

-- Load all plugins -- comment for vanilla
require("plugins")
