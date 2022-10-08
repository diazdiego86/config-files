-- PLUGINS

local Plug = vim.fn['plug#']

-- Specify a directory for plugins
vim.call('plug#begin', vim.fn.stdpath('config') .. '/plugged')

-- Make sure you use single quotes

-- Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

-- Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

-- Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

-- Telescope with fzf
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
Plug ('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })

-- Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'

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

-- Nvim Tree-sitter
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Guess Indent
Plug 'nmac427/guess-indent.nvim'

-- Initialize plugin system
vim.call('plug#end')

-- setup for Comments plugin
require('Comment').setup()
-- Use Ctrl + / to toggle comment line (using comment plugin 'gcc')
vim.api.nvim_set_keymap('n', '<C-_>', "gcc", { noremap = true, silent = true }) -- <C-_> is Ctrl + /. To get its value do -> :map Ctrl V Ctrl /

-- Nvim Tree Setup
require('telescope').load_extension('fzf')

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Nvim Tree Sitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "rust", "python", "c", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Guess Indent
require('guess-indent').setup{}

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


