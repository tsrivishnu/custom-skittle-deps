neovim() {
  # use +vim-gnome+ so that vim installs with ++clipboard+
  require package_installed nvim neovim neovim
  require symlink_exists $p/lib/vim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  require dir_exists $HOME/.vim/backup
  require dir_exists $HOME/.vim/undo

  require dir_exists $HOME/.config/nvim
  require symlink_exists $p/lib/nvim/init.vim.symlink $HOME/.config/nvim/init.vim
}
