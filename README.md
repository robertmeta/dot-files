Linux:

    rm -rf ~/.dotfiles; git clone https://github.com/robertmeta/dotfiles.git ~/.dotfiles && zsh ~/.dotfiles/setup.zsh

Windows (Power Admin Prompt, Vim must not be running):

    C:\Users\Robert> cd $env:USERPROFILE; rm -recurse -force .dotfiles; git clone https://github.com/robertmeta/dotfiles.git .dotfiles; .\.dotfiles\setup.ps1

