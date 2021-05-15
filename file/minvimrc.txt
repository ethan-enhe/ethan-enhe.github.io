set nu
set cindent
set ts=4
set sw=4
set hls
set mouse=a

map <f9> :! g++ -Wall -O2 %<.cpp -o %<<cr>
map <f8> :! time ./%<<cr>

inoremap jj <ESC>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
color evening
syntax enable
