hub() {
  is_met() {
    which hub
  }

  meet() {
    git clone git@github.com:github/hub.git hub
    cd hub
    rake install
    cd ..
    rm -rf hub
  }
}
