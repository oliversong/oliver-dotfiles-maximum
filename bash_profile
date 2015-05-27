export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# add virtualenv wrapper support
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

#setup amazon ec2 command line tools
# export EC2_HOME=~/.ec2
# export PATH=$PATH:$EC2_HOME/bin
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
