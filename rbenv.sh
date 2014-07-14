rbenv() {
  require package_installed rbenv
  require package_installed ruby-build
  require symlink_exists $p/lib/rbenv/zsh-loaded $p/zsh-loaded/rbenv
}
