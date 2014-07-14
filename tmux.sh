tmux() {
  require package_installed tmux
  require symlink_exists $p/lib/tmux/tmux.conf.symlink $HOME/.tmux.conf
  require symlink_exists $p/lib/tmux/zsh-loaded $p/zsh-loaded/tmux
}
