require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "python",
        "lua",
        "markdown",
        "yaml",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "html",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
