sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim/focal
sudo apt install python3 python3-pip
sudo apt install clang-format lua5.1 luarocks cmake g++-8
sudo apt install golang-go nodejs npm
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

export CXX=g++-8
export CMAKE_CXX_COMPILER=g++-8
nvim
read -p "Hit enter: "
cd ~/.vim/dein/repos/github.com/valloric/youcompleteme
./install.py --all
