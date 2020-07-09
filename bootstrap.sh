bootstrap() {
  require package_manager
  require pip
  require zsh
  require git
  require vim
  require ack
  require tmux
  require package_installed wget
  require package_installed ag silversearcher-ag the_silver_searcher
  require fzf
  require package_installed htop
  require package_installed nethogs
  require package_installed tree
  require package_installed unzip

  require aws
  require terraform
  require packer
  require package_installed ansible

  require docker
  require docker-compose

  # For GPG agent forwarding via SSH
  # See: https://wiki.gnupg.org/AgentForwarding
  require line_in_file_with_sudo "StreamLocalBindUnlink yes" /etc/ssh/sshd_config
}
