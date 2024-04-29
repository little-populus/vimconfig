syntax on
filetype plugin on

set number
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set directory=~/.vim/swap/
set foldmethod=syntax
set foldcolumn=1
set wildmenu
set wildmode=list:longest,full
set hlsearch " 设置查找高亮
set incsearch

colorscheme elflord

" 用来切换不同的窗口
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" let NERDTreeShowBookmarks = 1
" let NERDTreeHijackNetrw = 0

autocmd BufRead * normal zR
" autocmd VimEnter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"   \ b:NERDTree.isTabTree()) | q | endif
