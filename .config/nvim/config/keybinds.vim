" traverse locations
nnoremap ]] :lnext<CR>
nnoremap [[ :lprev<CR>
"
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf-gl %:r.pdf &<CR><CR>

" split window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split window rearrangement
nnoremap <C-S-J> <C-W><C-S-J>
nnoremap <C-S-K> <C-W><C-S-K>
nnoremap <C-S-L> <C-W><C-S-L>
nnoremap <C-S-H> <C-W><C-S-H>
