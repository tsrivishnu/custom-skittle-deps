git() {
  require package_installed git
  require symlink_exists $p/lib/git/gitconfig.symlink $HOME/.gitconfig
  require symlink_exists $p/lib/git/gitignore.symlink $HOME/.gitignore

  is_met() {
    which git-when-merged
  }

  meet() {
    git clone git@github.com:mhagger/git-when-merged.git /tmp/git-when-merged
    sudo cp /tmp/git-when-merged/bin/git-when-merged /usr/local/bin/
    rm -rf /tmp/git-when-merged
  }
}
