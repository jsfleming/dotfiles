call plug#begin('~/.nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"""""""""""""""""
" Functionality "
"""""""""""""""""
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/rainbow_parentheses.vim'

"""""""""""
" Theming "
"""""""""""
Plug 'flazz/vim-colorschemes'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

"""""""""""""
" Languages "
"""""""""""""
" Java

" C

" Python

" HTML

" CSS

" JavaScript

" LaTeX
Plug 'lervag/vimtex'
 
" Ruby
 
" OCaml
Plug 'def-lkb/ocp-indent-vim'

"Plug '/merlin'

" Sage math
"Plug 'petRUShka/vim-sage'

call plug#end()

"""""""""""""""""
" Functionality "
"""""""""""""""""
" neomake
let g:neomake_ocaml_enabled_makers = ['merlin']
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 1

let g:neomake_error_highlight = "TermCursor"
hi link NeomakeError Error
let g:neomake_warning_highlight = 'Warning'
hi link NeomakeWarning Warning
let g:neomake_message_highlight = 'Message'
hi link NeomakeMessage Message
let g:neomake_informational_highlight = 'Informational'
hi link NeomakeInfo Info

" deoplete
let g:deoplete#enable_at_startup = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"


"""""""""""
" Theming "
"""""""""""
" vim-colorscheme
" colorscheme base16-tomorrow-night

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_symbols.space = "\ua0"
let g:AirlineTheme='solarized dark'

" rainbow_parentheses.vim
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""
" Languages "
"""""""""""""
" ocp-indent
set rtp^="/Users/jfleming/.opam/system/share/ocp-indent/vim"

" ocp-index
set rtp+=/Users/jfleming/.opam/system/share/ocp-index/vim

" merlin from opam
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
