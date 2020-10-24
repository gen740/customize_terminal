echo "Do you want to use Iterm2, which is great and custumizable terminal app for mac"

while true ; do
    echo "Please enter (y)es to install, or (n)o to skip this process."
    read Rsp
    case "$Rsp" in
        [yY])
            brew cask install iterm2
            echo "Installed Successfully!!!\nYou can use iterm2!\n\n"
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

cat ./zshrc >> ~/.zshrc
