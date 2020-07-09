line_in_file() {
  line=$1
  file=$2

  log "Ensure +$line+ exists in +$file+"

  is_met() {
    # See https://stackoverflow.com/a/3557165/976880
    grep -Fxq "$line" $file
  }

  meet() {
    tee -a $file > /dev/null <<EOT

########################
# added by provisioning script
$line
########################
EOT
  }
}
