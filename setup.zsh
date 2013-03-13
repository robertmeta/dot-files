#!/bin/zsh

rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

rm -rf ~/.vim
rm ~/.vimrc

rm -rf vim-files
git clone git://github.com/robertmeta/vim-files.git
ln -s ~/.dotfiles/vim-files ~/.vim
ln -s ~/.dotfiles/vim-files/.vimrc ~/.vimrc
