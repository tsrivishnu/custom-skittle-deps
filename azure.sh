azure() {

  is_met() {
    which az
  }

  meet() {
    if [[ "$(uname)" = "Darwin" ]]; then
      brew install azure-cli
    else
      # see: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
      sudo apt update
      sudo apt-get -y install ca-certificates curl apt-transport-https lsb-release gnupg
      curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main"
      sudo apt update
      sudo apt install -y azure-cli
    fi
  }
}
