rm -rf "%HOME%\vimfiles"
rm "%HOME%\.ctags"
rm "%HOME%\.gitconfig_global"
rm "%HOME%\.gitconfig"
rm "%HOME%\.agignore"

git clone "https://github.com/robertmeta/vimfiles.git" "%HOME%\.dotfiles\vimfiles"

mklink "%HOME%\.ctags" "%HOME%\.dotfiles\.ctags"
mklink "%HOME%\.gitconfig_global" "%HOME%\.dotfiles\.gitconfig_global"
mklink "%HOME%\.gitconfig" "%HOME%\.dotfiles\.gitconfig"
mklink "%HOME%\.agignore" "%HOME%\.dotfiles\.agignore"
mklink /D "%HOME%\vimfiles" "%HOME%\.dotfiles\vimfiles" 

sed -i "s/cache --timeout=64800/wincred/g" "%HOME%\.gitconfig"
