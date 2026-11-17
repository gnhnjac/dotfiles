-- VimTeX configuration
-- Optimized for WSL and Hebrew support

-- Use Zathura as the PDF viewer
-- Zathura runs natively in WSL (requires an X server like WSLg or VcXsrv)
vim.g.vimtex_view_method = 'zathura'

-- Compiler settings
-- For Hebrew, you should use xelatex or lualatex
-- We'll configure latexmk to use xelatex by default for better RTL support
vim.g.vimtex_compiler_latexmk = {
    options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-xelatex', -- Switch to xelatex for Hebrew support
    },
}

-- Enable folding
vim.g.vimtex_fold_enabled = 1

-- TOC settings
vim.g.vimtex_toc_config = {
  split_width = 30,
  show_help = 0,
}

-- Ensure syntax highlighting is enabled for LaTeX
vim.g.vimtex_syntax_enabled = 1

-- Syntax Conceal settings (renders math symbols visually with Unicode)
vim.g.vimtex_syntax_conceal = {
  accents = 1,
  ligatures = 1,
  cites = 1,
  fancy = 1,
  spacing = 1,
  greek = 1,
  math_bounds = 0,     -- Keep $ and $$ visible so math delimiters remain clear
  math_delimiters = 1, -- \left( \right) -> ( )
  math_fracs = 1,      -- fractions
  math_super_sub = 1,  -- x^2 -> x², x_i -> xᵢ
  math_symbols = 1,    -- \sum -> ∑, \int -> ∫, \infty -> ∞, \in -> ∈
  sections = 0,
  styles = 1,          -- bold, italic styles
}

-- Enable conceal level 2 for LaTeX buffers
-- concealcursor is empty so the raw LaTeX expands on the line under the cursor for easy editing
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex", "plaintex" },
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = ""
  end,
})

-- Toggle conceal keymap (<leader>tc)
vim.keymap.set("n", "<leader>tc", function()
  if vim.opt_local.conceallevel:get() == 0 then
    vim.opt_local.conceallevel = 2
    print("LaTeX Conceal: Enabled (Level 2)")
  else
    vim.opt_local.conceallevel = 0
    print("LaTeX Conceal: Disabled (Raw LaTeX)")
  end
end, { desc = "Toggle LaTeX Conceal mode" })

-- Do not automatically pop open quickfix on minor warnings (e.g. font warnings, underfull hbox)
-- Quickfix will only open on actual errors
vim.g.vimtex_quickfix_open_on_warning = 0

-- Keymaps (VimTeX default is <localleader>ll, which is \ll by default)
-- Also bind <leader> shortcuts for convenience
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "VimTeX: Toggle continuous compilation" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "VimTeX: Forward search to cursor in Zathura" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "VimTeX: Clean auxiliary files" })
