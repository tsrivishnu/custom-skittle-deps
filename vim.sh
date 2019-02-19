vim() {
  # use +vim-gnome+ so that vim installs with ++clipboard+
  if [[ "$(uname)" = "Darwin" ]]; then
    require package_installed vim
  else
    require package_installed vim-gnome vim
  fi
  require symlink_exists $p/lib/vim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  require dir_exists $HOME/.vim/backup
  require dir_exists $HOME/.vim/undo
}
