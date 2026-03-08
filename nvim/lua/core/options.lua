local opt = vim.opt

opt.ts = 4
opt.sw = 4
opt.expandtab = true

opt.number = true
opt.relativenumber = true
opt.hlsearch = false

vim.o.updatetime = 400
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end })

vim.opt.showmode = false

require("tokyonight").setup({
  styles = {
    keywords = { italic = true },   -- This makes 'self', 'if', 'return' cursive
    functions = { italic = true },  -- This makes function names cursive
    variables = { italic = false }, -- Keep these normal for readability
    comments = { italic = true },    -- Makes your notes look elegant
  },
})

vim.cmd[[colorscheme tokyonight-night]]
