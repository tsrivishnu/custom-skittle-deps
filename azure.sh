azure() {

  is_met() {
    which az
  }

  meet() {
    # see: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
    sudo apt update
    sudo apt-get -y install ca-certificates curl apt-transport-https lsb-release gnupg
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
    sudo apt update
    sudo apt install -y azure-cli
  }
}
