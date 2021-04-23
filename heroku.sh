heroku() {
  is_met() {
    which heroku
  }

  meet() {
    if [[ "$(uname)" = "Darwin" ]]; then
      brew tap heroku/brew
      require package_installed heroku
    version=1.5.1
    else
      curl https://cli-assets.heroku.com/install.sh | sh
    fi
  }
}
