docker_clean() {

  is_met() {
    which docker-clean
  }

  meet() {
    chmod +x $p/lib/docker_clean/docker-clean
    sudo ln -s $p/lib/docker_clean/docker-clean /usr/local/bin/docker-clean
  }
}
