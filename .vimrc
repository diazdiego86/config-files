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

" highlights the current line when INSERT mode
autocmd InsertEnter,InsertLeave * set cul!

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

" Remapping the split/pane nagivation keys (replace Ctrl+w+j by Ctrl+j)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

"Max out the height of the current split:                               ctrl + w _
"Max out the width of the current split:                                ctrl + w |
"Normalize all split sizes, which is very handy when resizing terminal: ctrl + w =
"Swap top/bottom or left/right split:                                   Ctrl+W R
"Break out current window into a new tabview:                           Ctrl+W T
"Close every window in the current tabview but the current one:         Ctrl+W o

" Plug start
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
" Plug 'dense-analysis/ale'

" Better C++ highlighting
Plug 'bfrg/vim-cpp-modern'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Colorscheme switcher
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

" Vim polyglot for better syntax highlighting
Plug 'sheerun/vim-polyglot'

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
colorscheme base16-default-dark

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
" let g:ale_linters = {'rust': ['analyzer']}

" ------------------------------- MUComplete settings
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c "Shut off completion messages
set belloff+=ctrlg "If vim beeps during completion
