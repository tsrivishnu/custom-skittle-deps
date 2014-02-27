zsh() {
  is_met() {
    which zsh
  }

  meet() {
    if [[ -x `which brew` ]]; then
      brew install zsh
    else
      sudo apt-get install zsh
    fi
    chsh -s /bin/zsh `whoami`
  }

  require package_manager
}
