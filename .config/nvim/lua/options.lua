-- Use nvim colors
vim.opt.termguicolors = true

-- Line numbers, relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Always insert signcolumn (git + - ~ column)
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

-- color column at 100 characters
vim.opt.colorcolumn = '100'

-- spell checking
vim.opt.spell = false
vim.opt.spelllang = { 'en', 'fr' }
vim.opt.spellsuggest = { 'best', 5 }

-- better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- View substitution live
vim.opt.inccommand = 'split'

-- Show current line
vim.opt.cursorline = true

-- Don't show mode (already in my status bar)
vim.opt.showmode = false

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
vim.opt.completeopt = { 'menuone', 'preview', 'noselect' }
