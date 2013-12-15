export TERM=screen-256color

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Important for mac
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
# Stops horrible behavoir of correct_all
unsetopt correct_all
# export DISABLE_AUTO_TITLE="true"

# Customize to your needs...
export GOROOT=/opt/go
export EDITOR=vim

export PATH=$HOME/bin:$GOROOT/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

export GOPATH=/home/rmelton/projects/patdek
export PATDEK_PATH=/home/rmelton/projects/patdek

alias tmux="tmux -2u"
alias gopath="export GOPATH=\`pwd\`"
alias patdek="export PATDEK_PATH=\`pwd\`"
test -z "$TMUX" && (tmux attach -t default || tmux new-session -s default)
