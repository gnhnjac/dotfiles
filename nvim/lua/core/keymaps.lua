local keymap = vim.keymap.set

-- ============================================================================
-- Vsnip
-- ============================================================================
vim.cmd([[
  imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
]])

-- ============================================================================
-- Window Management
-- ============================================================================
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- ============================================================================
-- Navigation
-- ============================================================================
keymap("n", "{", "{zz", { desc = "Move to previous paragraph and center" })
keymap("n", "}", "}zz", { desc = "Move to next paragraph and center" })

-- ============================================================================
-- Terminal
-- ============================================================================
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================================
-- Telescope
-- ============================================================================
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap("n", "<leader>fs", function()
  require("telescope.builtin").lsp_workspace_symbols()
end, { desc = "Search workspace symbols" })

