pip() { 
  is_met() {
    which pip
  }

  meet() {
    curl -O https://bootstrap.pypa.io/get-pip.py;
    sudo python get-pip.py
    sudo apt-get install -y zlib1g-dev # (needed to compile Python)
    sudo apt-get install -y libreadline-gplv2-dev \
           		libncursesw5-dev \
			libssl-dev \
			libsqlite3-dev \
			tk-dev libgdbm-dev \
			libc6-dev libbz2-dev 
  }

}
