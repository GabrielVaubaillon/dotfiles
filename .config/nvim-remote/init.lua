-- NVIM config
-- by Gabriel Vaubaillon

-- OPTIONS
----------

-- Use nvim colors
vim.opt.termguicolors = true

-- Show mode - may be set to false with some status lines
vim.opt.showmode = true

-- Line numbers, relative line number
vim.opt.number = false
vim.opt.relativenumber = false

-- Sign column
vim.opt.signcolumn = 'auto' -- Only show if needed

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

-- Minimal number of screen columns when moving on lines bigger than screen
vim.opt.sidescrolloff = 5

-- jump to match immediately when searching
vim.opt.incsearch = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- do not search some files
vim.opt.wildignore = "*/__pycache__/*,*/venv/*,*/.venv/*"

-- When splitting, keep the old window left (vertical), up (horizontal)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Autocompletion options
vim.opt.completeopt = { 'menuone', 'preview', 'noselect' }

-- diff options
vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60"
-- vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60,algorithm:histogram"
-- vim.opt.diffopt = "internal,filler,closeoff,context:6,linematch:60,algorithm:histogram,indent-heuristic"

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0 -- (0:thin, 1:long, 2:wide, 3:tree)

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
vim.keymap.set('n', ']b', ':bnext<Enter>')
vim.keymap.set('n', '[b', ':bprevious<Enter>')

-- System clipboard copy paste with leader
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p')
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>P', '"+P') -- (uppercase)

-- Duplicate selection and comment out the first instance.
-- vim.keymap.set("n", "gcc", "yygcc", { remap = true })
vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- keep the flags when re-running substitute commands
vim.keymap.set("n", "&", ":&&<Enter>")
vim.keymap.set("x", "&", ":&&<Enter>")

-- Activate Diff quickly
vim.keymap.set('n', '<leader>dt', ':diffthis<Enter>')
vim.keymap.set('n', '<leader>do', ':diffoff<Enter>')

-- toggle wrap
vim.keymap.set('n', '<leader>tw', ':set wrap!<Enter>')

-- toggle whitespace
vim.keymap.set('n', '<leader>tl', ':set list!<Enter>')

-- toggle line numbers
vim.keymap.set('n', '<leader>tn', ':set nu! rnu!<Enter>')

-- toggle line numbers
vim.keymap.set('n', '<leader>cc', ':set cc+=53<Enter>')
vim.keymap.set('n', '<leader>CC', ':set cc-=53<Enter>')

-- make
vim.keymap.set('n', '<leader>mf', ':make %<Enter>')
vim.keymap.set('n', '<leader>mp', ':make .<Enter>')

-- quickfix
vim.keymap.set('n', '<leader>q', ':copen<Enter>') -- try ':botright copen' if issues
vim.keymap.set('n', '<leader>Q', ':cclose<Enter>')
vim.keymap.set('n', ']q', ':cnext<Enter>zz')
vim.keymap.set('n', '[q', ':cprevious<Enter>zz')

-- todo and fixme in quickfix
vim.keymap.set('n', '<leader>st', ':vimgrep /\\CTODO\\|FIXME/ %<Enter>')
vim.keymap.set('n', '<leader>sa', ':vimgrep /\\CTODO\\|FIXME/ **<Enter>')

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

-- THEME
--------
vim.opt.statusline = "%h %<%f%m%r %=%(%y[%{&fenc==''?&enc:&fenc}][%l:%c]%)"
vim.cmd.colorscheme "mocha_custom"
vim.opt.background = "dark"

