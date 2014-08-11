package_installed() {
  binary_name=$1
  apt_name=$2
  brew_name=$3

  echolog "Ensure package $binary_name is installed"

  is_met() {
    which $binary_name
  }

  meet() {
    if [[ -x `which brew` ]]; then
      sudo brew update
      if [[ $brew_name == "" ]]; then
        sudo brew install $binary_name
      else
        sudo brew install $brew_name
      fi
    else
      if [[ $apt_name == "" ]]; then
        sudo apt-get install -y -q $binary_name
      else
        sudo apt-get install -y -q $apt_name
        sudo dpkg-divert --local --divert /usr/bin/$binary_name --rename --add /usr/bin/$apt_name
      fi
    fi
  }

  require package_manager
}
