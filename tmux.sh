tmux() {
  require package_installed tmux
  require symlink_exists $p/lib/tmux/tmux.conf.symlink $HOME/.tmux.conf
  require symlink_exists $p/lib/tmux/tmux-macosx.conf.symlink $HOME/.tmux-macosx.conf
  require symlink_exists $p/lib/tmux/tmux-linux.conf.symlink $HOME/.tmux-linux.conf
  require symlink_exists $p/lib/tmux/zsh-loaded $p/zsh-loaded/tmux
}
