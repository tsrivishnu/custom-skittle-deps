rbenv() {
  require repo_cloned https://github.com/sstephenson/rbenv.git ~/.rbenv
  require repo_cloned https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  require symlink_exists $p/lib/rbenv/zsh-loaded $p/zsh-loaded/rbenv
}
