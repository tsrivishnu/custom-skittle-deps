vim() {
  require package_installed gvim
  require symlink_exists $p/lib/gvim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
}
