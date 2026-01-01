git() {
  require package_installed git
  require symlink_exists $p/lib/git/gitconfig.symlink $HOME/.gitconfig
  require symlink_exists $p/lib/git/gitconfig.personal.symlink $HOME/.gitconfig.personal
  require symlink_exists $p/lib/git/gitignore.symlink $HOME/.gitignore

  is_met() {
    which git-when-merged
  }

  meet() {
    git clone git@github.com:mhagger/git-when-merged.git /tmp/git-when-merged
    mkdir -p /usr/local/bin # create this if it is missing. On MacOS homebrew used to create this but doesn't anymore.
    sudo cp /tmp/git-when-merged/bin/git-when-merged /usr/local/bin/
    rm -rf /tmp/git-when-merged
  }
}
