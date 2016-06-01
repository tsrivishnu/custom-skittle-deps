gvim() {
  require package_installed gvim vim-gnome
  require symlink_exists $p/lib/gvim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  require backups_folder

  backups_folder(){
    vim_backup_dir=$HOME/.vim/backup
    is_met(){
      ls $vim_backup_dir
    }

    meet(){
      mkdir $vim_backup_dir
    }
  }
}
