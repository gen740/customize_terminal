sudo apt install vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein

if ! [ -e ~/.cofig/nvim/ ]; then
    if [ -f ~/.config ]; then
        echo "There already exists .config file. Please remove it by "rm ~/.config" or manually\n\n"
        exit
    fi
    if [ -f ~/.config/nvim ]; then
        echo "There already exists nvim file. Please remove it by "rm ~/.config/nvim" or manually\n\n"
        exit
    fi
    mkdir -p ~/.config/nvim/
fi

if ! [ -e ~/.vim/dein/ ]; then
    if [ -f ~/.vim ]; then
        echo "There already exists .vim file. Please remove it by "rm ~/.vim" or manually\n\n"
        exit
    fi
    if [ -f ~/.vim/dein ]; then
        echo "There already exists dein file. Please remove it by "rm ~/.vim/dein" or manually\n\n"
        exit
    fi
    mkdir -p ~/.vim/dein/
fi

cp ./init.vim ~/.config/nvim/
cp ./init.vim ~/.vimrc
cp ./plugins.toml ~/.vim/dein/
cp ./lazy_plugins.toml ~/.vim/dein/
cp -r ./colors ~/.vim/dein/repos/github.com/Shougo/dein.vim

echo "You should install Nerd Fonts"
echo "Prease ref -> https://github.com/ryanoasis/nerd-fonts"
