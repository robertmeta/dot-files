#!/bin/zsh

rm -rf ~/.vim
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.ctags
rm ~/.gitconfig
rm ~/.agignore

git clone git://github.com/robertmeta/vim-files.git ~/.dotfiles/vim-files

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.ctags ~/.ctags
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vim-files ~/.vim
ln -s ~/.dotfiles/vim-files/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.agignore ~/.agignore

zsh ~/.zshrc
tmux source-file ~/.tmux.conf
