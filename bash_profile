export PATH=$PATH:$HOME/bin:$HOME/work/wa-devenv/kubernetes:$HOME/work/wa-devenv/deploy
export GOPATH=$HOME
alias vi=vim
#alias vim=nvim

## Special profile item for termux usage
#
if [[ "$HOME" == *"termux"* ]] ; then
  export PS1="\w$ "
  source `which source-ssh-agent`
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
