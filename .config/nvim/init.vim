source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/keybinds.vim
source $HOME/.config/nvim/config/autocmd.vim
source $HOME/.config/nvim/colorscheme.vim " set by base16-vim
if getcwd() =~ '^/home/j/Documents/git/radare2-fork'
  source $HOME/.config/nvim/config/radare.vim
endif
