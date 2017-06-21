export PATH=$PATH:$HOME/bin:$HOME/work/wa-devenv/kubernetes:$HOME/work/wa-devenv/deploy
export GOPATH=$HOME
export EDITOR=vim
alias vi=vim
#alias vim=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'

## On MacOS use gnu-ls instead BSD ls
#
if [[ "$(uname)" == "Darwin" ]] ; then
  which gls &>/dev/null && alias ls=gls
fi

## Special profile item for termux usage
#
if [[ "$HOME" == *"termux"* ]] ; then
  export PS1="\w$ "
  source `which source-ssh-agent`
else
  if [[ "$(uname)" == "Linux" ]] ; then
    if which keychain >/dev/null ; then
      eval $(keychain --quiet --eval)
    fi
  fi
fi

# Updates PATH for the Google Cloud SDK.
#
if [ -f '/Users/pierre.fortincarrier/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/pierre.fortincarrier/Downloads/google-cloud-sdk/path.bash.inc'; fi

# Enables shell command completion for gcloud.
#
if [ -f '/Users/pierre.fortincarrier/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/pierre.fortincarrier/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Enable shell command completion for kubectl
#
if which kubectl >/dev/null ; then
  source <(kubectl completion bash)
fi

# Load and copy gitprompt profile to correct location on mac
#
if [[ -f ~/work/bash-git-prompt/gitprompt.sh ]] ; then
  GIT_PROMPT_THEME=p2
  source ~/work/bash-git-prompt/gitprompt.sh
fi

## quickly update/re-install dot-files
#
function dotfiles(){
  if [[ "$(uname)" == "Linux" ]] ; then
    OS=linux
  else
    OS=macos
  fi

  case "$1" in
    install)
      (
        set -x
        bash ~/work/dot-files/install ${OS}
        exit 0
      )
      ;;
    update)
      (
        set -x
        cd ~/work/dot-files/
        git fetch ; git rebase
        bash ~/work/dot-files/install ${OS}
      )
      ;;
    *)
      echo "Syntax: $0 update|install"
      exit 1
      ;;
  esac
}

# don't put duplicate lines or lines starting with space in the history.
# # See bash(1) for more options
#
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#
shopt -s checkwinsize

alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias ......="cd ../../../../../.."
alias .......="cd ../../../../../../.."
alias ........="cd ../../../../../../../.."
alias .........="cd ../../../../../../../../.."
