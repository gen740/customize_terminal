scoop install python
python3 -m pip install neovim
python3 im pip install pynvim
Invoke-WebRequest https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1 -OutFile installer.ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
./installer.ps1 ~/.vim/dein

mkdir -p ~/.config/nvim/ -Force

cp  ./configs/vimrc  \Users\fujimoto\AppData\Local\nvim/init.vim -Force
cp  ./configs/plugins.toml ~/.vim/dein/ -Force
cp  ./configs/lazy_plugins.toml ~/.vim/dein/ -Force

scoop install lua go nodejs llvm nvm
nvm install 14.16.0
nvm use 14.16.0
nvim

Write-Host "いずれかのキーを押してくださ"
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
cd ~/.vim/dein/repos/github.com/valloric/youcompleteme
Start-Sleep -s 2
./install.py --all
cd ~/
