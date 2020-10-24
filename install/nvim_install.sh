python3 -m pip install neovim
sudo easy_install pip
python -m pip install neovim
brew install neovim

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
cp ./plugins.toml ~/.vim/dein/
cp ./colors ~/.vim/dein/repos/github.com/Shougo/dein.vim

echo "You should install Nerd Fonts"
echo "Prease ref -> https://github.com/ryanoasis/nerd-fonts"
echo "Or if you want. RobotoMono would install your PC.\n\n"
while true ; do
    echo "Please enter (y)es to install RobotoMono, or (n)o to skip this process."
    read Rsp
    case "$Rsp" in
        [yY])
            cp "./RobotoMono/Bold/complete/Roboto Mono Bold Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Bold-Italic/complete/Roboto Mono Bold Italic Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Italic/complete/Roboto Mono Italic Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Light/complete/Roboto Mono Light Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Light-Italic/complete/Roboto Mono Light Italic Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Medium/complete/Roboto Mono Medium Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Medium-Italic/complete/Roboto Mono Medium Italic Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Regular/complete/Roboto Mono Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Thin/complete/Roboto Mono Thin Nerd Font Complete.ttf" ~/Library/Fonts
            cp "./RobotoMono/Thin-Italic/complete/Roboto Mono Thin Italic Nerd Font Complete.ttf" ~/Library/Fonts
            echo " Nerd Fonts was installed Successfully!!!\n\n"
            break
            ;;
        [nN])
            echo "The process was skipped\n\n"
            break
            ;;
        *) echo "Didn't match anything\n\n" ;;
    esac
done

echo "There are some dipendancy for compiling or formatting\n\n"
while true ; do
    echo "Please enter (y)es to install ALL, or (n)o to skip this process."
    read Rsp
    case "$Rsp" in
        [yY])
            brew install clang-format
            brew install prettier
            brew install gcc@9
            brew install gcc@10
            brew cask install mactex
            echo "Installed Successfully!!!\n\n"
            break
            ;;
        [nN])
            echo "The process was skipped\n\n"
            break
            ;;
        *)
            echo "Didn't match anything\n\n" ;;
    esac
done

