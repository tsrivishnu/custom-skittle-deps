symlink_exists() {
  source=$1
  link=$2

  echolog "Ensure symlink $link exists to $source"

  is_met() {
    [ -L "$link" ]
  }

  meet() {
    ln -s "$source" "$link"
  }
}
