dir_exists() {
  dirname=$1

  is_met() {
    [ -d $dirname ]
  }

  meet() {
    mkdir -p $dirname
  }
}
