local opt = vim.opt

opt.ts = 4
opt.sw = 4

opt.number = true
opt.relativenumber = true
opt.hlsearch = false

vim.o.updatetime = 400
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
