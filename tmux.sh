tmux() {
  require package_installed tmux
  require symlink_exists $p/lib/tmux/tmux.conf.symlink $HOME/.tmux.conf
  require symlink_exists $p/lib/tmux/tmux-macosx.conf.symlink $HOME/.tmux-macosx.conf
  require symlink_exists $p/lib/tmux/tmux-linux.conf.symlink $HOME/.tmux-linux.conf
  require symlink_exists $p/lib/tmux/zsh-loaded $p/zsh-loaded/tmux

  if [[ "$(uname)" = "Darwin" ]]; then
    # https://www.elmund.io/osx/2015/07/10/open-command-in-osx-tmux/
    # or to get copy to system clipboard on OS X check
    #   https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future
    require package_installed reattach-to-user-namespace
    brew upgrade reattach-to-user-namespace
  else
    # Enable to copy to system clipboard
    # http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/
    require package_installed xclip
  fi
}
