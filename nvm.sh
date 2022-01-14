nvm() {
  require symlink_exists $p/lib/nvm/zsh-loaded $p/zsh-loaded/nvm

  is_met() {
    bash -c "source $HOME/.nvm/nvm.sh && nvm"
  }

  meet() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  }
}
