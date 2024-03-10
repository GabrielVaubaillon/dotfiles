-- Use nvim colors
vim.opt.termguicolors = true

-- Line numbers, relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Alway insert signcolumn (git + - ~ column)
vim.opt.signcolumn = 'yes'

-- decrease update time to 200ms
-- vim.opt.updatetime = 50

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

-- Set tabs as 4 space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- wraped lines continue with same indent
vim.opt.breakindent = true

-- enable auto indenting
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- disable text wrap
vim.opt.wrap = false

-- better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- View substitution live
vim.opt.inccommand = 'split'

-- Show current line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Color a column
-- TODO: get working with transparency
-- vim.opt.colorcolumn = "80"

-- jump to match immediatly when searching
vim.opt.incsearch = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Autocompletion options
vim.opt.completeopt = { 'menuone', 'preview', 'noselect' }
