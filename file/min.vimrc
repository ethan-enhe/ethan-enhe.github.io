set number
set cindent
set ts=4
set sw=4
set hlsearch
set mouse=a
map <f9> :! g++ %<.cpp -o %< -Wall<cr>
map <f8> :! ./%<<cr>
inoremap jj <ESC>
inoremap < <><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
color ron
syntax enable
