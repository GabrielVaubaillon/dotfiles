-- Use nvim colors
-- TODO: get working with transparency
-- vim.opt.termguicolors = true

-- Line numbers, relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Alway insert signcolumn (git + - ~ column)
-- TODO: get working with transparency
-- vim.opt.signcolumn = 'yes'

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

-- Autocmd
----------

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
    group = vim. api.nvim_create_augroup("vertical_help", { clear = true }),
    pattern = "help",
    callback = function()
        vim.bo.bufhidden = "unload"
        vim.cmd.wincmd("L")
        vim.cmd.wincmd("=")
    end,
})

-- Activate wrapping and spellcheck in txt and md files
-- NOTE: was not working when tesing. please dig further
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     group = vim. api.nvim_create_augroup("edit_text", { clear = true }),
--     pattern = { "markdown", "txt" },
--     desc = "Enable spell checking and text wrapping for certain filetypes",
--     callback = function()
--         vim.opt_local.wrap = true
--         vim.opt_local.spell = true
--     end,
-- })

-- Keybindings
--------------

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

-- use H and L for start and end of line
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'H', '_')
vim.keymap.set('v', 'L', '$')

-- Move selected text up/down with Alt+{jk}
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

