redshift() {
  require package_installed redshift redshift-gtk
  require symlink_exists $p/lib/redshift/config.symlink $HOME/.config/redshift
}
