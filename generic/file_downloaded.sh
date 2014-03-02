file_downloaded() {
  file=$1
  url=$2
  path=(dirname $file)

  echolog "Ensure $url downloaded to $file"

  is_met() {
    [ -e $file ]
  }

  meet() {
    cd $path && { curl -O $url; cd -; }
  }

  require dir_exists $path
}
