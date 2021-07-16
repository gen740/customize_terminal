# bin/zsh!

cp -rf ~/.config/nvim/* .
cp -rf ~/.vim/custom_runtime .
cp -f ~/.zshrc ./zshrc
cp -f ~/.tmux.conf ./tmux.conf

rm -rf ../../dotfiles/*
cp -rf ~/.vim/custom_runtime ../../dotfiles/
cp -rf ~/.config/nvim ../../dotfiles/
cp -f ~/.zshrc ../../dotfiles/zshrc
cp -f ~/.tmux.conf ../../dotfiles/tmux.conf
