symlink_exists() {
  source=$1
  link=$2

  is_met() {
    [ -L $link ]
  }

  meet() {
    ln -s $source $link
  }
}
