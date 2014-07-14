zsh() {
  is_met() {
     [ $SHELL = "/bin/zsh" ]
  }

  meet() {
    sudo chsh -s /bin/zsh `whoami`
  }

  require symlink_exists $p/lib/zsh/zshrc.symlink $HOME/.zshrc
  require symlink_exists $p/lib/zsh/zsh-loaded $p/zsh-loaded/zsh
  require package_installed zsh
  require package_manager
}
