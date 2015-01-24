gem_installed() {
  name=$1
  gem_name=$2

  echolog "Ensure gem $name is installed"

  is_met() {
    which $name
  }

  meet() {
    if [[ $gem_name == "" ]]; then
      gem install $name
    else
      gem install $gem_name
    fi
  }
}
