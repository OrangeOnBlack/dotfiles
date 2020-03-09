set encoding=utf-8

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

set backspace=indent,eol,start

set nocompatible
syntax on
set number relativenumber
set expandtab

set colorcolumn=80
highlight ColorColumn guibg=#2d2d2d ctermbg=246

nmap <F8> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_cache_omnifunc = 0 
set splitbelow
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000


nnoremap <C-h> :tabprevious<CR>                                                                            
nnoremap <C-l> :tabnext<CR>

"call plug#begin('~/.vim/plugged')
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
"Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe'
"call plug#end()

