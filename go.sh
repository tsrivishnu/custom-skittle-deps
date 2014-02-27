go() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  is_met() {
    exit 0
  }

  meet() {
    exit 0
  }

  require symlink_exists $deps_path/lib/go/zsh-loaded $deps_path/zsh-loaded/go
}
