rbenv() {
  deps_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  require repo_cloned https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  require symlink_exists $deps_path/lib/rbenv/zsh-loaded $deps_path/zsh-loaded/rbenv
}
