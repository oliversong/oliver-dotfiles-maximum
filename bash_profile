export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# add virtualenv wrapper support
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

#setup amazon ec2 command line tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

[[ -s /Users/oliversong/.nvm/nvm.sh ]] && . /Users/oliversong/.nvm/nvm.sh # This loads NVM

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
