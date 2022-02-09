iterm2() {

  is_met() {
    [ -d "/Applications/iTerm.app" ]
  }

  meet() {
    if [[ $(uname) = 'Darwin' ]]; then
      brew install --cask iterm2

      # Specify the preferences directory
      defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$p/lib/iterm"
      # Tell iTerm2 to use the custom preferences in the directory
      defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    else
      echolog "Can't install iterm2 for non-MacOS distributions"
    fi
  }

  require dir_exists $HOME/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
  require symlink_exists $p/lib/iterm/change-profile-on-theme-change-macos.py $HOME/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/change-profile-on-os-theme-change.py

}
