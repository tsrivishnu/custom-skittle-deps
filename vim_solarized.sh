vim_solarized() {
  is_met() {
    [ -e $HOME/.vim/colors/solarized.vim ]
  }

  meet() {
    if [ ! -e $HOME/.vim/colors ]; then
      mkdir -p $HOME/.vim/colors
    fi
    cd $HOME/.vim/colors && { curl -O https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim; cd -; }
  }
}
