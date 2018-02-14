set nocompatible
execute pathogen#infect()

" Vimscript file settings ----------------------{{{
if has("autocmd")
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
endif
" }}}

let mapleader = ","
let maplocalleader = "\\"

"
" appearance
"

" Status line settings ------- {{{
    set laststatus=2
    set statusline=%f
    set statusline+=%=
    set statusline+=[%4l/%4L]
" }}}

set number
set showmatch
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set incsearch
set cursorline

" theme
set t_Co=256
set background=dark
colorscheme test
syntax on

" check for autocmd
if has ("autocmd")
    filetype plugin indent on
    
    "
    " FileType specific autocmds
    "
    
    augroup filetype_html
        autocmd!
        autocmd BufNewFile *.html 0r ~/.vim/html.skel
        autocmd BufNew,BufRead *.html setlocal nowrap shiftwidth=2 tabstop=2
        autocmd FileType html nnoremap <buffer> <localleader>c I<!-- <esc>A --><esc>
        autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
    augroup END
    " JavaScript file settings --------------{{{
        augroup filetype_js
            autocmd!
               autocmd FileType javascript nnoremap <buffer> <localleader>c I//<space><esc>
            "
            " seek nearest function name
            "
            autocmd FileType javascript onoremap <buffer> fn :<c-u>normal! f(hviw<cr>
            autocmd FileType javascript onoremap <buffer> fl :<c-u>normal! F)hviw<cr>
            autocmd FileType javascript onoremap <buffer> in{ :<c-u>normal! f{vi{<cr>
            autocmd FileType javascript onoremap <buffer> il{ :<c-u>normal! F{vi{<cr>
        augroup END
    " }}}
    augroup filetype_python
        autocmd!
        autocmd FileType python nnoremap <buffer> <localleader>c I#<space><esc>
    augroup END
    augroup filetype_markdown
        autocmd!
        autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
        autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
    augroup END
endif

"
" mappings
"

" nmaps ---------------------------{{{
    nnoremap _ ddp
    nnoremap - ddkP
    nnoremap \ dd
    nnoremap <leader>u viwUe
    nnoremap <leader>l viwue
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>sj :execute "rightbelow split ".bufname("#")<cr>
    nnoremap <leader>sk :execute "leftabove split ".bufname("#")<cr>
    nnoremap <leader>sh :execute "leftabove vsplit ".bufname("#")<cr>
    nnoremap <leader>sl :execute "rightbelow vsplit ".bufname("#")<cr>
    nnoremap <space> :
    nnoremap / /\v
    " grep
    nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>
" }}}

" imaps ------------------{{{
    inoremap <c-u> <esc>viwUea
    inoremap <leader>; <esc>mqA;<esc>`qa
    inoremap ( ()<left>
    inoremap { {}<left>
    inoremap {<cr> {<cr>}<esc>O
    inoremap [ []<left>
    inoremap ' ''<left>
    inoremap " ""<left>
    noremap! jk <esc>
" }}}

onoremap in( :<c-u>normal! f(vi)<cr>
onoremap il( :<c-u>normal! F)vi)<cr>

vnoremap si" di""<esc>P
vnoremap si' di''<esc>P
vnoremap si( di()<esc>P
vnoremap si{ di{}<esc>P
vnoremap jk <esc>

"
" abbrevs
"
iabbrev @@ mhkshin@gmail.com

