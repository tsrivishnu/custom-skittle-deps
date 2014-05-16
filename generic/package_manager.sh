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
      ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
  }
}
