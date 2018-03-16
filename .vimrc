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
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" finding files
set path+=**
set wildmenu

" ctags
" create the `tags` file
command! MakeTags !ctags -R .

"
" appearance
"

" Status line settings ------- {{{
    set laststatus=2
    set statusline=
    set statusline=\ %F
    set statusline+=%=
    set statusline+=\ %p%%
    set statusline+=\ %l:%c
    set statusline+=\ 
" }}}

set number
set relativenumber
set showmatch
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set incsearch
set cursorline
set belloff=all

" theme
set t_Co=256
set background=dark
syntax enable
" Base2Tone Dark
" colorscheme Base2Tone_EveningDark
" colorscheme Base2Tone_MorningDark
" colorscheme Base2Tone_SeaDark
" colorscheme Base2Tone_SpaceDark
" colorscheme Base2Tone_EarthDark
 colorscheme Base2Tone_ForestDark
" colorscheme Base2Tone_DesertDark
" colorscheme Base2Tone_LakeDark
" colorscheme Base2Tone_MeadowDark
" colorscheme Base2Tone_DrawbridgeDark
" colorscheme Base2Tone_PoolDark
" colorscheme Base2Tone_HeathDark
" colorscheme Base2Tone_CaveDark

" Base2Tone Light
" set background=light
" colorscheme Base2Tone_EveningLight
" colorscheme Base2Tone_MorningLight
" colorscheme Base2Tone_SeaLight
" colorscheme Base2Tone_SpaceLight
" colorscheme Base2Tone_EarthLight
" colorscheme Base2Tone_ForestLight
" colorscheme Base2Tone_DesertLight
" colorscheme Base2Tone_LakeLight
" colorscheme Base2Tone_MeadowLight
" colorscheme Base2Tone_DrawbridgeLight
" colorscheme Base2Tone_PoolLight
" colorscheme Base2Tone_HeathLight
" colorscheme Base2Tone_CaveLight

" check for autocmd
if has ("autocmd")
    filetype plugin indent on
    
    augroup general_start

    augroup END
    
    "
    " FileType specific autocmds
    "
    
    augroup filetype_html
        autocmd!
        autocmd BufNewFile *.html 0r ~/.vim/skeleton.html
        autocmd BufNewFile,BufNew,BufRead *.html setlocal nowrap shiftwidth=2 tabstop=2
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
" }}}

onoremap in( :<c-u>normal! f)vi)<cr>
onoremap il( :<c-u>normal! F)vi)<cr>
onoremap in' :<c-u>normal! 2f'vi'<cr>
onoremap il' :<c-u>normal! 2F'vi'<cr>
onoremap in" :<c-u>normal! 2f"vi"<cr>
onoremap il" :<c-u>normal! 2F"vi"<cr>

vnoremap si" di""<esc>P
vnoremap si' di''<esc>P
vnoremap si( di()<esc>P
vnoremap si{ di{}<esc>P

"
" abbrevs
"
iabbrev @@ mhkshin@gmail.com

