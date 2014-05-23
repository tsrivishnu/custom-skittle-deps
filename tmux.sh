tmux() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require package_installed tmux
  require symlink_exists $deps_path/lib/tmux/tmux.conf.symlink $HOME/.tmux.conf
}
