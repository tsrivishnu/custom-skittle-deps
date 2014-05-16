pip() {

  is_met() {
    which pip
  }

  meet() {
    sudo python get-pip.py
  }

  require file_downloaded get-pip.py https://bootstrap.pypa.io/get-pip.py
}
