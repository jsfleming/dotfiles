" traverse locations
nnoremap ]] :lnext<CR>
nnoremap [[ :lprev<CR>
"
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf-gl %:r.pdf &<CR><CR>
