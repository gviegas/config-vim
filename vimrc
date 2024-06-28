colorscheme retrobox
syntax enable
filetype plugin indent on
let g:c_space_errors = 1
let g:c_no_curly_error = 1
set number
set shiftwidth=4
set softtabstop=4
set tabstop=8
set noexpandtab
set formatoptions=tcnl
au filetype asm set sw=8 sts=8 tw=80 noet
au filetype c set sw=8 sts=8 tw=80 cino=:0,(s noet
au filetype cpp set sw=4 sts=4 tw=100 fo=tcnl cino=:0,g0,N-s,(s,j1 et
au filetype glsl set tw=100 fo=tcnl cin cino=:0,(s et
au filetype go set ts=4 noet
au filetype hlsl set ft=cpp
au filetype rust set fo=tcnl et
au filetype zig set fo=tcnl et
