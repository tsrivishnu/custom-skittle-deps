ack() {
  require package_installed ack ack-grep
  require symlink_exists $p/lib/ack/ackrc.symlink $HOME/.ackrc
}
