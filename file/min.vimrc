set number
set ruler
set showcmd
set smartindent
set cindent
set ts=4
set sw=4
set autowrite
set hlsearch
map <f9> :! g++ %<.cpp -o %< -wall<cr>
imap <f9> <esc>:! g++ %<.cpp -o %< -wall<cr>
map <f8> :! ./%<<cr>
imap <f8> <esc>:! ./%<<cr>
let mapleader=" "
inoremap jj <ESC>
inoremap <leader>. <C-n>
inoremap <leader>, <C-p>
color evening
syntax enable

