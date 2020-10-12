mac_bootstrap() {
  require bootstrap
  require iterm2
  require rectangleapp

  # rbenv
  require package_installed rbenv
  require symlink_exists $p/lib/rbenv/zsh-loaded $p/zsh-loaded/rbenv

  # yarn
  require package_installed yarn
}
