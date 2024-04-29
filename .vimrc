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

colorscheme elflord

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>



autocmd BufRead * normal zR
