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
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/j/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# ESP-IDF toolchain
export IDF_PATH=/home/j/documents/git/esp/esp-idf
export PATH=$PATH:/home/j/documents/git/esp/xtensa-esp32-elf/bin
