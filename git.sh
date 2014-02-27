git() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  is_met() {
    exit 0
  }

  meet() {
    exit 0
  }

  require binary_installed git
  require symlink_exists $deps_path/lib/git/gitconfig.symlink $HOME/.gitconfig
  require symlink_exists $deps_path/lib/git/gitignore.symlink $HOME/.gitignore
}
