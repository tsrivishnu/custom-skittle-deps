pry() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require symlink_exists $deps_path/lib/pry/irbrc.symlink $HOME/.irbrc
  require symlink_exists $deps_path/lib/pry/pryrc.symlink $HOME/.pryrc
}
