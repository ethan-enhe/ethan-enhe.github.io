set number
set ruler
set showcmd
set cindent
set ts=4
set sw=4
set autowrite
set hlsearch
set mouse=a
map <f9> :! g++ %<.cpp -o %< -Wall<cr>
imap <f9> <esc>:! g++ %<.cpp -o %< -Wall<cr>
map <f8> :! ./%<<cr>
imap <f8> <esc>:! ./%<<cr>
let mapleader=" "
inoremap jj <ESC>
inoremap <leader>. <C-n>
inoremap <leader>, <C-p>
color evening
syntax enable

