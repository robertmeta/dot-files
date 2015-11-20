#!/bin/zsh

rm -rf ~/.vim
rm -rf ~/.nvim
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.tigrc
rm ~/.ctags
rm ~/.gitignore_global
rm ~/.gitconfig
rm ~/.agignore

mkdir ~/.dotfiles
mkdir ~/.config

git clone git://github.com/robertmeta/vimfiles.git ~/.dotfiles/vimfiles

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.ctags ~/.ctags
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimfiles ~/.vim
ln -s ~/.dotfiles/vimfiles ~/.config/nvim
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.agignore ~/.agignore

source ~/.zshrc
tmux source-file ~/.tmux.conf

#cd ~/.dotfiles/vimfiles/bundle/ternforvim/
#npm install
