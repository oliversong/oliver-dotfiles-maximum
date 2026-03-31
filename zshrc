# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"
setopt NO_NOMATCH

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/z.sh
DEFAULT_USER="oliversong"

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix z.sh race condition
if [ "$_Z_NO_RESOLVE_SYMLINKS" ]; then
    _z_precmd() {
        (_z --add "${PWD:a}" &)
        : $RANDOM
    }
else
    _z_precmd() {
        (_z --add "${PWD:A}" &)
        : $RANDOM
    }
fi

tr() {
  CMD=$1

  if [[ $1 == "ls" ]]; then
    taskrunner --list | fzf | read CMD
  fi

  taskrunner $CMD
}

[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
