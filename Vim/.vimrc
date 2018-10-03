set nocompatible              " be iMproved, required

if has("win32") || has("win64")
	" Windows options here
	call plug#begin('~/vimfiles/bundle')
	else if has("unix")
		" *nix options here
		call plug#begin('~/.vim/bundle')
	endif
endif

Plug 'VundleVim/Vundle.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'cburroughs/pep8'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'PProvost/vim-ps1'

call plug#end()

" Tabs for makefiles, 2 spaces for YAML
filetype plugin on 

" syntax highlighting
syntax on

" spaces > tabs
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Gvim
set guifont=Source_Code_Pro_Light:h11 " Set font for gvim

" Pretty colour scheme
set background=dark " Set background 
colorscheme hybrid_material " Set background to theme that was installed earlier

" Work with conemu
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set mouse=a
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
    colorscheme hybrid_material
endif

"DirectX
if has("directx") && $VIM_USE_DIRECTX != '0'
    set renderoptions=type:directx,taamode:1
endif

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

" Vim Airline
let g:airline_theme = "hybrid"
let g:airline_powerline_fonts = 1
let g:airline_enable_syntastic = 1

set encoding=utf-8 " better than latin1
setglobal fileencoding=utf-8
set number
