package_manager() {
  is_met() {
    if [[ $(uname) = 'Darwin' ]]; then
      which brew
    else
      which apt-get
    fi
  }

  meet() {
    if [[ $(uname) = 'Darwin' ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  }
}
