vim() {
  require symlink_exists $p/lib/vim/vimrc.symlink $HOME/.vimrc
  require file_downloaded $HOME/.vim/colors/solarized.vim https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
}
