go() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require symlink_exists $deps_path/lib/go/zsh-loaded $deps_path/zsh-loaded/go
}
