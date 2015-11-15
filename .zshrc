[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
bindkey -v
plugins=(vi-mode)
export KEYTIMEOUT=1

# Important for mac
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
# Stops horrible behavoir of correct_all
unsetopt correct_all
export DISABLE_AUTO_TITLE="true"

# Customize to your needs...
export GOROOT=/opt/go # build it in the go directory
export GOPATH=/home/rmelton/go
export EDITOR=vim

export PATH=$HOME/bin:$GOPATH/bin:/usr/local/bin:$GOROOT/bin:/bin:/usr/bin:/sbin:/usr/sbin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

alias tmux="tmux -2u"
unalias ls 2> /dev/null

test -z "$TMUX" && tmux new-session

export CDPATH=.:$GOPATH/src/code.google.com/p:$GOPATH/src/github.com:$GOPATH/src/golang.org/x:$GOPATH/src/bitbucket.org:$GOPATH/src/gopkg.in:$GOPATH/src/github.com/247waiter:$GOPATH/src/github.com/patdek:~/projects
