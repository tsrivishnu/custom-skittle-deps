gvim() {
  require package_installed gvim vim-gnome
  require symlink_exists $p/lib/gvim/vimrc.symlink $HOME/.vimrc
  require repo_cloned https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  require vim_alias
  require backups_folder

  vim_alias(){
    alias_text="vim='gvim'"

    is_met(){
      #TODO: Probably there is a much better way to find if the alias exists.
      less $HOME/.bashrc | grep $alias_text
    }

    meet(){
      echo "alias $alias_text" >> $HOME/.bashrc
      source $HOME/.bashrc
    }
  }

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
