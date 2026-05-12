-- Plugin installation using vim-plug inside Lua

vim.cmd [[
  call plug#begin()

  Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': 'master' }
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'

  Plug 'ray-x/lsp_signature.nvim'

  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

  Plug 'stevearc/dressing.nvim'

  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'yamatsum/nvim-cursorline'
  Plug 'lervag/vimtex'
  call plug#end()
]]

-- After plugins are loaded, require plugin configs
require("plugins.lsp")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.lsp_signature")
require("plugins.toggleterm")
require("plugins.treesitter")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.cursorline")
require("plugins.vimtex")

