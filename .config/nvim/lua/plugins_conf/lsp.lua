-- C
require('lspconfig').clangd.setup {}

-- Python
-- require('lspconfig').pylsp.setup{}
require('lspconfig').pyright.setup {}

-- YAML
require('lspconfig').yamlls.setup {}

-- Lua
require('lspconfig').lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

------------------------------------------

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    source = "if_many", -- Or "if_many"
    --prefix = '●', -- Could be '■', '▎', 'x'
  },
  float = {
    source = true, -- Or "if_many"
  },
})

-- LSP keymaps cheatsheet
-- K - Show info on hover
-- ]d and [d to move to next/previous diagnostic
-- <C-X><C-O> for completion (omni mode)
-- <C-]> go to tag
-- LSP keymaps
vim.keymap.set('n', 'ds', vim.diagnostic.open_float)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help)

-- Format is done in conform:
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end)
