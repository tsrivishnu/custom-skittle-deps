dir_moved() {
  source=$1
  target=$2

  echolog "Ensure directory $source is moved to $target"

  is_met() {
    [ -d "$target" ]
  }

  meet() {
    mv "$source" "$target"
  }
}
