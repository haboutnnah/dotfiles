set nocompatible              " be iMproved, required
if has("win32") || has("win64")
  "Windows options here
  source ~/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect('~/vimfiles/bundle/{}')
  else
    if has("unix")
        let s:uname = system("uname")
            if s:uname == "Darwin\n"
                source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
                execute pathogen#infect('~/.vim/bundle/{}')
                    endif
                      endif
                      endif
execute pathogen#infect($patholoadfolder + '{}')

filetype plugin on " Tabs for makefiles, 2 spaces for YAML

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

set guifont=Source_Code_Pro_Light:h11 " Set font for gvim
set background=dark " Set background for gvim
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

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
