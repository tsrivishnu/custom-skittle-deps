rectangleapp() {

  is_met() {
    [ -d "/Applications/rectangle.app" ]
  }

  meet() {
    if [[ $(uname) = 'Darwin' ]]; then
      brew install --cask rectangle
    else
      echolog "Can't install Rectangle app for non-MacOS distributions"
    fi
  }

  require symlink_exists $p/lib/rectangle_app/com.knollsoft.Rectangle.plist $HOME/Library/Preferences/com.knollsoft.Rectangle.plist
}
