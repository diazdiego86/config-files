set termguicolors
set number
" disable --INSERT-- (powered by Powerline already)
set noshowmode

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

" Colorschemes
Plug 'kristijanhusak/vim-hybrid-material'

" Initialize plugin system
call plug#end()

" Colorscheme configuration (must be after plug so hybrid can be found)
set background=dark
colorscheme hybrid_reverse

" NERDTree shortcuts
" Ctrl + d for NerdTree toggling
nmap <silent> <C-d> :NERDTreeToggle<CR>

" NERDTree opened by default
" au VimEnter *  NERDTree
"
" Powerline plugin
set rtp+=/home/dadiaz/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
