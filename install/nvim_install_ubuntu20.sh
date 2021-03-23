sudo apt update && upgrade
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim/focal
sudo apt install python3 python3-pip
python3 -m pip install neovim pynvim

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

sudo apt install clang-format lua cmake g++-8
export CXX=g++-8
export CMAKE_CXX_COMPILER=g++-8
nvim
read -p "Hit enter: "
sudo apt install golang-go node
cd ~/.vim/dein/repos/github.com/valloric/youcompleteme
./install.py --all
