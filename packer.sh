packer() {
  is_met() {
    which packer
  }

  meet() {
    version=1.5.1
    if [[ "$(uname)" = "Darwin" ]]; then
      package=packer_${version}_darwin_amd64.zip
    else
      package=packer_${version}_linux_amd64.zip
    fi
    curl "https://releases.hashicorp.com/packer/$version/$package" -o "packer_$version.zip"
    unzip -o packer_$version.zip
    sudo mv packer /usr/local/bin/
    rm packer_$version.zip
  }
}
