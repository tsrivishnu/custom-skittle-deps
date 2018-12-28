vim() {
  # use +vim-gnome+ so that vim installs with ++clipboard+
  require package_installed vim-gnome vim
  require symlink_exists $p/lib/vim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  require dir_exists $HOME/.vim/backup
  require dir_exists $HOME/.vim/undo
}
