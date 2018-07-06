[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
#ZSH_THEME="bira"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

# Important for mac
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
# Stops horrible behavoir of correct_all
unsetopt correct_all
export DISABLE_AUTO_TITLE="true"

# Customize to your needs...
export GOROOT=/opt/go # build it in the go directory
export GOPATH=$HOME/go
export EDITOR=vim
if ! type "kak" > /dev/null; then
    alias vim="kak"
    export EDITOR=kak
    export VISUAL=kak
fi

export PATH=$HOME/.local/bin:$HOME/bin:$GOPATH/bin:/usr/local/bin:$GOROOT/bin:/bin:/usr/bin:/sbin:/usr/sbin:$HOME/.cargo/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

alias tmux="tmux -2u"
alias gaa="git add --all"
alias b="cd ~/go/src/github.com/patdek/patdek/backend"
alias wip="git add --all . && git wip"
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias t="tmux selectp -t +1"

if [ "$TMUX" = "" ]; then
     if [ "$HOST" != "MoyaLinux" ] && [ "$HOST" != "beast.workdomain" ] && [ "$HOST" != "moya-linux" ] && [ "$HOST" != "Roberts-Mini.home" ]; then
         tmux attach -t main || tmux new -s main;
     else
         tmux new\; tmux setw -g window-status-current-bg green
     fi;
fi
export CDPATH=.:$GOPATH/src/github.com:$GOPATH/src/golang.org/x:$GOPATH/src/bitbucket.org:$GOPATH/src/gopkg.in:$GOPATH/src/github.com/247waiter:$GOPATH/src/github.com/patdek:~/projects:~/Projects:~/downloads:~/Downloads

# For updating SSH key-agent stuff
fixssh() {
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
        if (tmux show-environment | grep "^${key}" > /dev/null); then
            value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
            export ${key}="${value}"
        fi
    done
}

# cyan cursor
echo -e "\e]12;cyan\a"

if [ -f $HOME/.zshlocal ]; then
    source $HOME/.zshlocal
fi

# Fix C-s C-q issues
stty -ixon
