boot2docker() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require symlink_exists $deps_path/lib/boot2docker/zsh-loaded $deps_path/zsh-loaded/boot2docker
}
