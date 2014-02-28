vim() {

  is_met() {
    exit 0
  }

  meet() {
    exit 0
  }

  require symlink_exists $deps_path/lib/vim/vimrc.symlink $HOME/.vimrc
  require file_downloaded $HOME/.vim/colors/solarized.vim https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
}
