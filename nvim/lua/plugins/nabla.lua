local status, nabla = pcall(require, "nabla")
if not status then
  return
end

-- Keymaps for live math preview
-- <leader>mp: Floating popup of the equation at cursor
-- <leader>mv: Toggle live inline preview (virtual lines)
vim.keymap.set("n", "<leader>mp", function()
  nabla.popup({ border = "rounded" })
end, { desc = "Math Preview: Popup equation at cursor" })

vim.keymap.set("n", "<leader>mv", function()
  nabla.toggle_virt({ autogen = true, silent = true })
end, { desc = "Math Preview: Toggle inline live preview" })
