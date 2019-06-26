" dont try to compatible with something ive never used
"
set nocompatible



" Vundle stuff """"""""""""""""""""""""""'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVum/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-theme'

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

" Set line numbers on
let g:airline_powerline_fonts = 1
set nu
colorscheme gruvbox
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
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" make moving between windows make sense
map <C-h> <C-W>j
map <C-l> <C-W>k
