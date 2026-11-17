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

-- Do not automatically pop open quickfix on minor warnings (e.g. font warnings, underfull hbox)
-- Quickfix will only open on actual errors
vim.g.vimtex_quickfix_open_on_warning = 0

-- Keymaps (VimTeX default is <localleader>ll, which is \ll by default)
-- Also bind <leader> shortcuts for convenience
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "VimTeX: Toggle continuous compilation" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "VimTeX: Forward search to cursor in Zathura" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "VimTeX: Clean auxiliary files" })
