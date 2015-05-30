mkdir "%HOME%\Documents\WindowsPowerShell"
rm -rf "%HOME%\vimfiles"
rm "%HOME%\.ctags"
rm "%HOME%\.gitignore_global"
rm "%HOME%\.gitconfig"
rm "%HOME%\.agignore"
rm "%HOME%\.dotfiles\Microsoft.PowerShell_profile.ps1"

git clone "https://github.com/robertmeta/vimfiles.git" "%HOME%\.dotfiles\vimfiles"

mklink "%HOME%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "%HOME%\.dotfiles\Microsoft.PowerShell_profile.ps1"
mklink "%HOME%\.ctags" "%HOME%\.dotfiles\.ctags"
mklink "%HOME%\.gitignore_global" "%HOME%\.dotfiles\.gitignore_global"
mklink "%HOME%\.gitconfig" "%HOME%\.dotfiles\.gitconfig"
mklink "%HOME%\.agignore" "%HOME%\.dotfiles\.agignore"
mklink /D "%HOME%\vimfiles" "%HOME%\.dotfiles\vimfiles" 

sed -i "s/cache --timeout=64800/wincred/g" "%HOME%\.gitconfig"
