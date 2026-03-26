require("toggleterm").setup ({
    
    direction = 'float',
    float_opts = {
    border = 'curved',
    },
})

local Terminal = require('toggleterm.terminal').Terminal

-- Create a dedicated terminal for Gemini
local gemini_terminal = Terminal:new({
  cmd = "gemini", -- Or the specific command you use to start it
  id = 100,
})

-- This forces Ctrl+\ to ONLY ever touch Terminal 1 (your shell)
vim.keymap.set('n', '<C-\\>', '<Cmd>1ToggleTerm<CR>', { desc = "Toggle Shell" })

-- Define the new shortcut (using <leader>g as an example)
vim.keymap.set('n', '<leader>g', function()
  gemini_terminal:toggle()
end, { desc = "Toggle Gemini Terminal" })
