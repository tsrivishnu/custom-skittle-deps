sublime_text_3() {
  local_st3_path="$HOME/Library/Application Support/Sublime Text 3"
  dropbox_st3_path=$HOME/Dropbox/sublime-text-3

  require dir_exists $dropbox_st3_path
  require dir_moved "$local_st3_path/Packages/" "$dropbox_st3_path/Packages"
  require dir_moved "$local_st3_path/Installed Packages/" "$dropbox_st3_path/Installed Packages"
  require symlink_exists "$dropbox_st3_path/Packages" "$local_st3_path/Packages"
  require symlink_exists "$dropbox_st3_path/Installed Packages" "$local_st3_path/Installed Packages"
}
