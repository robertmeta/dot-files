#!/bin/zsh

rm -rf ~/.vim
rm -rf ~/.nvim
rm -rf ~/.config/nvim
rm -rf ~/.config/kak
rm -rf ~/.config/i3
rm -rf ~/.config/pt
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

git clone git://github.com/robertmeta/vimfiles ~/.dotfiles/vimfiles
git clone https://github.com/robertmeta/nofrils-kakoune ~/.dotfiles/nofrils-kakoune

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.ctags ~/.ctags
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimfiles ~/.vim
ln -s ~/.dotfiles/vimfiles ~/.config/nvim
ln -s ~/.dotfiles/kak ~/.config/kak
# a bit gross, only adds in nofrils kakoune to colors
ln -s ~/.dotfiles/nofrils-kakoune ~/.config/kak/colors
ln -s ~/.dotfiles/i3 ~/.config/i3
ln -s ~/.dotfiles/pt ~/.config/pt
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
    read "reply?Update go support apps? "
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        go get -u github.com/monochromegane/the_platinum_searcher/...
        echo "Installed pt"
        go get -u github.com/alecthomas/gometalinter
        echo "Installed gometalinter"
        go get -u github.com/davidrjenni/reftools/cmd/fillstruct
        echo "Installed fillstruct"
        go get -u github.com/derekparker/delve/cmd/dlv
        echo "Installed dlv"
        go get -u github.com/dominikh/go-tools/cmd/keyify
        echo "Installed keyify"
        go get -u github.com/fatih/gomodifytags
        echo "Installed gomodifytags"
        go get -u github.com/fatih/motion
        echo "Installed motion"
        go get -u github.com/golang/lint/golint
        echo "Installed golint"
        go get -u github.com/josharian/impl
        echo "Installed impl"
        go get -u github.com/jstemmer/gotags
        echo "Installed gotags"
        go get -u github.com/kisielk/errcheck
        echo "Installed errcheck"
        go get -u github.com/klauspost/asmfmt/cmd/asmfmt
        echo "Installed asmfmt"
        go get -u github.com/mdempsky/gocode
        echo "Installed gocode"
        go get -u github.com/rogpeppe/godef
        echo "Installed godef"
        go get -u github.com/zmb3/gogetdoc
        echo "Installed gogetdoc"
        go get -u golang.org/x/tools/cmd/goimports
        echo "Installed goimports"
        go get -u golang.org/x/tools/cmd/gorename
        echo "Installed gorename"
        go get -u golang.org/x/tools/cmd/guru
        echo "Installed guru"
        go get -u github.com/carlmjohnson/pomodoro
	echo "Installed pomodoro"
        go get -u github.com/sourcegraph/go-langserver
        echo "Installed go-langserver"
        go get -u github.com/fullstorydev/grpcurl
        echo "Installed grpcurl"
        go get -u github.com/tomnomnom/gron
        echo "Installed gron"
	go get -u github.com/junegunn/fzf/...
	echo "Install fzf"
    fi
fi

chmod 644 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 755 ~/.ssh
