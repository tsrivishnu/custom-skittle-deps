mac_force_hidpi() {
  # Forces HiDPI for external monitors.

  # For DELL U2515H.
  # Remember, your Dell's +DisplayProductID+ might be different
  # than the one that is used here. Follow the instructions in the URLs below
  # to find the right one.
  # Following the instructions from https://comsystoreply.de/blog-post/force-hidpi-resolutions-for-dell-u2515h-monitor
  # and
  # https://comsysto.github.io/Display-Override-PropertyList-File-Parser-and-Generator-with-HiDPI-Support-For-Scaled-Resolutions/
  echo "Attempting to create symlinkk into a system directory. If this fails, try running skittle as sudo"
  sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
  require symlink_exists $p/lib/mac-hidpi-resolution-fix/dell-u2525H /System/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-10ac/DisplayYearManufacture-2015-DisplayWeekManufacture-44
}
