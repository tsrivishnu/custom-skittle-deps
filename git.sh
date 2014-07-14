git() {
  require package_installed git
  require symlink_exists $p/lib/git/gitconfig.symlink $HOME/.gitconfig
  require symlink_exists $p/lib/git/gitignore.symlink $HOME/.gitignore
}
