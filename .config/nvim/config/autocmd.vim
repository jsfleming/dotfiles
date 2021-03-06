" Delete trailing white space on save
":aug trailing_whitespace
"    func! DeleteTrailingWS()
"        exe "normal mz"
"        %s/\s\+$//ge
"        exe "normal `z"
"    endfunc
"
"    let langs=['java', 'c', 'html', 'css', 'py', 'rb', 'ml', 'tex']
"    for l in langs
"        let c='*.' . l
"        execute "autocmd BufWrite " . c . " :call DeleteTrailingWS()"
"    endfor
":aug END
"
"" Highlight the 80th column
":aug highlight_eighty
"    if exists('+colorcolumn')
"        :au FileType c,cpp,vim setlocal colorcolumn=80
"    else
"        :highlight LongLines ctermbg=darkblue guibg=darkblue ctermfg=white
"        :au FileType c,cpp,vim,rb let w:m3=matchadd('LongLines', '\%80v', -1)
"    endif
":aug END
"
"" Use github-flavored markdown
":aug markdown
"    :au!
"    :au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
":aug END
"
"" run Neomake on save/load
":aug lint
"    :au BufWritePost,BufEnter * Neomake
"    :au InsertChange,TextChangedI,TextChanged,InsertLeave * update | Neomake
"    :au BufWrite,BufEnter *.ml execute "MerlinErrorCheck"
":aug END

" Enable proper PEP 8 indentation when dealing with Python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Closes NERDTree if I close a window and NERDTree is the last window open
au  BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
