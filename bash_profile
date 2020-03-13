# export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# add virtualenv wrapper support
export WORKON_HOME=~/Envs

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

export PATH="$PATH:$HOME/Library/Python/2.7/bin" # Add Python bin to path
export PATH=/Applications/MacVim.app/Contents/bin:$PATH
