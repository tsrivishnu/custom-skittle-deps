customize-evolution() {
  # Change the default selected font color for composing emails on evolution.
  # See: https://www.mail-archive.com/evolution-list@gnome.org/msg30718.html
  require symlink_exists $p/lib/customize-evolution/gtk.css.symlink $HOME/.config/gtk-3.0/gtk.css
}
