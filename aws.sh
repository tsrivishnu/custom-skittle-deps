aws() {
  if [[ "$(uname)" = "Darwin" ]]; then
    require package_installed aws awscli awscli
  else
    require pip_package_installed aws awscli
  fi
}

