if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set autoindent
set tabstop=4 shiftwidth=4 expandtab
set smartindent

set ruler
set undolevels=1000

" Line number configuration
set number relativenumber " hybrid

" disable --INSERT-- (powered by lightline)
set noshowmode

"highlights matching brace
set showmatch

"highlights search results
set hlsearch

" allow by default the copy/paste using clipboard
set clipboard=unnamedplus

" folder to put all the swp files in one place
set directory^=$HOME/.vim/swp//

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" For Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Better C++ highlighting
Plug 'bfrg/vim-cpp-modern'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Colorscheme switcher
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

" Colorschemes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" lightline plugin (replaces Powerline)
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()

" Colorscheme configuration (must be after plug so hybrid can be found)
set background=dark
colorscheme base16-chalk

" -------------------------------- KEYBOARD MAPPINGS
" Remapping Leader
let mapleader = "\<Space>"

" NERDTree shortcuts
" Ctrl + d for NerdTree toggling
nmap <silent> <C-d> :NERDTreeToggle<CR>

" Use jj instead of Esc to go to normal mode
imap jj <Esc>
" -------------------------------- KEYBOARD MAPPINGS END

" lightline plugin conf
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

set t_Co=256

" ------------------------------- RUST ANALYZER CONFIGURATION
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
            \ }
