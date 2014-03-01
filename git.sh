git() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require package_installed git
  require symlink_exists $deps_path/lib/git/gitconfig.symlink $HOME/.gitconfig
  require symlink_exists $deps_path/lib/git/gitignore.symlink $HOME/.gitignore
}
