#!/bin/zsh

rm -rf ~/.vim
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc

git clone git://github.com/robertmeta/vim-files.git ~/.dotfiles/vim-files

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/vim-files ~/.vim
ln -s ~/.dotfiles/vim-files/.vimrc ~/.vimrc

zsh ~/.zshrc
tmux source-file ~/.tmux.conf

cd ~/.vim && git submodule update --init
