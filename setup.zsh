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

chmod 644 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 755 ~/.ssh
