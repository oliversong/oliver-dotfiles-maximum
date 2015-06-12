# export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad

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

# Customize to your needs...
export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/oliversong/.ec2/bin

GOROOT=/usr/local/go
export GOPATH=$HOME/Development/6.824 # export makes the variable available to processes
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
