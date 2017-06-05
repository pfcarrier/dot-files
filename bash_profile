export PATH=$PATH:$HOME/bin:$HOME/work/wa-devenv/kubernetes:$HOME/work/wa-devenv/deploy
export GOPATH=$HOME
alias vi=vim

## Special profile for termux usage
#
if [[ "$HOME" == *"termux"* ]] ; then
  export PS1="\w$ "
  source `which source-ssh-agent`
fi
