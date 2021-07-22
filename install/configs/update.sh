# bin/zsh!
rm -rf ./nvim
rm -rf ./zshrc
rm -rf ./tmux.conf

cp -rf ~/.config/nvim .
cp -f ~/.zshrc ./zshrc
cp -f ~/.tmux.conf ./tmux.conf

rm -rf ../../dotfiles/*

cp -rf ~/.config/nvim ../../dotfiles/
cp -f ~/.zshrc ../../dotfiles/zshrc
cp -f ~/.tmux.conf ../../dotfiles/tmux.conf
