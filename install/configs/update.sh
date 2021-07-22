# bin/bash!
export HOME=/Users/fujimotogen
c=0
source=('.config/nvim' '.zshrc' '.tmux.conf' '.config/zsh')
filenames=('nvim' 'zshrc' 'tmux.conf' 'zsh')


for i in ${source[*]}; do
    rm -rf './'${filenames[c]}
    cp -rf $HOME/${source[c]} './'${filenames[c]}
    # echo ${source[c]} './'${filenames[c]}
    let c++
done

rm -rf ../../dotfiles/*
cp -rf ./* ../../dotfiles
rm -rf ../../dotfiles/update.sh
