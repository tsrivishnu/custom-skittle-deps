binary_installed() {
  name=$1

  is_met() {
    which $name
  }

  meet() {
    if [[ -x `which brew` ]]; then
      brew install $name
    else
      sudo apt-get install $name
    fi
  }
}
