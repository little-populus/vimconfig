syntax on
filetype on
filetype plugin on

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-plug', { 'on': 'vim-plug' }
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }
Plug 'chriskempson/base16-vim'
Plug 'altercation/solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'yianwillis/vimcdoc'
Plug 'tpope/vim-fugitive'
call plug#end()

set cursorline
set encoding=utf-8
set number
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set directory=~/.vim/swap/
set foldmethod=syntax " 有多种选项，python使用indent，c/cpp通常使用syntax，还有manual，expr，marker，diff等
set foldcolumn=1
set wildmenu
set wildmode=list:longest,full
set hlsearch " 设置查找高亮
set incsearch
set clipboard=unnamed,unnamedplus " 将剪切板设置为这两个寄存器，分别作用于Mac，Windows和Linux
set ambiwidth=double

colorscheme codedark

" 用来切换不同的窗口
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

nnoremap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <silent> <c-o> :noh<cr>
nnoremap <c-t> :call OpenTerminal()<cr>

let NERDTreeShowBookmarks = 1
let NERDTreeHijackNetrw = 0

let g:cpp_function_highlighting = 1
let g:cpp_attributes_highlighting = 1
let g:cpp_member_highlighting = 1
let g:cpp_simple_highlighting =1

let base16colorspace = 256  " Access colors present in 256 colorspace

let g:airline_theme = "bubblegum" "  "catppuccin_mocha"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#formatter = 'unique_tail'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '' " '▶️'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '' " '' " '◀️'
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '⚡'

autocmd BufRead * normal zR
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
   \ b:NERDTree.isTabTree()) | q | endif


function! OpenTerminal()
    terminal
    sleep 10m
    execute "normal! \<c-w>\<c-x>"
    execute "normal! \<c-w>\<c-j>"
    execute "resize -7"
endfunction
