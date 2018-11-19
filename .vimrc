""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Douglass Boshkoff .vimrc
"
"

" I'm not really concerned about being compatible with vi
set nocompatible

colorscheme badwolf
syntax on
set number
set showcmd
set showmode
set t_Co=256
set pastetoggle=<F7>

"Make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

"By default use four spaces for tabs, four spaces for indent,
"and don't expand tabs into spaces
set tabstop=4 shiftwidth=4 noexpandtab

"New lines inherit the indentation of previous lines 
set autoindent
set shiftround

"Allow backspacing over anything. 
set backspace=indent,eol,start

" no autowrap of lines
set wrapmargin=0

" have fifty lines of command-line (etc) history:
set history=50

"highlight search terms, use incremental search and then make Control-L clear highlights
set hlsearch 
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Don't update the screen during macros. This will make your macros faster.
set lazyredraw

"Show matching parenthesis
set showmatch 

"Give good tab menus 
set wildmenu
set wildmode=longest:full,full

"Allow writing even if you have forgotten to open file as root
cmap w!! w !sudo tee >/dev/null %

"Allow writing onto wrapping lines, rather than just skipping to the next line
nnoremap j gj
nnoremap k gk

"Change leader key
let mapleader = ","

"Allow vim to ignore extraneous files for tab completion
set wildignore=*.swp,*.pyc,*.class

"Plugins are overrated
"call plug#begin()
"Plug 'Valloric/YouCompleteMe'
"Plug 'kien/ctrlp.vim'
"call plug#end()


" enable filetype detection:
filetype plugin indent on
" disable perl recognition in favor of prolog
au Filetype perl set filetype=prolog
"
if has('autocmd')
	" in human-language files, automatically format everything at 72 chars:
	autocmd FileType mail,human set formatoptions+=t textwidth=72

	" for C-like programming, have automatic indentation:
	autocmd FileType c,cpp,slang set cindent

	" for python
	autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2

	" for HTML, generally format text, but if a long line has been created leave it
	" alone when editing:
	autocmd FileType html set formatoptions+=tl

	" for both CSS and HTML, use genuine tab characters for indentation, to make
	" files a few bytes smaller:
	autocmd FileType html,css set noexpandtab tabstop=2

	" in makefiles, don't expand tabs to spaces, since actual tab characters are
	" needed, and have indentation at 8 chars to be sure that all indents are tabs
	" (despite the mappings later):
	autocmd FileType make set noexpandtab shiftwidth=8
endif


" end .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
