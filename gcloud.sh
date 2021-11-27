# See: https://cloud.google.com/sdk/docs/quickstart
gcloud() {
  is_met() {
    which gcloud
  }

  meet() {
    version=355.0.0

    require python

    if [[ "$(uname)" = "Darwin" ]]; then
      package=google-cloud-sdk-${version}-darwin-x86_64.tar.gz
    else
      package=google-cloud-sdk-${version}-linux-x86_64.tar.gz
    fi

    curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$package" -o "gcloud_$version.tar.gz"
    sudo tar -xzf gcloud_$version.tar.gz --directory /usr/local/
    require symlink_exists /usr/local/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud
    rm gcloud_$version.tar.gz
  }
}

