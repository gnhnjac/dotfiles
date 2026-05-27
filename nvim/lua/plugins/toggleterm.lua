require("toggleterm").setup ({
    
    direction = 'float',
    float_opts = {
    border = 'curved',
    },
})

local Terminal = require('toggleterm.terminal').Terminal

-- Create a dedicated terminal for Antigravity
local antigravity_terminal = Terminal:new({
  cmd = "agy", -- Official Antigravity CLI command
  id = 100,
  on_open = function(term)
    vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = term.bufnr })
    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { buffer = term.bufnr })
  end,
})

-- This forces Ctrl+\ to ONLY ever touch Terminal 1 (your shell)
vim.keymap.set('n', '<C-\\>', '<Cmd>1ToggleTerm<CR>', { desc = "Toggle Shell" })

-- Define the new shortcut (using <leader>g for Antigravity)
vim.keymap.set('n', '<leader>g', function()
  antigravity_terminal:toggle()
end, { desc = "Toggle Antigravity Terminal" })
