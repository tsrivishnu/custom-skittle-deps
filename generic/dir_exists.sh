dir_exists() {
  dirname=$1

  echolog "Ensure directory $dirname exists"

  is_met() {
    [ -d $dirname ]
  }

  meet() {
    mkdir -p $dirname
  }
}
