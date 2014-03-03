ack() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require package_installed ack
  require symlink_exists $deps_path/lib/ack/ackrc.symlink $HOME/.ackrc
}
