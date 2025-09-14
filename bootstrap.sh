bootstrap() {
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
  require package_installed nethogs
  require package_installed tree
  require package_installed unzip
  require package_installed jq
  require package_installed prettier

  require aws
  require azure
  require terraform
  require packer
  require package_installed ansible

  require docker
  require docker-compose
  # require heroku

  # For GPG agent forwarding via SSH
  # See: https://wiki.gnupg.org/AgentForwarding
  require line_in_file_with_sudo "StreamLocalBindUnlink yes" /etc/ssh/sshd_config

  # Disable password login via SSH
  require line_in_file_with_sudo "PermitRootLogin no" /etc/ssh/sshd_config
  require line_in_file_with_sudo "PasswordAuthentication no" /etc/ssh/sshd_config
  require line_in_file_with_sudo "PermitEmptyPasswords no" /etc/ssh/sshd_config
  require line_in_file_with_sudo "ChallengeResponseAuthentication no" /etc/ssh/sshd_config
}
