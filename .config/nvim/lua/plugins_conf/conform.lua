require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {
    black = {
      prepend_args = {
        "--line-length=100"
      }
    }
  }
})


vim.keymap.set('n', '<leader>f', require("conform").format)
