package_installed() {
  name=$1

  echolog "Ensure package $name is installed"

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
