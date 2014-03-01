vim() {
  require symlink_exists $deps_path/lib/vim/vimrc.symlink $HOME/.vimrc
  require file_downloaded $HOME/.vim/colors/solarized.vim https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
}
