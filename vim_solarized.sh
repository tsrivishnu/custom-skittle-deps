vim_solarized() {

  is_met() {
    exit 0
  }

  meet() {
    exit 0
  }

  require file_downloaded $HOME/.vim/colors/solarized.vim https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
}
