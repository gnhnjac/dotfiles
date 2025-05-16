local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup {
  cmd = { "clangd", "--clang-tidy", "--background-index" },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    local keymap = vim.keymap.set
    local opts = { buffer = bufnr }

    keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap('n', 'gd', vim.lsp.buf.definition, opts)
    keymap('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap('n', 'K', vim.lsp.buf.hover, opts)
    keymap('n', 'gr', vim.lsp.buf.references, opts)
    keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
    keymap('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap('n', ']d', vim.diagnostic.goto_next, opts)
  end,
}
