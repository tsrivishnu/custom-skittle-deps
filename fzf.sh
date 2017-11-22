fzf() {
  is_met() {
    ls $HOME/.fzf.*
  }

  meet() {
    $HOME/.fzf/install --key-bindings --completion --no-update-rc
  }

  require repo_cloned https://github.com/junegunn/fzf.git $HOME/.fzf
  require symlink_exists $p/lib/fzf/zsh-loaded $p/zsh-loaded/fzf
}
