fix-keyboard-tilde() {
  # is_met() {
  #   launchctl list | grep com.keyboard.swap-tilde
  # }

  # meet() {
  #   cp $p/lib/mac-tilde-swap/com.keyboard.swap-tilde.plist $HOME/Library/LaunchAgents/
  #   # sudo chown root:wheel $HOME/Library/LaunchAgents/com.keyboard.swap-tilde.plist
  #   # sudo launchctl load -w $HOME/Library/LaunchAgents/com.keyboard.swap-tilde.plist
  # }

  require symlink_exists $p/lib/mac-tilde-swap/com.keyboard.swap-tilde.plist $HOME/Library/LaunchAgents/com.keyboard.swap-tilde.plist
  require symlink_exists $p/lib/mac-tilde-swap/keyboard-fix-tilde.sh /usr/local/bin/swap-tilde-on-keyboard.sh
}
