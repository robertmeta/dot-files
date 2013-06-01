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

git config --global color.ui true
git config --replace-all --global format.pretty "short"
git config --global alias.lg "log --color --decorate --graph --oneline --abbrev-commit"
git config --global alias.graph "log --graph --all --pretty=format:'%Cred%h%Creset - %Cgreen(%cr)%Creset %s%C(yellow)%d%Creset' --abbrev-commit --date=relative"
git config --global alias.wip "commit -a -m WIP"
git config --global alias.staged 'diff --cached'
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.a add
git config --global alias.snapshot '!git stash save "snapshot: $(date)" && git stash apply "stash@{0}"'
git config --global diff.algorithm patience
git config --global help.autocorrect 1
git config --global push.default tracking
git config --global --bool pull.rebase false
git config --global advice.pushNonFastForward true
git config --global advice.statusHints true
git config --global diff.renames copies
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --global core.whitespace trailing-space,space-before-tab
git config --global diff.mnemonicprefix true
git config --global branch.autosetupmerge true
git config --global merge.stat true
git config --global rerere.enabled true
