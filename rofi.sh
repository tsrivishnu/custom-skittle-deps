rofi() {
  require package_installed rofi
  # Below is the command you probably like to use.
  # Requires file-find.sh
  require symlink_exists $p/lib/rofi/file-find.sh.symlink $HOME/file-find.sh
  # rofi -tokenize -show combi -combi-modi "window,drun,ssh,run,find:/home/stotakura/file-find.sh" -modi combi
}
