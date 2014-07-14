pry() {
  require symlink_exists $p/lib/pry/irbrc.symlink $HOME/.irbrc
  require symlink_exists $p/lib/pry/pryrc.symlink $HOME/.pryrc
}
