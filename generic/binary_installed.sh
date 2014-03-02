binary_installed() {
  name=$1
  url=$2

  echolog "Ensure binary $name is installed"

  is_met() {
    which $name
  }

  meet() {
    curl $url > /usr/local/bin/$name
    chmod +x /usr/local/bin/$name
  }
}
