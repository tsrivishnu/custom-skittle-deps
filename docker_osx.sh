docker_osx() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  is_met() {
    exit 0
  }

  meet() {
    exit 0
  }

  require binary_installed docker-osx https://raw.github.com/noplay/docker-osx/0.8.0/docker-osx
  require symlink_exists $deps_path/lib/docker_osx/zsh-loaded $deps_path/zsh-loaded/docker_osx
}
