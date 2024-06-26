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
Plug 'bfrg/vim-cpp-modern', { 'for': ['cpp', 'c'] }
Plug 'chriskempson/base16-vim'
Plug 'altercation/solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'yianwillis/vimcdoc'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs', { 'for': ['cpp', 'c'] }
Plug 'vim-syntastic/syntastic'
Plug 'sjl/gundo.vim'
call plug#end()

set ignorecase
set smartcase
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
set tags=tags;

colorscheme codedark

let mapleader = "\<space>"
let g:clang_format#code_style = 'Microsoft'
let g:gundo_prefer_python3 = 1


" 用来切换不同的窗口
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

nnoremap tt :tabnew!<cr>
nnoremap tp :tabp!<cr>
nnoremap tn :tabn!<cr>

nnoremap <leader>bp :bp!<cr>
nnoremap <leader>bn :bn!<cr>

nnoremap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <silent> <c-o> :noh<cr>
nnoremap <leader>t :call OpenOrReopenTerminal()<cr>
nnoremap <leader>h :call HideTerminal()<cr>
nnoremap <leader>f :ClangFormat<cr>
nnoremap <leader>g :GundoToggle<cr>
nnoremap <leader>e :call ToggleCocDiagnostics()<cr>
nnoremap <leader>r :call ToggleLineNumbering()<cr>

let NERDTreeShowBookmarks = 1
let NERDTreeHijackNetrw = 0

let g:cpp_function_highlighting = 1
let g:cpp_attributes_highlighting = 1
let g:cpp_member_highlighting = 1
let g:cpp_simple_highlighting =1


" let g:coc_user_config = {
" \   'languageserver': {
" \     'clangd': {
" \       'command': 'clangd',
" \       'args': ['--compile-commands-dir=build/','--background-index', '--clang-tidy', '--suggest-missing-includes'],
" \       'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
" \      'rootPatterns': ['build','compile_commands.json', '.vim/', '.git/', '.hg/'],
" \      'trace.server': 'verbose',
" \      'initializationOptions': {
" \        'clangdFileStatus':'true'
" \      }
" \    }
" \  }
" \}



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
autocmd BufDelete * :AirlineRefresh
autocmd BufWritePost *.cpp,*.h,*.hpp,*.hxx,*.cxx,*.c,*.cc silent! !ctags -R &
" 自动在保存文件时格式化代码
autocmd BufWritePre FileType cpp,h,c,cc,hpp,cxx,hxx,json call clang_format#do_auto_format()
autocmd InsertLeave FileType c,cc,cpp,h,hpp,cxx,hxx,json call clang_format#do_auto_format()



autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quitall! | endif

function! CloseVimWithNerdTreeAndTerminal()
    " 检查是否只有NERDTree和一个可能隐藏的终端窗口
    if winnr('$') == 1 && exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
        " 获取所有列表中的缓冲区
        let l:listed_bufs = filter(range(1, bufnr('$')), 'buflisted(v:val)')
        " 检查是否只有NERDTree和一个终端缓冲区
        if len(l:listed_bufs) == 1 || (len(l:listed_bufs) == 2 && getbufvar(l:listed_bufs[1], '&buftype') == 'terminal')
            " 关闭Vim
            quitall!
        endif
    endif
endfunction

" 在每次进入缓冲区时调用函数
" autocmd BufEnter * call CloseVimWithNerdTreeAndTerminal()


function! OpenOrReopenTerminal()
    let term_buf = bufnr('/bin/zsh')
    if term_buf != -1 && buflisted(term_buf)
        execute 'sp'
        execute 'buffer' term_buf
    else
        execute 'terminal'
        sleep 10m
    endif
    execute "normal! \<c-w>\<c-x>"
    execute "normal! \<c-w>\<c-j>"
    execute "resize -7"
endfunction

function! HideTerminal()
    let term_buf = bufnr('/bin/zsh')
    " 检查终端缓冲区是否存在且已列出
    if term_buf != -1 && buflisted(term_buf)
        " 使用bufwinnr()检查终端是否已经隐藏（返回-1表示隐藏）
        if bufwinnr(term_buf) == -1
            " 终端已隐藏，不执行任何操作
            return
        else
            " 终端未隐藏，执行隐藏操作
            execute "normal! \<c-w>\<c-b>"
            execute "normal! \<c-\\>\<c-n>"
            hide
        endif
    endif
endfunction

" 设置补全菜单的前景和背景颜色
" highlight Pmenu ctermfg=7 ctermbg=236
" highlight PmenuSel ctermfg=white ctermbg=32

" 设置补全菜单项的默认前景和背景颜色
highlight Pmenu ctermfg=LightGrey ctermbg=DarkGrey

" 设置补全菜单选中项的前景和背景颜色
highlight PmenuSel ctermfg=Black ctermbg=LightGrey

" 设置已匹配字的颜色
highlight CocPumDetail ctermfg=Blue

function! ToggleCocDiagnostics()
  " 查找所有缓冲区并检查是否有文件类型为 'qf' 的缓冲区
  for bufnr in range(1, bufnr('$'))
    " 检查缓冲区是否存在且文件类型为 'qf'
    if buflisted(bufnr) && getbufvar(bufnr, '&filetype') ==# 'qf'
      " 关闭文件类型为 'qf' 的缓冲区
      execute bufnr . 'bd!'
      return
    endif
  endfor
  execute 'CocDiagnostics'
endfunction

" 在普通模式下使用相对行号，在插入模式下使用绝对行号
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != 'i' | set rnu | endif
"   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
" augroup END


function! ToggleLineNumbering()
    " 如果当前正在使用相对行号
    if &relativenumber
        " 切换到绝对行号
        set norelativenumber
        set number
    else
        " 切换到相对行号
        set relativenumber
    endif
endfunction


