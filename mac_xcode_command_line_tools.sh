mac_xcode_command_line_tools() {
  # See: https://stackoverflow.com/a/15371967/976880

  is_met() {
    xcode-select -p 1>/dev/null;echo $?
  }

  meet() {
    xcode-select --install
  }
}
