export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=true
export ZSH_TMUX_FIXTERM=true

# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Sane default options
antigen bundle willghatch/zsh-saneopt

antigen bundle bundler
antigen bundle common-aliases
antigen bundle colored-man-pages
antigen bundle dnf
antigen bundle git
antigen bundle svn
antigen bundle systemd
antigen bundle tmux
    # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

    # Extra zsh completions
antigen bundle zsh-users/zsh-completions

antigen bundle jsahlen/tmux-vim-integration.plugin.zsh
antigen bundle hcgraf/zsh-sudo

antigen bundle rutchkiwi/copyzshell

# Load the theme
#antigen theme qwelyt/endless-dog

# Tell antigen that you're done
antigen apply

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
  eval "$("$BASE16_SHELL/profile_helper.sh")"

alias vim="vimx"
export MAKEFLAGS="-j8"
export EDITOR="vim"

source ~/.promptline.sh
