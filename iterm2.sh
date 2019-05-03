iterm2() {

  is_met() {
    [ -d "/Applications/iTerm.app" ]
  }

  meet() {
    if [[ $(uname) = 'Darwin' ]]; then
      brew cask install iterm2

      # Specify the preferences directory
      defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$p/lib/iterm"
      # Tell iTerm2 to use the custom preferences in the directory
      defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    else
      echolog "Can't install iterm2 for non-MacOS distributions"
    fi
  }
}
