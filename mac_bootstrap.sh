mac_bootstrap() {
  require mac_xcode_command_line_tools


  require package_manager
  require pip
  require zsh
  require git
  require neovim
  require ack
  require tmux
  require package_installed wget
  require package_installed ag silversearcher-ag the_silver_searcher
  require fzf
  require package_installed htop
  #require package_installed nethogs
  require package_installed tree
  require package_installed unzip
  require package_installed jq
  require package_installed prettier

  require iterm2
  require rectangleapp

  # rbenv
  require package_installed rbenv
  require symlink_exists $p/lib/rbenv/zsh-loaded $p/zsh-loaded/rbenv

  # yarn
  #require package_installed yarn
}
