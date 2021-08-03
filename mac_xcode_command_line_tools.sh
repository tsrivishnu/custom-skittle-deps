mac_xcode_command_line_tools(){
  is_met() {
    xcode-select -p 1>/dev/null;echo $?
  }

  meet() {
    xcode-select --install
  }
}
