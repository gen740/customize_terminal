cp -f ~/.config/nvim/init.vim ./vimrc
cp -f ~/.vim/dein/plugins.toml ./plugins.toml
cp -f ~/.vim/dein/lazy_plugins.toml ./lazy_plugins.toml
cp -rf ~/.vim/custom_runtime .
cp -f ~/.zshrc ./zshrc
cp -f ~/.tmux.conf ./tmux.conf
cp -rf ./* ../../dotfiles
rm ../../dotfiles/update.sh
