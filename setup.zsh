#!/bin/zsh

rm -rf ~/.vim
rm -rf ~/.nvim
rm -rf ~/.config/nvim
rm -rf ~/.config/kak
rm -rf ~/.config/kak-lsp
rm -rf ~/.config/i3
rm -rf ~/.config/broot
rm -rf ~/.config/pt
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.tigrc
rm ~/.ctags
rm ~/bin/n
rm ~/bin/n.
rm ~/.gitignore_global
rm ~/.gitconfig
rm ~/.agignore
rm ~/.ssh/config

mkdir ~/.dotfiles
mkdir ~/.config
mkdir ~/.ssh
mkdir ~/.nvm
mkdir ~/bin

git clone git://github.com/robertmeta/vimfiles ~/.dotfiles/vimfiles
git clone git://github.com/robertmeta/kakfiles ~/.dotfiles/kakfiles
git clone https://github.com/robertmeta/nofrils-kakoune ~/.dotfiles/nofrils-kakoune

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.ctags ~/.ctags
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimfiles ~/.vim
ln -s ~/.dotfiles/n ~/bin/n
ln -s ~/.dotfiles/n. ~/bin/n.
ln -s ~/.dotfiles/kakfiles ~/.config/kak
ln -s ~/.dotfiles/nofrils-kakoune/ ~/.config/kak/colors
ln -s ~/.dotfiles/kak-lsp ~/.config/kak-lsp
ln -s ~/.dotfiles/vimfiles ~/.config/nvim
ln -s ~/.dotfiles/i3 ~/.config/i3
ln -s ~/.dotfiles/broot ~/.config/broot
ln -s ~/.dotfiles/pt ~/.config/pt
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.agignore ~/.agignore
ln -s ~/.dotfiles/sshconfig ~/.ssh/config
cat ~/.dotfiles/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys | uniq > ~/.ssh/authorized_keys.tmp
mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys
mv ~/.zshlocal ~/.zsh.local

source ~/.zshrc
tmux source-file ~/.tmux.conf

if [ -x "$(command -v go)" ]; then
    read "reply?Update go support apps? "
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        go get -insecure -u github.com/github/hub
        echo "Installed hub"
        go get -insecure -u github.com/99designs/aws-vault
        echo "Installed aws-vault"
        go get -insecure -u github.com/monochromegane/the_platinum_searcher/...
        echo "Installed pt"
        go get -insecure -u github.com/alecthomas/gometalinter
        echo "Installed gometalinter"
        go get -insecure -u github.com/davidrjenni/reftools/cmd/fillstruct
        echo "Installed fillstruct"
        go get -insecure -u github.com/derekparker/delve/cmd/dlv
        echo "Installed dlv"
        go get -insecure -u github.com/dominikh/go-tools/cmd/keyify
        echo "Installed keyify"
        go get -insecure -u github.com/fatih/gomodifytags
        echo "Installed gomodifytags"
        go get -insecure -u github.com/fatih/motion
        echo "Installed motion"
        go get -insecure -u golang.org/x/lint/golint
        echo "Installed golint"
        go get -insecure -u github.com/josharian/impl
        echo "Installed impl"
        go get -insecure -u github.com/jstemmer/gotags
        echo "Installed gotags"
        go get -insecure -u github.com/kisielk/errcheck
        echo "Installed errcheck"
        go get -insecure -u github.com/klauspost/asmfmt/cmd/asmfmt
        echo "Installed asmfmt"
        go get -insecure -u github.com/mdempsky/gocode
        echo "Installed gocode"
        go get -insecure -u github.com/rogpeppe/godef
        echo "Installed godef"
        go get -insecure -u github.com/zmb3/gogetdoc
        echo "Installed gogetdoc"
        go get -insecure -u golang.org/x/tools/cmd/goimports
        echo "Installed goimports"
        go get -insecure -u golang.org/x/tools/cmd/gorename
        echo "Installed gorename"
        go get -insecure -u golang.org/x/tools/cmd/guru
        echo "Installed guru"
        go get -insecure -u github.com/carlmjohnson/pomodoro
        echo "Installed pomodoro"
        go get -insecure -u github.com/sourcegraph/go-langserver
        echo "Installed go-langserver"
        go get -insecure -u github.com/fullstorydev/grpcurl
        echo "Installed grpcurl"
        go get -insecure -u github.com/tomnomnom/gron
        echo "Installed gron"
        go get -insecure -u github.com/jesseduffield/lazygit/
        echo "Installed lazygit"
        go get -insecure -u github.com/jesseduffield/lazydocker/
        echo "Installed lazydocker"
    fi
fi
if [ -x "$(command -v cargo)" ]; then
    read "reply?Update rust support apps? "
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        rustup update
        echo "Updated rustc"
        cargo install ripgrep --force
        echo "Installed ripgrep"
        cargo install broot --force
        echo "Installed broot"
        cargo install exa --force
        echo "Installed exa"
        cargo install gitui --force
        echo "Installed gitui"
        cargo install hyperfine --force
        echo "Installed hyperfine"
        cargo install pastel --force
        echo "Installed pastel"
        cargo install tealdear --force
        echo "Installed tealdear"
        cargo install tokei --force
        echo "Installed tokei"
        cargo install ruplacer --force
        echo "Installed ruplacer"
        cargo install fd-find --force
        echo "Installed fd-find"
        cargo install teip --force
        echo "Installed teip"
    fi
fi

if [ -x "$(command -v npm)" ]; then
    read "reply?Update npm support apps? "
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        sudo npm install -g npm
        echo "Installed npm"
        sudo npm install -g yarn
        echo "Installed yarn"
        sudo yarn global add eslint tslint console-tools typescript typescript-language-server prettier emmet-cli ts-node
        echo "Installed eslint tslint console-tools typescript typescript-language-server prettier emmet-cli"
    fi
fi

chmod 644 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 755 ~/.ssh

kak -e 'plug-install; q'
