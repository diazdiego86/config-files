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
set number
" disable --INSERT-- (powered by Powerline already)
set noshowmode

"highlights matching brace
set showmatch

"highlights search results
set hlsearch

" allow by default the copy/paste using clipboard
set clipboard=unnamedplus

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

" Better C++ highlighting
Plug 'bfrg/vim-cpp-modern'

" Colorscheme switcher
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

" Colorschemes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

" Colorscheme configuration (must be after plug so hybrid can be found)
set background=dark
colorscheme base16-oceanicnext

" NERDTree shortcuts
" Ctrl + d for NerdTree toggling
nmap <silent> <C-d> :NERDTreeToggle<CR>

" Fix the Ctrl+left/right shortcuts
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" NERDTree opened by default
" au VimEnter *  NERDTree
"
" Powerline plugin
set rtp+=/home/dadiaz/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
