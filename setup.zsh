#!/bin/zsh

rm -rf ~/.vim
rm -rf ~/.nvim
rm -rf ~/.config/nvim
rm -rf ~/.config/kak
rm -rf ~/.config/ranger
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.tigrc
rm ~/.ctags
rm ~/.gitignore_global
rm ~/.gitconfig
rm ~/.agignore
rm ~/.ssh/config

mkdir ~/.dotfiles
mkdir ~/.config
mkdir ~/.ssh

git clone git://github.com/robertmeta/vimfiles.git ~/.dotfiles/vimfiles

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.ctags ~/.ctags
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimfiles ~/.vim
ln -s ~/.dotfiles/vimfiles ~/.config/nvim
ln -s ~/.dotfiles/kak ~/.config/kak
ln -s ~/.dotfiles/ranger ~/.config/ranger
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.agignore ~/.agignore
ln -s ~/.dotfiles/sshconfig ~/.ssh/config

cat ~/.dotfiles/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys | uniq > ~/.ssh/authorized_keys.tmp
mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys

source ~/.zshrc
tmux source-file ~/.tmux.conf

if [ -x "$(command -v go)" ]; then
    read "reply?Update go support apps? " -n 1 -r
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        go get -u -v github.com/alecthomas/gometalinter
        go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
        go get -u -v github.com/derekparker/delve/cmd/dlv
        go get -u -v github.com/dominikh/go-tools/cmd/keyify
        go get -u -v github.com/fatih/gomodifytags
        go get -u -v github.com/fatih/motion
        go get -u -v github.com/golang/lint/golint
        go get -u -v github.com/josharian/impl
        go get -u -v github.com/jstemmer/gotags
        go get -u -v github.com/kisielk/errcheck
        go get -u -v github.com/klauspost/asmfmt/cmd/asmfmt
        go get -u -v github.com/nsf/gocode
        go get -u -v github.com/rogpeppe/godef
        go get -u -v github.com/zmb3/gogetdoc
        go get -u -v golang.org/x/tools/cmd/goimports
        go get -u -v golang.org/x/tools/cmd/gorename
        go get -u -v golang.org/x/tools/cmd/guru
    fi
fi

chmod 644 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 755 ~/.ssh
