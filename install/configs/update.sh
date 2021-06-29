# bin/zsh!

cp -rf ~/.config/nvim/* .
cp -rf ~/.vim/custom_runtime .
cp -f ~/.zshrc ./zshrc
cp -f ~/.tmux.conf ./tmux.conf

cp -rf ./* ../../dotfiles
cp -f ~/.config/zsh/custom_func.zsh ../../dotfiles
rm ../../dotfiles/update.sh
