docker_osx() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  is_met() {
    which docker-osx
  }

  meet() {
    curl https://raw.github.com/noplay/docker-osx/0.8.0/docker-osx > /usr/local/bin/docker-osx
    chmod +x /usr/local/bin/docker-osx
  }

  require symlink_exists $deps_path/lib/docker_osx/zsh-loaded $deps_path/zsh-loaded/docker_osx
}
