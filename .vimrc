" dont try to compatible with something ive never used
"
set nocompatible
filetype off



" Vundle stuff """"""""""""""""""""""""""'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'kaicataldo/material.vim'

call vundle#end()           
filetype plugin indent on    
" End Vundle stuff """"""""""""""""""""""
"

" make backspace work as expected
set backspace=eol,start,indent

"" Making tab 4 characters
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


syntax on


"" Searching """""""""""""""""""""""""""

" search as you type
set incsearch
" disable search result highlighting
set nohls
" enable search result highlighting
"set hlsearch
" Tab completion
set wildmenu


"" Appearances """"""""""""""""""""""""""

set t_ut=""

if (has('termguicolors'))
  set termguicolors
endif

" Set line numbers on
let g:airline_powerline_fonts = 1
set nu

let g:colors_name = 'oblivion-dark'
let g:material_terminal_italics = get(g:, 'material_terminal_italics', 0)

let s:bg = { 'gui': '#1d212a', 'cterm': 'none' }
let s:fg = { 'gui': '#e3e3e3', 'cterm': 231 }
let s:invisibles = { 'gui': '#65738e', 'cterm': 66 }
let s:comments = { 'gui': '#404859', 'cterm': 145 }
let s:caret = { 'gui': '#d5be68', 'cterm': 220 }
let s:selection = { 'gui': '#4e4e5a', 'cterm': 239 }
let s:guides = { 'gui': '#37474f', 'cterm': 17 }
let s:line_numbers = { 'gui': '#585e74', 'cterm': 145 }
let s:line_highlight = { 'gui': '#3c414c', 'cterm': 235 }
let s:white = { 'gui': '#ffffff', 'cterm': 231 }
let s:black = { 'gui': '#000000', 'cterm': 232 }
let s:red = { 'gui': '#fc8993', 'cterm': 203 }
let s:orange = { 'gui': '#ffc494', 'cterm': 209 }
let s:yellow = { 'gui': '#fbdf90', 'cterm': 11 }
let s:green = { 'gui': '#8de19c', 'cterm': 2 } " 186 –– almost perfect match
let s:cyan = { 'gui': '#89ddff', 'cterm': 117 }
let s:blue = { 'gui': '#a7bdfb', 'cterm': 111 }
let s:paleblue = { 'gui': '#b2ccd6', 'cterm': 152 }
let s:purple = { 'gui': '#d990cd', 'cterm': 176 }
let s:brown = { 'gui': '#bb6f6a', 'cterm': 137 }
let s:pink = { 'gui': '#f778ad', 'cterm': 204 }
let s:violet = { 'gui': '#c682d3', 'cterm': 139 }


" Defined globally so that the Airline theme has access
let g:material_colorscheme_map = {}
let g:material_colorscheme_map.bg = s:bg
let g:material_colorscheme_map.fg = s:fg
let g:material_colorscheme_map.invisibles = s:invisibles
let g:material_colorscheme_map.comments = s:comments
let g:material_colorscheme_map.caret = s:caret
let g:material_colorscheme_map.selection = s:selection
let g:material_colorscheme_map.guides = s:guides
let g:material_colorscheme_map.line_numbers = s:line_numbers
let g:material_colorscheme_map.line_highlight = s:line_highlight
let g:material_colorscheme_map.white = s:white
let g:material_colorscheme_map.black = s:black
let g:material_colorscheme_map.red = s:red
let g:material_colorscheme_map.orange = s:orange
let g:material_colorscheme_map.yellow = s:yellow
let g:material_colorscheme_map.green = s:green
let g:material_colorscheme_map.cyan = s:cyan
let g:material_colorscheme_map.blue = s:blue
let g:material_colorscheme_map.paleblue = s:paleblue
let g:material_colorscheme_map.purple = s:purple
let g:material_colorscheme_map.brown = s:brown
let g:material_colorscheme_map.pink = s:pink
let g:material_colorscheme_map.violet = s:violet

" === Highlights ===

colorscheme material
set background=dark
set cursorline


"" Functionality

" Automatically indent new line
set autoindent

" disable the arrow keys and enter the vim zone
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" recursive directory searching
set path+=**;

" dont do that visual mode bullshit when I try to copy text
set mouse-=a

" don't autotype comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Fixes common typos
"  correct :W to :w #typo
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
"  correct :Q to :q #typo
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

set pastetoggle=<F11>

" statuslines
function! ModeString()
    if mode() == "n"
        return "NORMAL"
    endif
    if mode() == "i"
        return "INSERT"
    endif
    return "VISUAL"
endfunction

function! StatusOverride(...)
    call a:1.add_section('Search'    ,   ' %{ModeString()} ')
    call a:1.add_section('StatusLine'    ,   ' %f ')
    call a:1.add_section('TabLineSel'    ,   ' %l/%L (%p%%) ')
    call a:1.add_section('Title'    ,   '')
    call a:1.split()
    call a:1.add_section('Search'    ,   ' Do Good ')
    return 1
endfunction

call airline#add_statusline_func('StatusOverride')


"" Keypresses """"""""""""""""""""""""""""""""""
nnoremap [C :tabnext<CR>
nnoremap [D :tabprevious<CR>


nnoremap ýV :tabnext<CR>

nnoremap ýU :tabprevious<CR>
"  make enter and shift enter insert blank lines
map <Enter> o<ESC>k
map <S-Enter> O<ESC>

" make moving between windows make sense
map <C-h> <C-W>j
map <C-l> <C-W>k

let mapleader = " "

" panes
map <Leader>j <C-w><C-J>
map <Leader>k <C-w><C-K>
map <Leader>l <C-w><C-L>
map <Leader>h <C-w><C-H>

" buffers
map <Leader>s :b$<cr>

nnoremap <Leader>b :buffers<cr>:buffer<space>
" tabs
map <Leader>t gt
map <Leader>T gT

" netrw hotkey
map <Leader>e :e .<cr>

map <Leader>r :reg<cr>

set directory=~/.swapfiles//
