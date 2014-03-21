rbenv() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require package_installed rbenv
  require package_installed ruby-build
  require symlink_exists $deps_path/lib/rbenv/zsh-loaded $deps_path/zsh-loaded/rbenv
}
