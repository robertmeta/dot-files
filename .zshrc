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
#ZSH_THEME="pygmalion"
#ZSH_THEME="gnzh"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(nvm git)

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
export NNN_USE_EDITOR=1
if type "kak" > /dev/null; then
    export EDITOR=kak
    export VISUAL=kak
fi
if type "nvm" > /dev/null; then
    nvm use 12
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
alias n="echo \"\" >> ~/gdrive/Sync/notes.md && date +'### %Y.%m.%d@%H:%M:%S' >> ~/gdrive/Sync/notes.md && kak ~/gdrive/Sync/notes.md -e 'execute-keys ge2o<esc><space>'"

[ -z "${TMUX}" ] && tmux new -A -s main

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

if [ -f $HOME/.zsh.local ]; then
    source $HOME/.zsh.local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Fix C-s C-q issues
# stty -ixon
export PS1='%10~ $(vcs_status)
»%b '
if [[ -n $AWS_VAULT ]]; then
  PROMPT="%F{242}[aws:$AWS_VAULT]%f $PROMPT"
fi

if type "nvm" > /dev/null; then
  PROMPT="%F{242}[nvm:\$(nvm version)]%f [$(date +'%H:%M:%S')] $PROMPT"
fi
if [[ -n $TMUX_PANE ]]; then
  PROMPT="%F{242}[pane: ${TMUX_PANE:1}]%f $PROMPT"
fi

if [ $? -eq 0 ]; then
     PROMPT="%F{242}[OK]%f $PROMPT"
else
     PROMPT="%F{242}[FAIL]%f $PROMPT"
fi

source /home/rmelton/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
