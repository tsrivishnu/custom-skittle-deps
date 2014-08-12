pip() {

  is_met() {
    which pip
  }

  meet() {
    curl -O https://bootstrap.pypa.io/get-pip.py;
    sudo python get-pip.py
    rm get-pip.py
  }

}
