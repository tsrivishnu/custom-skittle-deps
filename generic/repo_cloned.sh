repo_cloned() {
  repo=$1
  target=$2

  echolog "Ensure $repo cloned to $target"

  is_met() {
    [ -d $target ]
  }

  meet() {
    git clone $repo $target
  }

  require git
}
