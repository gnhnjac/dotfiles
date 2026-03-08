local keymap = vim.keymap.set

vim.cmd([[
  imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
]])

-- LSP keymaps for clangd are set inside lsp.lua on_attach

-- Telescope keybindings
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Search symbols in current file
keymap('n', '<leader>fs', function()
  require('telescope.builtin').lsp_workspace_symbols()
end)

-- Terminal mode escape
keymap('t', '<Esc>', '<C-\\><C-n>')

-- Regular keybindings
keymap('n', '{', '{zz')
keymap('n', '}', '}zz')

-- Grouping CodeCompanion under <leader>a (for AI/Assistant)

-- Open the AI Actions menu (Explaining code, writing tests, etc.)
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

-- Toggle the AI Chat buffer
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

-- Trigger inline AI prompt (e.g., "refactor this function")
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })

-- Send visually selected text to the chat buffer
vim.keymap.set("v", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
