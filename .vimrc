syntax on
filetype plugin on

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

colorscheme elflord

" 用来切换不同的窗口
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

nnoremap <silent> <c-n> :NERDTreeToggle<cr>

let NERDTreeShowBookmarks = 1
let NERDTreeHijackNetrw = 0

autocmd BufRead * normal zR
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
   \ b:NERDTree.isTabTree()) | q | endif




call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-plug', { 'on': 'vim-plug' }
call plug#end()
