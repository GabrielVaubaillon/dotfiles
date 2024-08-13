
-- spell checking
vim.opt.spell = false
vim.opt.spelllang = { 'en', 'fr' }
vim.opt.spellsuggest = { 'best', 5 }
--
-- Activate wrapping and spellcheck in txt and md files
-- NOTE: was not working when testing. please dig further
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
--   pattern = { "markdown", "txt" },
--   desc = "Enable spell checking and text wrapping for certain filetypes",
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--   end,
-- })

-- toggle spell checking
vim.keymap.set('n', '<leader>s', ':set spell!<Enter>')
