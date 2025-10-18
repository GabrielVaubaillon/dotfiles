-- Using lazy plugin manager (https://github.com/folke/lazy.nvim)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins list
require("lazy").setup({
  -- better visual status line
  "nvim-lualine/lualine.nvim",
  -- better theming
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- syntax highlighting (and other sweet things around understanding syntax)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- visual indications on git-modified files
  "lewis6991/gitsigns.nvim",
  -- access the nvim undotree, never lose work
  "mbbill/undotree",
  -- Language Servers config
  "neovim/nvim-lspconfig",
  -- Auto-format
  "stevearc/conform.nvim",
  -- Auto detect indent of current file
  "Darazaki/indent-o-matic",
  -- Toggle comments with a keybinding
  "numToStr/Comment.nvim",
  -- Preview Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
})

-- plugins config
require("plugins_conf.colors") -- theme first
require("plugins_conf.lualine")
require("plugins_conf.treesitter")
require("plugins_conf.comment")
require("plugins_conf.gitsigns")
require("plugins_conf.undotree")
require("plugins_conf.lsp")
require("plugins_conf.conform")
require("plugins_conf.indent-o-matic")
