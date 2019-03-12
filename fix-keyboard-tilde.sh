fix-keyboard-tilde() {
  require symlink_exists $p/lib/mac-tilde-swap/com.keyboard.swap-tilde.plist $HOME/Library/LaunchAgents/com.keyboard.swap-tilde.plist
  require symlink_exists $p/lib/mac-tilde-swap/keyboard-fix-tilde.sh /usr/local/bin/swap-tilde-on-keyboard.sh
}
