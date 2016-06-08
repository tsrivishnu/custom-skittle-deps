tmux() {
  require package_installed tmux
  require symlink_exists $p/lib/tmux/tmux.conf.symlink $HOME/.tmux.conf
  require symlink_exists $p/lib/tmux/tmux-macosx.conf.symlink $HOME/.tmux-macosx.conf
  require symlink_exists $p/lib/tmux/tmux-linux.conf.symlink $HOME/.tmux-linux.conf
  require symlink_exists $p/lib/tmux/zsh-loaded $p/zsh-loaded/tmux

  if [[ "$(uname)" = "Darwin" ]]; then
    # https://www.elmund.io/osx/2015/07/10/open-command-in-osx-tmux/
    require package_installed reattach-to-user-namespace
    brew upgrade reattach-to-user-namespace
  fi

}
