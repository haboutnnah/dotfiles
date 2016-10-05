set nocompatible              " be iMproved, required
execute pathogen#infect()

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
