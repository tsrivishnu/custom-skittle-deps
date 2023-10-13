volar() {
  is_met() {
    # use npm to check if vue/language-server is installed
    npm list -g @volar/language-server > /dev/null 2>&1
  }

  meet() {
    npm install -g @vue/language-server
  }
}
