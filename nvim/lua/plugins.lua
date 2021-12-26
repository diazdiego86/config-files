-- PLUGINS

local Plug = vim.fn['plug#']

-- Specify a directory for plugins
vim.call('plug#begin', vim.fn.stdpath('config') .. '/plugged')

-- Make sure you use single quotes

-- Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

-- Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

-- On-demand loading
Plug ('scrooloose/nerdtree', { on =  'NERDTreeToggle' })

-- Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'

-- lightline plugin (replaces Powerline)
Plug 'itchyny/lightline.vim'

-- Comment blocks of code
Plug 'numToStr/Comment.nvim'

-- Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'nlknguyen/papercolor-theme'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'bluz71/vim-moonfly-colors'

-- Barbar plugin to show the buffers listed as tabs
Plug 'kyazdani42/nvim-web-devicons' -- this is required for barbar as a dependency (vim-plug dependencies?)
Plug 'romgrk/barbar.nvim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin.
Plug 'hrsh7th/cmp-nvim-lsp'

-- Initialize plugin system
vim.call('plug#end')

-- setup for Comments plugin
require('Comment').setup()
-- Use Ctrl + / to toggle comment line (using comment plugin 'gcc')
vim.api.nvim_set_keymap('n', '<C-_>', "gcc", { noremap = true, silent = true }) -- <C-_> is Ctrl + /. To get its value do -> :map Ctrl V Ctrl /

-- NERDTree shortcuts
vim.api.nvim_set_keymap('n', '<M-d>', ":NERDTreeToggle<CR>", { noremap = true, silent = true }) -- Alt + d for NerdTree toggling

-- Rainbow Parentheses
vim.g['rainbow#max_level'] = 16
vim.g['rainbow#pairs'] = {{'(', ')'}, {'[', ']'}, {'{', '}'}}

-- * Activation based on file type
vim.api.nvim_exec(
  [[
  augroup rainbow_lisp
    autocmd!
    autocmd FileType cpp,rust,lua RainbowParentheses
  augroup END
]],
  false
)


