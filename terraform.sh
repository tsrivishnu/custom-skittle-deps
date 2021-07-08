terraform() {
  is_met() {
    which terraform
  }

  meet() {
    version=1.0.2
    if [[ "$(uname)" = "Darwin" ]]; then
      package=terraform_${version}_darwin_amd64.zip
    else
      package=terraform_${version}_linux_amd64.zip
    fi
    curl "https://releases.hashicorp.com/terraform/$version/$package" -o "terraform_$version.zip"
    unzip -o terraform_$version.zip
    sudo cp terraform /usr/local/bin/terraform$version
    sudo mv terraform /usr/local/bin/terraform
    rm terraform_$version.zip
  }
}
