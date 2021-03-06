brew install python3 node llvm
python3 -m pip install neovim
python3 -m pip install pynvim
brew uninstall neovim
brew install --HEAD neovim 
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein

if ! [ -e ~/.cofig/nvim/ ]; then
    if [ -f ~/.config ]; then
        echo "すでに\".config\"ファイルが存在します。\"rm　~/.config\"のコマンドなどで消去してください\n\n"
        exit
    fi
    if [ -f ~/.config/nvim ]; then
        echo "すでに\"~/.config/nvim\"ファイルが存在します\"rm ~/.config/nvim\"で消去してください\n\n"
        exit
    fi
    mkdir -p ~/.config/nvim/
fi

cp -f ./configs/vimrc ~/.config/nvim/init.vim
cp -f ./configs/plugins.toml ~/.vim/dein/
cp -f ./configs/lazy_plugins.toml ~/.vim/dein/
cp -rf ./configs/custom_runtime ~/.vim/

cp "./fonts/MesloLGS NF Bold Italic.ttf" ~/Library/Fonts
cp "./fonts/MesloLGS NF Regular.ttf" ~/Library/Fonts
cp "./fonts/MesloLGS NF Italic.ttf" ~/Library/Fonts
cp "./fonts/MesloLGS NF Bold.ttf" ~/Library/Fonts
