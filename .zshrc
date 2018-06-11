# base16 color stuff
BASE16_SHELL="$HOME/.base16-manager/chriskempson/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
		eval "$("$BASE16_SHELL/profile_helper.sh")"

# Include user pip modules in path
export PATH="${PATH}:${HOME}/.local/bin/"

# set default editor... pls no more nano
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# zplug stuff
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# themes to test out later
#zplug 'themes/robbyrussell', from:oh-my-zsh, as:theme
#zplug 'themes/minimal', from:oh-my-zsh, as:theme
zplug 'themes/nanotech', from:oh-my-zsh, as:theme
#zplug 'themes/afowler', from:oh-my-zsh, as:theme
#zplug "eendroroy/alien-minimal", as:theme
zplug load --verbose

# TODO: read about zsh and configuration options beyond plugins
