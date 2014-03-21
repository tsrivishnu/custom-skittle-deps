package_installed() {
  name=$1
  apt_name=$2

  echolog "Ensure package $name is installed"

  is_met() {
    which $name
  }

  meet() {
    if [[ -x `which brew` ]]; then
      sudo brew update
      sudo brew install $name
    else
      if [[ $apt_name == "" ]]; then
        sudo apt-get install -y -q $name
      else
        sudo apt-get install -y -q $apt_name
        sudo dpkg-divert --local --divert /usr/bin/$name --rename --add /usr/bin/$apt_name
      fi
    fi
  }
}
