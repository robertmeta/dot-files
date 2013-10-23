#!/bin/zsh

rm -rf ~/.vim
rm -rf ~/.emacs.d
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.gitconfig

git clone git://github.com/robertmeta/vim-files.git ~/.dotfiles/vim-files

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vim-files ~/.vim
ln -s ~/.dotfiles/vim-files/.vimrc ~/.vimrc
ln -s ~/.dotfiles/emacs-files ~/.emacs.d

zsh ~/.zshrc
tmux source-file ~/.tmux.conf

cd ~/.vim && git submodule update --init
