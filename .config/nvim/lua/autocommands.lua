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
