zsh() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  is_met() {
     [ $SHELL = "/bin/zsh" ]
  }

  meet() {
    chsh -s /bin/zsh `whoami`
  }

  require symlink_exists $deps_path/lib/zsh/zshrc.symlink $HOME/.zshrc
  require symlink_exists $deps_path/lib/zsh/zsh-loaded $deps_path/zsh-loaded/zsh
  require package_installed zsh
  require package_manager
}
