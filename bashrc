# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

eval "$(direnv hook bash)"
