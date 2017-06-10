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
if [[ "$(uname)" == "Darwin" ]] ; then
  if [ -f /usr/local/share/gitprompt.sh ]; then
    cp /usr/local/share/themes/p2.bgptheme /usr/local/Cellar/bash-git-prompt/*/share/themes/
    GIT_PROMPT_THEME=p2
    . /usr/local/share/gitprompt.sh
  fi
fi
